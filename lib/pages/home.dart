 import 'package:firebase_auth/firebase_auth.dart';
 import 'package:flutter/material.dart';
 import 'package:firebase_ui/flutter_firebase_ui.dart';
import 'package:flame/util.dart';
import 'package:flutter/services.dart';
import 'package:gobble/models/board.dart';
import 'package:gobble/widgets/grid.dart';
import 'package:gobble/widgets/pageOverlay.dart';

void main() async {
  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);

  BoardGame game = BoardGame();
  runApp(game.widget);
}


class HomePage extends StatelessWidget {
  final FirebaseUser user;

  HomePage({this.user});

  @override
  Widget build(BuildContext context) => new Scaffold(
      appBar: new AppBar(
        title: new Text("Gobble"),
        elevation: 4.0,
      ),
      body: new Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          new Container(
              padding: const EdgeInsets.all(16.0),
              decoration: new BoxDecoration(color: Colors.amber),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Text("Welcome,"),
                    ],
                  ),
                  new Text(user.displayName ?? user.email),
                  new Grid()
                ],
              )),
          new Positioned.fill(
              child: PageOverlay()
          )
      ])
      );

  void _logout() {
    signOutProviders();
  }
}

