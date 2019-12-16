import 'package:proxiable/proxiable.dart';
import 'package:exporter/exporter.dart';

@Export()
@Proxiable()
class Animal {
  void walk() {
    print("${this.runtimeType} walks");
  }
}
