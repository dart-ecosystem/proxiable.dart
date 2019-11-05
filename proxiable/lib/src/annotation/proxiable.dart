import 'package:reflectable/reflectable.dart';

class Proxiable extends Reflectable implements UseProxiable {
//  final String name;

  const Proxiable()
      : super(
          newInstanceCapability,
          declarationsCapability,
          instanceInvokeCapability,
        );
}

const proxiable = Proxiable();

abstract class UseProxiable {}
