library checker;

import 'package:trie/trie.dart';
import 'package:flutter/services.dart' show rootBundle;


class Checker {
  Trie _words;
  final List<List<String>> _grid;
  final List<List> _visited = new List.generate(4, (_) => new List.filled(4, false));
  final List<String> _found = new List<String>();

  List<String> _dictionary = new List<String>();


  Checker(this._grid) {
    this._words = new Trie();
    loadDictionary();
  }

  List<String> getFoundWords() {
    return this._found;
  }

  bool isWord(String word){
    if(this._found.contains(word)){
      print("IS A WORD! " + word);
      return true;
    }
    return false;
  }

  _solve(int x, int y, Trie inProgress, String currentWord) {
    if (inProgress != null) {

      // visited indicates whether the char has been visited in this word.
      _visited[x][y] = true;

      // find neighbours
      for (var _x = -1; _x < 2; _x++) {
        final nX = x + _x;
        if (nX < 0 || nX > 3) continue;
        for (var _y = -1; _y < 2; _y++) {
          if (_x == 0 && _y == 0) continue;
          final nY = y + _y;
          if (nY < 0 || nY > 3) continue;
          if (_visited[nX][nY] == true) continue;
          var allWordsWithPrefix = inProgress.getAllWordsWithPrefix(currentWord + this._grid[nX][nY]);
          if(allWordsWithPrefix.isEmpty) continue;
          if(allWordsWithPrefix.contains(currentWord + this._grid[nX][nY])){
            //checks
            if(!this._found.contains(currentWord + this._grid[nX][nY]) && ((currentWord + this._grid[nX][nY]).length > 2)) {
              this._found.add(currentWord + this._grid[nX][nY]);
            }
          }
          _solve(nX, nY, inProgress, currentWord + this._grid[nX][nY]); // recurse
        }
      }

      // next word
      _visited[x][y] = false;
    }
  }

  Iterable<String> findAll() {
    print(this._words);
    for (var x = 0; x < 4; x++) {
      for (var y = 0; y < 4; y++) {
        var dictionaryTrie = loadTrieForLetter(this._grid[x][y]);
        _solve(x, y, dictionaryTrie, this._grid[x][y]);
      }
    }

    return _found;
  }

  Trie loadTrieForLetter(startsWith){
    final List<String> possibleWords = this._dictionary.where((word) => word.startsWith(startsWith)).toList();
    var dictionaryTrie = new Trie.list(possibleWords);
    return dictionaryTrie;
  }

  // get words from bin/words.txt
  void loadDictionary() async {
    String contents = await loadAsset();
    contents.split("\n").forEach((line) => this._dictionary.add(line));
    var results = findAll();
    print("RESULTS: " + results.toString());
  }

  Future<String> loadAsset() async {
    return await rootBundle.loadString('assets/words.txt');
  }
}