import 'package:build/build.dart';
import 'package:proxiable/src/builder/proxiable_collector.dart';
import 'package:proxiable/src/builder/proxiable_combiner.dart';
import 'package:source_gen/source_gen.dart';

Builder proxiableCollector(BuilderOptions options) => LibraryBuilder(
      ProxiableCollector(),
      generatedExtension: '.proxiable_cache.dart',
    );

Builder proxiableCombiner(BuilderOptions options) => ProxiableCombiner();
