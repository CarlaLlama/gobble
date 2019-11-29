import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'button.dart';

class DieWidget extends StatefulWidget {
  @override
  _DieWidgetState createState() => _DieWidgetState();
}

class _DieWidgetState extends State<DieWidget> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 20,
      width: 20,
      child: GestureDetector(
        onPanStart: (DragStartDetails details) {
          print("Start");
          setState(() {
            _isSelected = true;
          });
          print(details);
        },
        onPanUpdate: (DragUpdateDetails details) {
          print("Update");
          _isSelected = true;
          print(details);
        },
        onPanEnd: (DragEndDetails details) {
          setState(() {
            _isSelected = false;
          });
          print("Update");
          print(details);
        },
        child: Container(
          padding: EdgeInsets.all(16),
          color: _isSelected ? Colors.red : Colors.grey,
          child: Text("A")
        ),
      ),
    );
  }


}