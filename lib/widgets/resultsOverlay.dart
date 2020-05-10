import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultsOverlay extends StatefulWidget {
  bool _showResults = false;
  int _totalScore;
  List<String> _words = new List<String>();
  List<String> _allWords = new List<String>();
  VoidCallback _callback;

  ResultsOverlay(this._showResults, this._totalScore, this._words, this._allWords, this._callback);

  @override
  State<StatefulWidget> createState() => ResultsOverlayWidget();
}

class ResultsOverlayWidget extends State<ResultsOverlay> {

  @override
  Widget build(BuildContext context) {
    return new Visibility(
        visible: widget._showResults,
        child: Container(
            margin: const EdgeInsets.all(30.0),
            decoration: new BoxDecoration(
              color: Colors.black,
              borderRadius: new BorderRadius.all(new Radius.circular(10.0)),

            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Container(
                    margin: EdgeInsets.all(8),
                      child: Text('Nice work!',
                        style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: 50,
                        fontWeight: FontWeight.bold
                        )),
                  ),
                  new Text('Your score: ${widget._totalScore}',
                      style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 20
                      )
                  ),
                  new Text('You found ${null != widget._words? widget._words.length: 0} of a possible ${null != widget._allWords? widget._allWords.length : 0} words',
                      style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 14
                        )
                  ),
              Expanded(
                  child: new Align(
                      alignment: Alignment.center,
                      child: new Container(
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(16),
                        decoration: new BoxDecoration(
                            borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
                            color: Colors.white.withOpacity(0.4)
                        ),
                        child: new ListView(
                            shrinkWrap: true,
                            padding: EdgeInsets.only(left: 16, top: 16, right: 16),
                            children: <Widget>[
                              if(null != widget._allWords)
                                for (var word in widget._allWords) Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                            word,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: widget._words.contains(word) ?  Colors.green : Colors.white
                                            )
                                        )
                                    ),
                                    Align(
                                        alignment: Alignment.bottomRight,
                                        child: Text(
                                            scoreForWord(word).toString(),
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: widget._words.contains(word) ?  Colors.green : Colors.white
                                            )
                                        )
                                    ),
                                  ])
                              ]),
                      ))),
              new Container(
                  margin: EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: new Container(
                          margin: EdgeInsets.all(8),
                          child: new RaisedButton(
                            child: new Text("CHALLENGE"),
                            color: Theme.of(context).accentColor,
                            onPressed: _startChallenge
                          )
                        )
                      ),
                      Expanded(
                        child: new RaisedButton(
                          child: new Text("NEW GAME"),
                          color: Theme.of(context).accentColor,
                            onPressed: widget._callback
                        )
                      )
                    ]
                  ))
        ]
    )));
  }

  int scoreForWord(String word) {
    if (word == null || word.length == 0) {
      return null;
    }
    int score = 0;
    // Length bonus.
    if (word.length <= 3) {
      score += 1;
    } else if (word.length <= 4) {
      score += 1;
    } else if (word.length <= 5) {
      score += 2;
    } else if (word.length <= 6) {
      score += 3;
    } else if (word.length <= 7) {
      score += 5;
    } else {
      // 8 or more!
      score += 11;
    }
    return score;
  }

  void _startChallenge() {
    print("START CHALLENGE");
  }

  void closeOverlay(){
  }
}

