import 'package:matchable_builder/matchable_builder.dart';

abstract class ClassElementUtils {
  static String getClassName(ClassElement classElement) {
    return classElement.name;
  }
}
