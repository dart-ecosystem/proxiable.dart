library demo;

import 'package:demo/src/Animal.dart';
import 'package:proxiable/proxiable.dart';
import 'package:demo/main.proxiable.dart';

@EnableProxiable()
class Entry {}

void main() {
  initializeProxiable();
  Animal animal = Proxy.newProxyInstance(
    Animal,
    DefaultInvocationHandler(Animal()),
  );
  animal.walk();
  print(animal.runtimeType);
  print(animal.toString());
}
