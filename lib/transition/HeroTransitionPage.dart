import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ValleyQuadraticCurve extends Curve {
  @override
  double transform(double t) {
    assert(t >= 0.0 && t <= 1.0);
    return 4 * math.pow(t - 0.5, 2);
  }
}

class HeroTransitionPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero Page 1'),
      ),
      body: Container(
        padding: const EdgeInsets.only(bottom: 48.0),
        alignment: Alignment.bottomCenter,
        child: Hero(
          tag: "element",
          child: Container(
            width: 100,
            height: 100,
            child: FittedBox(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.wb_sunny,
                  color: Colors.white,
                ),
              ),
              fit: BoxFit.contain,
            ),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigate_next),
        onPressed: () {
          _goToNext(context);
        },
      ),
    );
  }

  void _goToNext(BuildContext context) {
    Navigator.of(context).push(new PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            HeroTransitionPage2(),
        transitionDuration: Duration(milliseconds: 400),
        transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
          final opacity = Tween(begin: 0.0, end: 1.0)
              .chain(CurveTween(curve: Interval(0.5, 1.0)));
          return FadeTransition(
            opacity: animation.drive(opacity),
            child: child,
          );
        }));
  }
}

class HeroTransitionPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero Page 2'),
      ),
      body: Center(
        child: Hero(
          tag: "element",
          transitionOnUserGestures: true,
          flightShuttleBuilder: (BuildContext flightContext,
              Animation<double> animation,
              HeroFlightDirection flightDirection,
              BuildContext fromHeroContext,
              BuildContext toHeroContext) {
            final Hero toHero = toHeroContext.widget;
            return RotationTransition(
              turns: animation,
              child: toHero.child,
            );
          },
          child: Container(
            width: 300,
            height: 200,
            child: FittedBox(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.ac_unit,
                  color: Colors.white,
                ),
              ),
              fit: BoxFit.contain,
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(
                Radius.circular(30.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
