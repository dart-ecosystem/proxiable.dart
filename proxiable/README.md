# Proxiable
Proxy provides static methods for creating dynamic proxy classes and instances, 
and it is also the superclass of all dynamic proxy classes created by those methods.

## Read More
[Java Proxy Class](https://docs.oracle.com/javase/7/docs/api/java/lang/reflect/Proxy.html)

## Provided Features
Proxy.newProxyInstance: creates proxy instance, slightly different from java Proxy.

InvocationHandler: contract that your handler should implements;

DefaultInvocationHandler: it calls original method, getter or setter.

## Usage
#### 1. Initialization in `main.dart`
You do NOT need to initialize reflectable.
```dart
// file: main.dart
import "main.proxiable.dart";

void main() {
  initializeProxiable();
}
```

#### 2. Create and use Proxied instance
```dart
// file: main.dart
import "package:proxiable/proxiable.dart";

// mark the class with @proxiable is required
@proxiable
class Animal {
  void walk() {
    print("Animal is waling.");
  }
}

void main() {
  Animal animal = Proxiable(
    Animal,
    DefaultInvocationHandler(Animal()),
  );
  animal.walk(); // print: Animal is waling.
}
```
