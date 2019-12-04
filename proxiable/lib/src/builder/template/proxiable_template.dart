const String proxiable_template = r'''
// Basic Imports
import 'package:proxiable/proxiable.dart';
import 'package:proxiable/src/runtime/proxied.dart';
import "package:reflectable/src/reflectable_builder_based.dart" as r;

// Generated Proxied Classes Imports
{{# caches }}
import "{{{path}}}";
{{/ caches }}

// Generated Proxied Classes
{{# caches }}
class ${{{name}}}Proxy with Proxied implements {{{name}}} {
}
{{/ caches }}

// Generated Initializer
initializeProxiable() {
  {{# caches }}
  Proxy.proxyMapping.register({{{name}}}, () => ${{{name}}}Proxy());
  {{/ caches }}
}
''';
