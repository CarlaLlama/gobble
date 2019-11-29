import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageOverlay extends StatefulWidget {
  //PageOverlay({Key: key}) : super(key: key);

  @override
  _PageOverlayState createState() => _PageOverlayState();
}

class _PageOverlayState extends State<PageOverlay> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return new Visibility(
        visible: _visible,
        child: Container(
          margin: const EdgeInsets.all(60.0),
          decoration: new BoxDecoration(color: Colors.purple.withOpacity(0.8)),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new RaisedButton(
                      child: new Text("NEW GAME"),
                      onPressed: _toggle
                      ),
                  new RaisedButton(
                    child: new Text("CHALLENGE"))
                  ]
              )));
  }
  void _toggle() {
    setState(() {
      _visible = !_visible;
    });
  }

  void closeOverlay(){
  }
}

