import 'package:matchable_builder/matchable_builder.dart';

class ProxiableCache extends Cache {
  final List<String> names;

  ProxiableCache({
    this.names,
  });

  static ProxiableCache fromJson(Map map) {
    return ProxiableCache(
      names: List<String>.from(map["names"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "names": this.names,
    };
  }
}
