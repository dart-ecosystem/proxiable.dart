class ProxyMapping {
  Map<Type, ProxyCreator> dict = {};

  void register(Type original, ProxyCreator proxied) {
    dict[original] = proxied;
  }

  ProxyCreator get(Type original) {
    return dict[original];
  }
}

typedef Object ProxyCreator();
