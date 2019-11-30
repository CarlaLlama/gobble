import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gobble/models/checker.dart';
import 'package:gobble/models/dice.dart';
import 'package:gobble/widgets/die.dart';

class GridWidget extends StatefulWidget {

  @override
  _GridWidgetState createState() => new _GridWidgetState();
}

class _GridWidgetState extends State<GridWidget> {
  String currentWord = "";
  Dice _dice;
  List<String> _letters;
  List<String> _words = new List<String>();

  callback(letter) {
    setState(() {
      currentWord += letter;
    });
    print(currentWord);
  }

  @override
  void initState() {
    super.initState();
    _dice = new Dice();
    List<List<String>> grid = _dice.getGrid();
    _letters = _dice.getGridList();
    print(grid);
    Trie words = new Trie();
    var solver = new Checker(words, grid);
    List<String> results = solver.findAll().toList();
    print("RESULTS: $results");
  }


  @override
  Widget build(BuildContext context) {
    return new Column(
        children: [
          new Align(
            alignment: Alignment.topCenter,
            child: new Container(
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
                ),
                margin: const EdgeInsets.all(30.0),
                width: 400,
                height: 300,
              child: new GridView.count(
                crossAxisCount: 4,
                childAspectRatio: 1.0,
                children: new List<DieWidget>.generate(16, (index)
              {
                return new DieWidget(_letters[index], callback);
              }))),
          ),
          new Container(
              padding: EdgeInsets.all(8.0),
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
                color: Colors.white.withOpacity(0.4)
              ),
              child: Text(currentWord) ),
          new Align(
            alignment: Alignment.bottomCenter,
            child: new Column(
              children: [
                new RaisedButton(
                  onPressed: _submitWord,
                  color: Colors.black,
                  child: Text("ADD WORD", style: TextStyle(
                    color: Colors.white
                  ))
                ),
                new ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    for (var word in _words) Text(word)
                  ]
                )
              ]
            )
          )
      ]
    );
  }

  void _submitWord() {
    _words.add(_letters.join());
    _letters.clear();
  }

  void _regenWords() {

  }
}
