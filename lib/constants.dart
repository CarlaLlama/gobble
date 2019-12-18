
class GameConstants {
  static const int TilePixels = 94;
  static const int TileGap = 6;
  static const int BoardDimension = 4;

  static int rowColumnToIndex(int row, int col) {
    return row * GameConstants.BoardDimension + col;
  }

  static int rowFromIndex(int row) {
    return row ~/ GameConstants.BoardDimension;
  }

  static int columnFromIndex(int column) {
    return column % GameConstants.BoardDimension;
  }

  static List<String> convertStringToTileList(String str) {
    List<String> tileString = [];
    for (int i = 0; i < str.length; i++) {
      if ((str[i] == 'Q' && i+1 >= str.length) ||
          (str[i] == 'Q' && str[i+1] != 'U')) {
        // Q must always be followed by a U.
        return [];
      }
      if (str[i] == 'Q') {
        tileString.add('QU');
        i++;
      } else {
        tileString.add(str[i]);
      }
    }
    return tileString;
  }
}