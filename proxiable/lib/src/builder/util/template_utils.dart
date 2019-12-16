abstract class TemplateUtils {
  static String generateString(String packageName, List<String> classNames) {
    return [
      "// Basic Imports",
      "import 'package:$packageName/generated/exporter/exporter.dart';",
      "import 'package:proxiable/proxiable.dart';",
      "import 'package:proxiable/src/runtime/proxied.dart';",
      "// Generated Proxied Classes",
      ...classNames
          .map((className) => "class ${className}Proxy with Proxied implements $className {}"),
      "initializeProxiable() {",
      ...classNames.map(
          (className) => "Proxy.proxyMapping.register(${className}, () => ${className}Proxy());"),
      "}",
    ].join("\n");
  }
}
