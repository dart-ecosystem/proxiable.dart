import 'dart:convert';

class CacheObject {
  String name;
  String path;

  CacheObject({
    this.name,
    this.path,
  });

  CacheObject.fromJson(Map map) {
    this.name = map["name"];
    this.path = map["path"];
  }

  Map toJson() {
    return {
      "name": this.name,
      "path": this.path,
    };
  }

  @override
  String toString() {
    return json.encode(this);
  }
}
