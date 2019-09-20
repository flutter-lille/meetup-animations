import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class PeakQuadraticCurve extends Curve {
  @override
  double transform(double t) {
    int value = 15;
    assert(t >= 0.0 && t <= 1.0);
    return -value * math.pow(t, 2) + value * t + 1;
  }
}

class ValleyQuadraticCurve extends Curve {
  @override
  double transform(double t) {
    assert(t >= 0.0 && t <= 1.0);
    return 4 * math.pow(t - 0.5, 2);
  }
}

createSlidePageRoute({Widget destination}) {
  return PageRouteBuilder(
    transitionDuration: Duration(milliseconds: 1200),
    pageBuilder: (context, animation, secondaryAnimation) => destination,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final tweenScale = Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: Curves.ease));
      return ScaleTransition(
        scale: animation.drive(tweenScale),
        child: child,
      );
    },
  );
}

class TransitionPage1 extends StatefulWidget {
  @override
  State createState() => _TransitionPage1State();
}

class _TransitionPage1State extends State<TransitionPage1> {
  double _timeDilation = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transition page 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Slider(
              min: 0.5,
              max: 20,
              divisions: 100,
              value: _timeDilation.toDouble(),
              label: '$_timeDilation',
              onChanged: (value) {
                setState(() {
                  _timeDilation = value;
                });
              },
              onChangeEnd: (value) {
                timeDilation = _timeDilation;
              },
            ),
            RaisedButton(
              child: Text('Page 1'),
              onPressed: () {},
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigate_next),
        onPressed: () {
          Navigator.of(context).push(createSlidePageRoute(destination: TransitionPage2()));
        },
      ),
    );
  }

  @override
  void dispose() {
    timeDilation = 1.0;
    super.dispose();
  }
}

class TransitionPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transition page 2'),
      ),
      body: Center(
        child: Text('Page 2'),
      ),
    );
  }
}
