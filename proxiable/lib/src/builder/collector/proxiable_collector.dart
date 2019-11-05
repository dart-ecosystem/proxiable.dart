import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:proxiable/src/annotation/proxiable.dart';
import 'package:proxiable/src/builder/data/cache_object.dart';
import 'package:proxiable/src/builder/util/annotation_utils.dart';
import 'package:proxiable/src/builder/util/build_step_utils.dart';
import 'package:proxiable/src/builder/util/cache_utils.dart';
import 'package:proxiable/src/builder/util/class_element_utils.dart';
import 'package:source_gen/source_gen.dart';

class ProxiableCollector extends GeneratorForAnnotation<UseProxiable> {
  @override
  generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    String className = AnnotationUtils.getStringValue(annotation, "name") ??
        ClassElementUtils.getClassName(element);
    String filePath = BuildStepUtils.getPath(buildStep);

    CacheObject cache = CacheObject(name: className, path: filePath);
    return CacheUtils.encode(cache.toString());
  }
}
