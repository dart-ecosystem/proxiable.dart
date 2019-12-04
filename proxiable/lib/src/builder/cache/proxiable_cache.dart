import 'dart:convert';

class ProxiableCache {
  List<String> names;

  ProxiableCache({
    this.names,
  });

  ProxiableCache.fromJson(Map map) {
    this.names = List<String>.from(map["names"]);
  }

  Map toJson() {
    return {
      "names": this.names,
    };
  }

  @override
  String toString() {
    return json.encode(this);
  }
}
