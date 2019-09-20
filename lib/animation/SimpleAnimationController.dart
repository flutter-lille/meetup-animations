import 'package:flutter/material.dart';

class SimpleAnimationControllerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SimpleAnimationControllerPageState();
}

class _SimpleAnimationControllerPageState
    extends State<SimpleAnimationControllerPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      debugLabel: 'animation',
      duration: Duration(seconds: 2),
      vsync: this,
    )..addListener(() => setState(() => {}));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _animationController.forward();
    // Démarrer l'animation
    return new Scaffold(
      appBar: AppBar(
        title: Text('Simple AnimationController'),
      ),
      body: Center(
        child: Container(
          width: 100 * _animationController.value,
          height: 100 * _animationController.value,
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
