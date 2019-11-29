import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gobble/models/dice.dart';
import 'package:gobble/models/die.dart';
import 'package:gobble/widgets/die.dart';

class GridWidget extends StatefulWidget {

  @override
  _GridWidgetState createState() => new _GridWidgetState();
}

class _GridWidgetState extends State<GridWidget> {

  @override
  Widget build(BuildContext context) {
      var dice = new Dice();
      return new Container(
        width: 100,
        height: 100,
        color: Colors.black,
        child: new GridView.count(
          crossAxisCount: 4,
          shrinkWrap: true,
          childAspectRatio: 1.0,

          children: new List<DieWidget>.generate(16, (index)
            {
              return new DieWidget();
            })));
  }
}