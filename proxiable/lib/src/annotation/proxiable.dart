import 'package:reflectable/reflectable.dart';

class Proxiable extends Reflectable {
//  final String name;

  const Proxiable()
      : super(
          newInstanceCapability,
          declarationsCapability,
          instanceInvokeCapability,
        );
}

const proxiable = Proxiable();
