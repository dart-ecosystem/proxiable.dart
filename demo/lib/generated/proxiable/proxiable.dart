// Basic Imports
import 'package:demo/generated/exporter/exporter.dart';
import 'package:proxiable/proxiable.dart';
import 'package:proxiable/src/runtime/proxied.dart';
// Generated Proxied Classes
class $AnimalProxy with Proxied implements Animal {}
initializeProxiable() {
Proxy.proxyMapping.register(Animal, () => $AnimalProxy());
}