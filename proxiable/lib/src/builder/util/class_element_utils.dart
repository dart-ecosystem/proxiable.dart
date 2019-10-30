import 'package:analyzer/dart/element/element.dart';

abstract class ClassElementUtils {
  static String getClassName(ClassElement classElement) {
    return classElement.name;
  }
}
