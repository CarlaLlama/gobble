library trie;
/**
 * Trie Library
 * author: Seth Ladd
 * http://blog.sethladd.com/2013/03/solving-boggle-with-dart.html
 */

class Trie<T> {
  T value;
  final Map<int, Trie<T>> map;

  Trie() : map = new Map<int, Trie<T>>();

  T operator [](String key) {
    var node = this;
    for (int i = 0; i < key.length; i++) {
      int char = key.codeUnitAt(i);

      node = node.map[char];
      if (node == null) {
        return null;
      }
    }
    return node.value;
  }

  Trie<T> nodeFor(String character) {
    return map[character.codeUnitAt(0)];
  }

  // Defined index access operator []
  void operator []=(String key, T value) {
    var node = this;
    for (int i = 0; i < key.length; i++) {
      int char = key.codeUnitAt(i);

      var current = node;
      node = node.map[char];
      if (node == null) {
        current.map[char] = node = new Trie<T>();
      }
    }
    node.value = value;
  }
}