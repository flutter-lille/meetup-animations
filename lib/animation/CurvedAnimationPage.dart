import 'package:flutter/material.dart';

class CurvedAnimationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CurvedAnimationPageState();
}

class _CurvedAnimationPageState extends State<CurvedAnimationPage>
    with TickerProviderStateMixin {

  AnimationController _animationController;
  Animation<double> _curvedAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      debugLabel: 'animation',
      duration: Duration(seconds: 2),
      vsync: this,
    )..addListener(() => setState(() => {}));

    _curvedAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.bounceIn,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _animationController.forward();
    return new Scaffold(
      appBar: AppBar(
        title: Text('Curved AnimationController'),
      ),
      body: Center(
        child: Container(
          width: 100 * _curvedAnimation.value,
          height: 100 * _curvedAnimation.value,
          color: Colors.red,
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
