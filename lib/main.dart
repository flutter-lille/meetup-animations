import 'package:animations/animation/AnimatedContainerPage.dart';
import 'package:animations/animation/FlarePage.dart';
import 'package:animations/animation/MultipleTweenAnimationPage.dart';
import 'package:animations/animation/SequenceTweenAnimationPage.dart';
import 'package:animations/animation/SimpleAnimationController.dart';
import 'package:animations/animation/TweenAnimationPage.dart';
import 'package:animations/transition/HeroTransitionPage.dart';
import 'package:animations/transition/SimpleTransitionPage.dart';
import 'package:flutter/material.dart';

import 'animation/CurvedAnimationPage.dart';

void main() => runApp(MyApp());

class Entry {
  final String title;
  final Widget widget;

  Entry({this.title, this.widget});
}

class MyApp extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var menu = <Entry>[
      Entry(title: 'Simple Animation', widget: SimpleAnimationControllerPage()),
      Entry(title: 'CurvedAnimation', widget: CurvedAnimationPage()),
      Entry(title: 'Tween Animation', widget: TweenAnimationPage()),
      Entry(title: 'Multi Tween', widget: MultipleTweenAnimationPage()),
      Entry(title: 'Sequence Tween', widget: SequenceTweenAnimationPage()),
      Entry(title: 'AnimatedContainer', widget: AnimatedContainerPage()),
      Entry(title: 'Simple Transition', widget: TransitionPage1()),
      Entry(title: 'Hero Transition', widget: HeroTransitionPage1()),
      Entry(title: 'Flare', widget: FlarePage()),
    ];
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('HOME'),
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: menu
                .map(
                  (entry) => RaisedButton(
                    child: Text(entry.title),
                    onPressed: () {
                      Navigator.of(_scaffoldKey.currentContext).push(
                        MaterialPageRoute(
                          builder: (context) => entry.widget,
                        ),
                      );
                    },
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
