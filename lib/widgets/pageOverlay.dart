import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageOverlay extends StatefulWidget {
  final String _name;

  PageOverlay(this._name);

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
          margin: const EdgeInsets.all(30.0),
          decoration: new BoxDecoration(
              color: Colors.black.withOpacity(0.8),
              borderRadius: new BorderRadius.all(new Radius.circular(10.0)),

          ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text('Welcome ${widget._name}',
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: 20
                    )),
                  new RaisedButton(
                      child: new Text("NEW GAME"),
                      color: Theme.of(context).accentColor,
                      onPressed: _toggle
                      ),
                  new RaisedButton(
                    child: new Text("CHALLENGE"),
                    color: Theme.of(context).accentColor)
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

