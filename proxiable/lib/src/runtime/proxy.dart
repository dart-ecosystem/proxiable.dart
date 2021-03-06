import 'package:proxiable/src/runtime/invocation_handler.dart';
import 'package:proxiable/src/runtime/proxied.dart';
import 'package:proxiable/src/runtime/proxy_mapping.dart';

class Proxy {
  static ProxyMapping proxyMapping = ProxyMapping();

  InvocationHandler h;

  Proxy._();

  Proxy(InvocationHandler h) {
    assert(h != null, "InvocationHandler can NOT be null");
    this.h = h;
  }

  static Object newProxyInstance(
    Type loader,
    InvocationHandler h,
  ) {
    assert(h != null, "InvocationHandler can NOT be null.");

    ProxyCreator proxiedType = proxyMapping.get(loader);
    assert(
      proxiedType != null,
      "$loader is NOT proxiable. Did you forget Annotate it with @Proxiable?",
    );
//    ClassMirror classMirror = proxiable.reflectType(proxiedType);
    return (proxiedType() as Proxied)
      ..invocationHandler = h
      ..proxiedType = loader;
  }
}
