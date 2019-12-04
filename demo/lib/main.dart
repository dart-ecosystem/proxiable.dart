library demo;

import 'package:demo/generated/proxiable.dart';
import 'package:demo/main.reflectable.dart';
import 'package:demo/src/Animal.dart';
import 'package:proxiable/proxiable.dart';

@EnableProxiable()
class Entry {}

void main() {
  initializeReflectable();
  initializeProxiable();
  Animal animal = Proxy.newProxyInstance(
    Animal,
    DefaultInvocationHandler(Animal()),
  );
  animal.walk();
  print(animal.runtimeType);
  print(animal.toString());
}
