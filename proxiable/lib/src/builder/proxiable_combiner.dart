import 'dart:async';
import 'dart:convert';

import 'package:build/build.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:glob/glob.dart';
import 'package:matchable_builder/matchable_builder.dart';
import 'package:proxiable/src/builder/proxiable_cache.dart';
import 'package:proxiable/src/builder/util/template_utils.dart';

class ProxiableCombiner extends MatchableCombiningBuilder {
  ProxiableCombiner(BuilderOptions options) : super(options);

  @override
  Map<String, List<String>> get buildExtensions => {
        "proxiable.locator": ['proxiable.dart'],
      };

  @override
  Map<String, CacheResolver> get resolveCaches => {
        "**/*.proxiable.json": ProxiableCache.fromJson,
      };

  @override
  FutureOr<void> generate(Map<String, List<Object>> resolvedCaches, BuildStep buildStep) async {
    final List<ProxiableCache> caches =
        List<ProxiableCache>.from(resolvedCaches["**/*.proxiable.json"]);
    if (caches.isEmpty) {
      return;
    }
    final String packageName = buildStep.inputId.package;
    List<String> classNames = [];
    caches.forEach((c) => classNames.addAll(c.names));
// write to file
    final String content = TemplateUtils.generateString(packageName, classNames);
    final AssetId outputId = buildStep.inputId.changeExtension(".dart");
    await buildStep.writeAsString(outputId, content);
  }

//  @override
//  FutureOr<void> build(BuildStep buildStep) async {
//    final List<String> proxiableCache = [];
//    final String packageName = buildStep.inputId.package;
//
//    final proxiableCacheAssetIds = await buildStep
//        .findAssets(
//          Glob("**/*.proxiable.json"),
//        )
//        .toList();
//
//    for (var assetId in proxiableCacheAssetIds) {
//      proxiableCache.add((await buildStep.readAsString(assetId)).trim());
//    }
//
//    final decodedProxiableCache =
//        proxiableCache.map((e) => json.decode(e)).map((e) => ProxiableCache.fromJson(e)).toList();
//
//    List<String> classNames = [];
//
//    for (var cache in decodedProxiableCache) {
//      classNames.addAll(cache.names);
//    }
//
//    // write to file
//    String content = TemplateUtils.generateString(packageName, classNames);
//    AssetId outputId = buildStep.inputId.changeExtension(".dart");
//    await buildStep.writeAsString(outputId, content);
//  }
}
