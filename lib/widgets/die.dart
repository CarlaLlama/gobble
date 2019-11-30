import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'button.dart';

class DieWidget extends StatefulWidget {
  String _letter;
  Function(String) callback;

  DieWidget(this._letter, this.callback);

  @override
  _DieWidgetState createState() => _DieWidgetState();
}

class _DieWidgetState extends State<DieWidget> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(
        color: Colors.black,
        borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
      ),
      height: 20,
      width: 20,
      child: GestureDetector(
        onTap: () {
          widget.callback(widget._letter); //call to parent,
          print("Start ${widget._letter}");
          setState(() {
            _isSelected = true;
          });
        },
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: new BoxDecoration(
            color: _isSelected ? Colors.red : Colors.white,
            border: Border.all(color: Colors.black),
            borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
          ),
          child: Align(
              alignment: Alignment.center,
              child: Text(widget._letter,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.bold
            )
          ))
        ),
      ),
    );
  }


}