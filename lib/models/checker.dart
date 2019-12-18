library checker;

import 'package:gobble/models/trie.dart';
export 'package:gobble/models/trie.dart' show Trie;
import 'package:flutter/services.dart' show rootBundle;


class Checker {
  final Trie<String> _words;
  final List<List<String>> _grid;
  final List<List> _visited = new List.generate(4, (_) => new List.filled(4, false));
  final List<String> _found = new List<String>();

  List<String> _dictionary;


  Checker(this._words, this._grid) {
    loadDictionary();
  }

  _solve(int x, int y, Trie inProgress) {
    final Trie<String> nextStep = inProgress.nodeFor(_grid[x][y]);

    if (nextStep != null) {
      if (nextStep.value != null) {
        if (isWord(nextStep.value)) {
          print("Found word: ${nextStep.value}");
          _found.add(nextStep.value);
          }
        }

        // (x,y) represents current position
        // visited indicates whether the char has been visited in this word.
        _visited[x][y] = true;

        for (var _x = -1; _x < 2; _x++) {
          final nX = x + _x;
          if (nX < 0 || nX > 3) continue;
          for (var _y = -1; _y < 2; _y++) {
            if (_x == 0 && _y == 0) continue;
            final nY = y + _y;
            if (nY < 0 || nY > 3) continue;
            if (_visited[nX][nY] == true) continue;
            _solve(nX, nY, nextStep); // recurse
          }
        }

        // next word
        _visited[x][y] = false;
      }
    }

  Iterable<String> findAll() {
    for (var x = 0; x < 4; x++) {
      for (var y = 0; y < 4; y++) {
        _solve(x, y, _words);
      }
    }

    return _found;
  }

  // bool isWord(String possibleWord) {
  //   if (_dictionary.contains(possibleWord)) {
  //     print('$possibleWord is a word!');
  //     return true;
  //   }
  //   print('$possibleWord is not a word.');
  //   return false;
  // }


  // // get words from bin/words.txt
  // void loadDictionary() async {
  //   String contents = await loadAsset();
  //   contents.split("\n").forEach((line) => this._words[line] = line);
  // }

  // Future<String> loadAsset() async {
  //   return await rootBundle.loadString('assets/words.txt');
  // }
}