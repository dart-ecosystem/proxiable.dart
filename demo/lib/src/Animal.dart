import 'package:proxiable/proxiable.dart';

@Proxiable()
class Animal {
  void walk() {
    print("${this.runtimeType} walks");
  }
}
