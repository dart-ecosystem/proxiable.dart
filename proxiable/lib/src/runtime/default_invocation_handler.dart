import 'package:proxiable/src/annotation/proxiable.dart';
import 'package:proxiable/src/runtime/invocation_handler.dart';
import 'package:reflectable/reflectable.dart';
import 'package:reflectable_annotation/reflectable_annotation.dart';

class DefaultInvocationHandler implements InvocationHandler {
  Object instance;

  InstanceMirror instanceMirror;

  DefaultInvocationHandler(this.instance) {
    instanceMirror = reflected.reflect(instance);
  }

  @override
  Object invoke(
    Object proxy,
    MethodMirror method,
    List<Object> args, [
    Map<Symbol, dynamic> namedArgs,
  ]) {
    return instanceMirror.invoke(method.simpleName, [], namedArgs);
  }

  @override
  void set(Object proxy, VariableMirror variable, Object value) {
    instanceMirror.invokeSetter(variable.simpleName, value);
  }

  @override
  Object get(Object proxy, VariableMirror variable) {
    return instanceMirror.invokeGetter(variable.simpleName);
  }
}
