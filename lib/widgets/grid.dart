
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gobble/models/checker.dart';
import 'package:gobble/models/dice.dart';
import 'package:gobble/widgets/die.dart';

class GridWidget extends StatefulWidget {

  @override
  _GridWidgetState createState() => new _GridWidgetState();
}

class _GridWidgetState extends State<GridWidget> {
  final Set<int> selectedIndexes = Set<int>();
  final key = GlobalKey();
  final Set<_SelectorWidget> _trackTaped = Set<_SelectorWidget>();

  String currentWord = "";
  Dice _dice;
  List<String> _letters;
  List<String> _words = new List<String>();
  Checker _checker;

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
    _letters = _dice.getShuffledGridList();

    _checker = new Checker(grid);
  }

  _detectTapedItem(PointerEvent event) {
    final RenderBox box = key.currentContext.findRenderObject();
    final result = BoxHitTestResult();
    Offset local = box.globalToLocal(event.position);
    if (box.hitTest(result, position: local)) {
      for (final hit in result.path) {
        /// temporary variable so that the [is] allows access of [index]
        final target = hit.target;
        if (target is _SelectorWidget && !_trackTaped.contains(target)) {
          _trackTaped.add(target);
          _selectIndex(target.index);
        }
      }
    }
  }

  _selectIndex(int index) {
    setState(() {
      selectedIndexes.add(index);
    });
  }

  _currentWord(){
    var word = '';
    selectedIndexes.forEach((curr) => word += _letters[curr]);
    return word;
  }


  @override
  Widget build(BuildContext context) {
    return new Column(
        children: [
          new Container(
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.only(top: 16.0),
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
              color: Colors.white.withOpacity(0.4)
            ),
            child: Text(
              _currentWord(),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              )
            )
          ),
          new Align(
            alignment: Alignment.topCenter,
            child: new Container(
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
              ),
              margin: const EdgeInsets.all(30.0),
              width: 400,
              height: 300,
              child: new Listener(
                onPointerDown: _detectTapedItem,
                onPointerMove: _detectTapedItem,
                onPointerUp: _checkWord,
                child: GridView.builder(
                  key: key,
                  itemCount: 16,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5.0,
                  ),
                  itemBuilder: (context, index) {
                    return SelectorWidget(
                      index: index,
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: new BoxDecoration(
                          color: selectedIndexes.contains(index) ? Colors.red : Colors.white,
                          border: Border.all(color: Colors.black),
                          borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                        ),
                        child: Align(
                            alignment: Alignment.center,
                            child: Text(_letters[index],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 28,
                                fontWeight: FontWeight.bold
                          )
                        ))
                      ),
                    );
                  },
                ),
              )
            )
          ),
          new Align(
            alignment: Alignment.bottomCenter,
            child: new Container(
              height: 160,
              padding: EdgeInsets.all(16),
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
                color: Colors.white.withOpacity(0.4)
              ),
              child: (
                new ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    for (var word in _words.reversed.toList()) Center(
                      child: Text(
                        word,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        )
                      )
                    )
                  ]
                )
              )
            )
          )
      ]
    );
  }

  void _submitWord() {
    setState(() {
      _words.add(_letters.join());
      _letters.clear();
    });
  }

  void _checkWord(PointerUpEvent event) {
    _trackTaped.clear();
    print("IS CURRENT WORD: "+ _currentWord());
    if(_checker.isWord(_currentWord())){
      _words.add(_currentWord());
    }
    setState(() {
      selectedIndexes.clear();
    });
  }

}

class SelectorWidget extends SingleChildRenderObjectWidget {
  final int index;

  SelectorWidget({Widget child, this.index, Key key}) : super(child: child, key: key);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _SelectorWidget()..index = index;
  }

  @override
  void updateRenderObject(BuildContext context, _SelectorWidget renderObject) {
    renderObject..index = index;
  }
}

class _SelectorWidget extends RenderProxyBox {
  int index;
}