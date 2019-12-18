import 'dart:core';
import 'dart:math';

class Dice {
  final List<List<String>> _grid = shuffleDie();

  List<List<String>> getGrid(){
    return this._grid;
  }

  List<String> getShuffledGridList(){
    List<String> gridList = new List<String>();
    for (List<String> i in this._grid){
      gridList.addAll(i);
    }
    return gridList;
  }

  static final List<List<String>> list = const [
    const [ 'R', 'I', 'F','O', 'B', 'X'],
    const [ 'I', 'F', 'E', 'H','E', 'Y'],
    const [ 'D', 'E', 'N', 'O', 'W', 'S'],
    const [ 'U', 'T', 'O', 'K', 'N',  'D'],
    const ['H', 'M', 'S', 'R', 'A',  'O'],
    const [ 'L', 'U', 'P', 'E', 'T', 'S'],
    const ['A', 'C', 'I', 'T','O', 'A'],
    const [ 'Y', 'L', 'G', 'K', 'U', 'E'],
    const [ 'Q', 'B', 'M', 'J', 'O', 'A'],
    const ['E', 'H', 'I', 'S', 'P', 'N'],
    const ['V', 'E', 'T', 'I', 'G', 'N'],
    const ['B', 'A', 'L', 'I', 'Y', 'T'],
    const [ 'E', 'Z', 'A', 'V', 'N', 'D'],
    const [ 'R', 'A', 'L', 'E', 'S', 'C'],
    const [ 'U', 'W', 'I', 'L', 'R', 'G'],
    const [ 'P', 'A', 'C', 'E', 'M', 'D']
  ];


  static List<List<String>> shuffleDie(){
    List<List<String>> grid = new List<List<String>>();
    var random = new Random();
    int count = 0;
    var rowList = new List<String>();

    for (List<String> i in list) {
      var randomSide = random.nextInt(6);
      rowList.add(i[randomSide]);
      count++;

      if (count == 4) {
        count = 0;
        grid.add(rowList);
        rowList = new List<String>();
      }
    }
    return grid;
  }

}