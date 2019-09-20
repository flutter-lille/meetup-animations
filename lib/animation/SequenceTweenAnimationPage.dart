import 'package:flutter/material.dart';

class SequenceTweenAnimationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SequenceTweenAnimationPageState();
}

class _SequenceTweenAnimationPageState extends State<SequenceTweenAnimationPage>
    with SingleTickerProviderStateMixin {

  AnimationController _animationController;
  Animation<double> _sizeAnimation;
  Animation<Decoration> _borderAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      debugLabel: 'animation',
      duration: Duration(seconds: 3),
      vsync: this,
    )..addListener(() => setState(() => {}));

    _sizeAnimation = Tween<double>(
      begin: 0.0,
      end: 200.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInCubic,
    ));

    _sizeAnimation = _animationController
        .drive(Tween<double>(
      begin: 0.0,
      end: 200.0,
    ));

    _borderAnimation = TweenSequence(<TweenSequenceItem<Decoration>>[
      TweenSequenceItem<Decoration>(
        tween: DecorationTween(
          begin: BoxDecoration(
            color: Colors.red,
          ),
          end: BoxDecoration(
            color: Colors.amber,
          ),
        ),
        weight: 30,
      ),
      TweenSequenceItem<Decoration>(
        tween: DecorationTween(
          begin: BoxDecoration(
            color: Colors.amber,
          ),
          end: BoxDecoration(
            color: Colors.brown,
          ),
        ),
        weight: 30,
      ),
      TweenSequenceItem<Decoration>(
        tween: DecorationTween(
          begin: BoxDecoration(
            color: Colors.brown,
            borderRadius: BorderRadius.circular(0.0),
          ),
          end: BoxDecoration(
            color: Colors.brown,
            borderRadius: BorderRadius.circular(200.0),
          ),
        ),
        weight: 40,
      ),
    ]).animate(_animationController);

    _animationController.forward();
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
              child: DecoratedBoxTransition(
                decoration: _borderAnimation,
                child: Container(),
              ),
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
