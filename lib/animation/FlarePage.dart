import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class FlarePage extends StatefulWidget {
  @override
  _FlarePageState createState() => _FlarePageState();
}

class _FlarePageState extends State<FlarePage> {

  final animations = ['idle', 'success'];
  var index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flare'),
      ),
      body: Container(
          color: Colors.white,
          child: FlareActor(
            "assets/login_page.flr",
            alignment: Alignment.topCenter,
            fit: BoxFit.fitHeight,
            animation: animations[index % animations.length],
          ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            index++;
          });
        },
      ),
    );
  }
}
