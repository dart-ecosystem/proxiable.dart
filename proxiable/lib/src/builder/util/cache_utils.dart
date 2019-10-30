abstract class CacheUtils {
  static String encode(String value) {
    return _encodeString(value);
  }

  static List<String> decode(String content) {
    return content
        .split("-----end-----")
        .where((e) => e != "" && e != null)
        .map(_decodeString)
        .map(
          (e) => e
              .split("\n")
              .map((line) => line == "null" ? null : e)
              .toList()
              .join("\n"),
        )
        .toList();
  }

  static String _encodeString(String content) {
    return content
        .split("\n")
        .where((e) => e != "")
        .map((e) => "//> $e")
        .join("\n");
  }

  static String _decodeString(String content) {
    return content
        .split("\n")
        .where((e) => e.startsWith("//> "))
        .map((e) => e.replaceFirst("//> ", ""))
        .join("\n");
  }

  static String cleanUp(String content) {
    return content.split("\n").where((e) => e.startsWith("//> ")).join("\n");
  }
}
