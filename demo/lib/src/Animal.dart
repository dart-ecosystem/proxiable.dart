import 'package:proxiable/proxiable.dart';

@proxiable
class Animal {
  void walk() {
    print("${this.runtimeType} walks");
  }
}
