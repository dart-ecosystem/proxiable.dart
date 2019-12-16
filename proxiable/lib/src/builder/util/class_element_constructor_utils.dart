import 'package:matchable_builder/matchable_builder.dart';

abstract class ClassElementConstructorUtils {
  static bool containsDefaultConstructor(ClassElement classElement) {
    return classElement.constructors.any((e) => e.isDefaultConstructor);
  }
}
