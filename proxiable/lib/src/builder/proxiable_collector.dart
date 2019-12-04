import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:proxiable/src/annotation/proxiable.dart';
import 'package:proxiable/src/builder/cache/proxiable_cache.dart';
import 'package:proxiable/src/builder/util/class_element_constructor_utils.dart';
import 'package:source_gen/source_gen.dart';

class ProxiableCollector extends Builder {
  static TypeChecker typeChecker = TypeChecker.fromRuntime(Proxiable);

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    List<String> classNames = [];

    // read classNames
    LibraryReader libReader = LibraryReader(await buildStep.inputLibrary);
    Iterable<Element> elements = libReader.annotatedWith(typeChecker).map((e) => e.element);
    for (var element in elements) {
      if (element is! ClassElement) {
        continue;
      }

      if (!ClassElementConstructorUtils.containsDefaultConstructor(element as ClassElement)) {
        continue;
      }

      classNames.add(element.name);
    }

    if (classNames.isEmpty) {
      return;
    }

    // write to cache
    var cache = ProxiableCache(names: classNames);
    AssetId outputId = buildStep.inputId.changeExtension(".proxiable.json");
    await buildStep.writeAsString(outputId, cache.toString());
  }

  @override
  Map<String, List<String>> get buildExtensions => {
        '.dart': ['.proxiable.json']
      };
}
