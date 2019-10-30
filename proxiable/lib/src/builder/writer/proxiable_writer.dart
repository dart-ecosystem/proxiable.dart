import 'dart:convert';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:glob/glob.dart';
import 'package:mustache/mustache.dart';
import 'package:proxiable/src/annotation/enable_proxable.dart';
import 'package:proxiable/src/builder/data/cache_object.dart';
import 'package:proxiable/src/builder/template/proxiable_template.dart';
import 'package:proxiable/src/builder/util/cache_utils.dart';
import 'package:source_gen/source_gen.dart';

class ProxiableWriter extends GeneratorForAnnotation<EnableProxiable> {
  @override
  generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {
    final List<String> proxiableCache = [];
    final String packageName = buildStep.inputId.package;

    final proxiableCacheAssetIds = await buildStep
        .findAssets(
          Glob("**/*.proxiable_cache.dart"),
        )
        .toList();

    for (var assetId in proxiableCacheAssetIds) {
      proxiableCache.add((await buildStep.readAsString(assetId)).trim());
    }

    final decodedProxiableCache = proxiableCache
        .map((e) => CacheUtils.decode(e))
        .map((e) => e.first)
        .map((e) => json.decode(e))
        .map((e) => CacheObject.fromJson(e))
        .toList();

    return Template(proxiable_template).renderString({
      "caches": decodedProxiableCache,
      "packageName": packageName,
    });
  }
}
