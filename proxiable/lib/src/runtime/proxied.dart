import 'package:proxiable/src/annotation/proxiable.dart';
import 'package:proxiable/src/annotation/reflected.dart';
import 'package:proxiable/src/annotation/reflected.dart';
import 'package:proxiable/src/runtime/invocation_handler.dart';
import 'package:reflectable/reflectable.dart';

class Proxied {
  InvocationHandler invocationHandler;

  Type proxiedType;

  @override
  Type get runtimeType => proxiedType;

  String toString() {
    if (super.toString() == "Instance of '\$${this.proxiedType}Proxy'") {
      return "Instance of '${this.runtimeType}'";
    }
    return super.toString();
  }

  @override
  dynamic noSuchMethod(Invocation invocation) {
    String memberName = invocation.memberName
        .toString()
        .substring(8, invocation.memberName.toString().length - 2)
        .replaceAll("=", "");

    if (!invocation.isAccessor) {
      var methodMirror =
          (reflected.reflectType(proxiedType) as ClassMirror).declarations[memberName];
      return invocationHandler.invoke(
        this,
        methodMirror,
        invocation.positionalArguments,
        invocation.namedArguments,
      );
    }

    VariableMirror variableMirror =
        (reflected.reflectType(proxiedType) as ClassMirror).declarations[memberName];

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
