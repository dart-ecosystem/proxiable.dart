import 'dart:async';

import 'package:build/build.dart';
import 'package:build/src/builder/build_step.dart';
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
}
