import 'package:demo/src/AbstractAnimal.dart';
import 'package:proxiable/proxiable.dart';

@Proxiable()
class Animal extends AbstractAnimal {
  void walk() {
    print("${this.runtimeType} walks");
  }
}
