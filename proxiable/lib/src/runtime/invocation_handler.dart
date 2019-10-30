import 'package:reflectable/reflectable.dart';

abstract class InvocationHandler {
  void set(
    Object proxy,
    VariableMirror variable,
    Object value,
  );

  Object get(
    Object proxy,
    VariableMirror variable,
  );

  Object invoke(
    Object proxy,
    MethodMirror method,
    List<Object> args, [
    Map<Symbol, dynamic> namedArgs,
  ]);
}
