const String proxiable_template = r'''
// Basic Imports
import 'package:{{{packageName}}}/main.reflectable.dart';
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
  try {
    r.data;
  } catch(ignored) {
    initializeReflectable();
  }
  {{# caches }}
  Proxy.proxyMapping.register({{{name}}}, () => ${{{name}}}Proxy());
  {{/ caches }}
}
''';
