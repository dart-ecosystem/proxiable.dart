library demo;

import 'package:demo/main.reflectable.dart';
import 'package:demo/src/Animal.dart';
import 'package:proxiable/proxiable.dart';

void main() {
  initializeReflectable();
  Animal animal = Proxy.newProxyInstance(
    Animal,
    DefaultInvocationHandler(Animal()),
  );
  animal.walk();
  print(animal.runtimeType);
  print(animal.toString());
}
