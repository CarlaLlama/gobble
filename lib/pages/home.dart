 import 'package:firebase_auth/firebase_auth.dart';
import 'package:flare_flutter/flare_actor.dart';
 import 'package:flutter/material.dart';
 import 'package:firebase_ui/flutter_firebase_ui.dart';
import 'package:flame/util.dart';
import 'package:flutter/services.dart';
import 'package:gobble/models/board.dart';
import 'package:gobble/widgets/grid.dart';
import 'package:gobble/widgets/pageOverlay.dart';
import 'package:gobble/widgets/timer.dart';

void main() async {
  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);

  BoardGame game = BoardGame();
  runApp(game.widget);
}


class HomePage extends StatefulWidget {
  final FirebaseUser user;

  HomePage({this.user});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _startTimer = false;

  @override
  Widget build(BuildContext context) =>
      new Scaffold(
          appBar: new AppBar(
              elevation: 4.0,
              backgroundColor: Colors.black,
              title: new Row(
                children: <Widget>[
                  (_startTimer) ? new TimerWidget() : new Text("00:00"),
                  new Align(
                    alignment: Alignment.centerLeft,
                    child: new IconButton(
                      icon: Icon(Icons.exit_to_app,
                        color: Colors.green,
                        size: 24,
                      ),
                      onPressed: () {
                        _logout();
                      }
                    ),
                    ),
                ],
              )
          ),
          body: new Stack(
              alignment: Alignment.center,
              fit: StackFit.expand,
              children: [
                new Container(
                  child: new FlareActor("assets/animations/background.flr",
                    alignment: Alignment.center,
                    animation: "Background Loop",
                    fit: BoxFit.fitWidth)),
                new GridWidget(),
                new Positioned.fill(
                    child: PageOverlay(widget.user.displayName ?? widget.user.email)
                )
              ])
      );

  void _logout() {
    signOutProviders();
  }
}