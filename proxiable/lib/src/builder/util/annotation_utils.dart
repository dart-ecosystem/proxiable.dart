import 'package:source_gen/source_gen.dart';

abstract class AnnotationUtils {
  static String getStringValue(ConstantReader reader, String key) {
    return reader.peek("name")?.stringValue;
  }
}
