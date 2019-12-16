import 'package:build/build.dart';
import 'package:proxiable/src/builder/proxiable_collector.dart';
import 'package:proxiable/src/builder/proxiable_combiner.dart';

Builder proxiableCollector(BuilderOptions options) => ProxiableCollector(options);

Builder proxiableCombiner(BuilderOptions options) => ProxiableCombiner(options);
