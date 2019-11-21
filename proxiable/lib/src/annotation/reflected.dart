import 'package:proxiable/src/annotation/proxiable.dart';
@GlobalQuantifyMetaCapability(Proxiable, reflected)
import 'package:reflectable/reflectable.dart';

class Reflected extends Reflectable {
  const Reflected()
      : super(
          newInstanceCapability,
          declarationsCapability,
          instanceInvokeCapability,
        );
}

const reflected = Reflected();
