import 'package:flutter/material.dart';

class MultipleTweenAnimationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MultipleTweenAnimationPageState();
}

class _MultipleTweenAnimationPageState extends State<MultipleTweenAnimationPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _sizeAnimation;

  Animation<Color> _colorAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      debugLabel: 'animation',
      duration: Duration(seconds: 2),
      vsync: this,
    )..addListener(() => setState(() => {}));

    _sizeAnimation = _animationController
        .drive(CurveTween(curve: Curves.bounceIn))
        .drive(Tween(begin: 0.0, end: 200.0));

    _colorAnimation = _animationController
        .drive(CurveTween(curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn)))
        .drive(ColorTween(begin: Colors.red, end: Colors.amber));
    _animationController.repeat(reverse: true, period: Duration(seconds: 2));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Multiple Tween'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, _) {
            return Container(
              width: _sizeAnimation.value,
              height: _sizeAnimation.value,
              color: _colorAnimation.value,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // restart animation
          _animationController.forward(from: 0.0);
        },
        child: Icon(Icons.restore),
      ),
    );
  }
}
