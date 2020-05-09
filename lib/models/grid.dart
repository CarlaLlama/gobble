import 'package:gobble/constants.dart';

class Grid {
  String tiles;
  List<String> words;

  /// Returns true if the path is a word and it exists on the board.
  Future<bool> attemptPathAsWord(List<int> path) async {
    if (path == null) {
      // Invalid path.
      return false;
    }
    String word = stringFromPath(path);
    if (word == '') {
      // Empty word.
      return false;
    }
    if (!words.contains(word)) {
      // Invalid word.
      return false;
    }
    return true;
  }

  String stringFromPath(List<int> path) {
    String s = '';
    for (int i = 0; i < path.length; i++) {
      int row = GameConstants.rowFromIndex(path[i]);
      int column = GameConstants.columnFromIndex(path[i]);
      String ch = getChar(row, column);
      s += ch;
    }
    return s;
  }

  String wordForPath(List<int> path) {
    if (path == null || path.length == 0) {
      return '';
    }
    String r = '';
    for (int i = 0; i < path.length; i++) {
      int index = path[i];
      int row = GameConstants.rowFromIndex(index);
      int column = GameConstants.columnFromIndex(index);
      String tileCharacter = getChar(row, column);
      r += tileCharacter;
      if (tileCharacter == 'Q') {
        r += 'U';
      }
    }
    return r;
  }

  String getChar(int i, int j) {
    int index = i * 4 + j;
    return tiles[index];
  }

  bool stringInGrid(String search, Set<List<int>> paths) {
    List<String> tileStrings = GameConstants.convertStringToTileList(search);
    // Not there.
    if (tileStrings.length == 0) {
      return false;
    }
    if (paths == null) {
      paths = new Set<List<int>>();
    }
    bool r = false;
    for (int i = 0; i < GameConstants.BoardDimension; i++) {
      for (int j = 0; j < GameConstants.BoardDimension; j++) {
        bool v = _findInGridAt(i, j, tileStrings, paths);
        r = r || v;
      }
    }
    return r;
  }

  Future<bool> _findInGridWorker(List<String> tiles, int index, int i, int j,
    List<List<bool>> visited, List<int> path, Set<List<int>> paths) async {
    // Do bounds check.
    if (i < 0 || j < 0 || i >= 4 || j >= 4) {
      return false;
    }
    if (visited[i][j] == true) {
      return false;
    }
    if (getChar(i,j) != tiles[index]) {
      return false;
    }
    path.add(i*4+j);
    if (tiles.length == index+1) {
      // Valid.
      paths.add(new List.from(path));
      path.removeLast();
      return true;
    }
    visited[i][j] = true;
    // DFS.
    bool r = false;
    // Left side.
    r = await _findInGridWorker(tiles, index+1, i-1, j-1, visited, path, paths) || r;
    r = await _findInGridWorker(tiles, index+1, i-1, j, visited, path, paths) || r;
    r = await _findInGridWorker(tiles, index+1, i-1, j+1, visited, path, paths) || r;
    // Right side.
    r = await _findInGridWorker(tiles, index+1, i+1, j-1, visited, path, paths) || r;
    r = await _findInGridWorker(tiles, index+1, i+1, j, visited, path, paths) || r;
    r = await _findInGridWorker(tiles, index+1, i+1, j+1, visited, path, paths) || r;
    // Top and bottom.
    r = await _findInGridWorker(tiles, index+1, i, j-1, visited, path, paths) || r;
    r = await _findInGridWorker(tiles, index+1, i, j+1, visited, path, paths) || r;
    visited[i][j] = false;
    path.removeLast();
    return r;
  }

  bool _findInGridAt(int i, int j, List<String> tiles, Set<List<int>> paths) {
    var visited =
        new List.generate(GameConstants.BoardDimension,
                          (_) => new List<bool>(GameConstants.BoardDimension));
    for (int i = 0; i < GameConstants.BoardDimension; i++) {
      for (int j = 0; j < GameConstants.BoardDimension; j++) {
        visited[i][j] = false;
      }
    }
    //return _findInGridWorker(tiles, 0, i, j, visited, [], paths);
  }
}