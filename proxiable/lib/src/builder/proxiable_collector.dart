import 'dart:async';

import 'package:build/build.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:matchable_builder/matchable_builder.dart';
import 'package:proxiable/src/annotation/proxiable.dart';
import 'package:proxiable/src/builder/proxiable_cache.dart';

class ProxiableCollector extends MatchableBuilder {
  @override
  Matcher get matcher => Matcher.and([
        ElementTypeMatcher<Proxiable>(),
        ClassElementMatcher(),
        FileSchemaMatcher("package"),
      ]);

  @override
  Map<String, List<String>> get buildExtensions => {
        '.dart': ['.proxiable.json']
      };

  ProxiableCollector(BuilderOptions options) : super(options);

  @override
  FutureOr<void> generate(List<Element> elements, BuildStep buildStep) async {
    final classNames = elements.map((e) => e.name).toList();
    // write to cache
    final cache = ProxiableCache(names: classNames);
    final outputId = buildStep.inputId.changeExtension(".proxiable.json");
    await buildStep.writeAsString(outputId, cache.toString());
  }
}
