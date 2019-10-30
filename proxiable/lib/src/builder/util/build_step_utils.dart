import 'package:build/build.dart';

abstract class BuildStepUtils {
  static String getPath(BuildStep buildStep) {
    return buildStep.inputId.uri.toString();
  }
}
