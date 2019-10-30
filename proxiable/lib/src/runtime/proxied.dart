import 'package:proxiable/src/annotation/proxiable.dart';
import 'package:proxiable/src/runtime/invocation_handler.dart';
import 'package:reflectable/reflectable.dart';

class Proxied {
  InvocationHandler invocationHandler;

  Type proxiedType;

  @override
  dynamic noSuchMethod(Invocation invocation) {
    String memberName = invocation.memberName
        .toString()
        .substring(8, invocation.memberName.toString().length - 2)
        .replaceAll("=", "");

    if (!invocation.isAccessor) {
      var methodMirror = (proxiable.reflectType(proxiedType) as ClassMirror)
          .declarations[memberName];
      return invocationHandler.invoke(
        this,
        methodMirror,
        invocation.positionalArguments,
        invocation.namedArguments,
      );
    }

    VariableMirror variableMirror =
        (proxiable.reflectType(proxiedType) as ClassMirror)
            .declarations[memberName];

    if (invocation.isSetter) {
      invocationHandler.set(
        this,
        variableMirror,
        invocation.positionalArguments.first,
      );
      return null;
    } else if (invocation.isGetter) {
      return invocationHandler.get(
        this,
        variableMirror,
      );
    }
  }
}
