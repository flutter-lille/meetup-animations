import 'package:flutter/material.dart';

class TweenAnimationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TweenAnimationPageState();
}

class _TweenAnimationPageState extends State<TweenAnimationPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      debugLabel: 'animation',
      duration: Duration(seconds: 1),
      reverseDuration: Duration(seconds: 1),
      vsync: this,
    )..addListener(() => setState(() => {}));

    _sizeAnimation = _animationController
        .drive(CurveTween(curve: Curves.bounceIn))
        .drive(Tween(begin: 0.0, end: 200.0));

    // vs

//    _sizeAnimation = Tween<double>(
//      begin: 0.0,
//      end: 200.0,
//    ).animate(CurvedAnimation(
//      parent: _animationController,
//      curve: Curves.easeInCubic,
//    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TweenAnimationBuilder(
      tween: Tween(begin: 0.0, end: 200.0),
      curve: Curves.bounceIn,
      duration: Duration(seconds: 1),
      builder: (BuildContext context, double size, Widget _) {
        return Container(
          width: _sizeAnimation.value,
          height: _sizeAnimation.value,
          color: Colors.red,
        );
      },
    );
    _animationController.forward();
    return new Scaffold(
      appBar: AppBar(
        title: Text('Tween AnimationController'),
      ),
      body: Center(
        child: Container(
          width: _sizeAnimation.value,
          height: _sizeAnimation.value,
          color: Colors.red,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // restart animation
          _sizeAnimation = CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInCubic,
          ).drive(Tween<double>(
            begin: 0.0,
            end: 400.0,
          ));
          _animationController.forward(from: 0.0);
        },
        child: Icon(Icons.restore),
      ),
    );
  }
}
