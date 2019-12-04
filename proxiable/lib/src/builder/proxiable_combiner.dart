import 'dart:async';
import 'dart:convert';

import 'package:build/build.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:glob/glob.dart';
import 'package:proxiable/src/builder/cache/proxiable_cache.dart';
import 'package:proxiable/src/builder/util/template_utils.dart';

class ProxiableCombiner extends Builder {
  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final List<String> proxiableCache = [];
    final String packageName = buildStep.inputId.package;

    final proxiableCacheAssetIds = await buildStep
        .findAssets(
          Glob("**/*.proxiable.json"),
        )
        .toList();

    for (var assetId in proxiableCacheAssetIds) {
      proxiableCache.add((await buildStep.readAsString(assetId)).trim());
    }

    final decodedProxiableCache =
        proxiableCache.map((e) => json.decode(e)).map((e) => ProxiableCache.fromJson(e)).toList();

    List<String> classNames = [];

    for (var cache in decodedProxiableCache) {
      classNames.addAll(cache.names);
    }

    // write to file
    String content = TemplateUtils.generateString(classNames);
    String package = buildStep.inputId.package;
    AssetId outputId = AssetId(package, "lib/generated/proxiable.dart");
    await buildStep.writeAsString(outputId, content);
  }

  @override
  Map<String, List<String>> get buildExtensions => {
        "main.dart": ["/generated/proxiable.dart"],
      };
}
