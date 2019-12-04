import 'package:analyzer/dart/element/element.dart';

abstract class ClassElementConstructorUtils {
  static bool containsDefaultConstructor(ClassElement classElement) {
    return classElement.constructors.any((e) => e.isDefaultConstructor);
  }
}
