// Basic Imports
import 'package:proxiable/proxiable.dart';
import 'package:proxiable/src/runtime/proxied.dart';
import "package:reflectable/src/reflectable_builder_based.dart" as r;

// Generated Proxied Classes Imports
import "package:demo/src/Animal.dart";

// Generated Proxied Classes
class $AnimalProxy with Proxied implements Animal {
}

// Generated Initializer
initializeProxiable() {
  Proxy.proxyMapping.register(Animal, () => $AnimalProxy());
}
