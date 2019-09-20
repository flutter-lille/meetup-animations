import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage>
    with SingleTickerProviderStateMixin {
  double _width = 100.0, _height = 100.0;
  Color _color = Colors.green;
  Color _shadowColor = Colors.black;
  double _blurRadius = 10.0;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(12);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('AnimatedContainer'),
      ),
      body: Center(
        child: AnimatedContainer(
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: _borderRadius,
            boxShadow: [
              BoxShadow(
                color: _shadowColor,
                blurRadius: _blurRadius,
                spreadRadius: 1,
                offset: Offset(10.0, 10.0),
              )
            ],
          ),
          duration: Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            final random = Random();
            _width = random.nextInt(300).toDouble();
            _height = random.nextInt(300).toDouble();
            _blurRadius = random.nextInt(20).toDouble();

            _color = Color.fromRGBO(
              random.nextInt(256),
              random.nextInt(256),
              random.nextInt(256),
              1,
            );

            _shadowColor = Color.fromRGBO(
              random.nextInt(256),
              random.nextInt(256),
              random.nextInt(256),
              random.nextInt(100) / 100,
            );

            _borderRadius =
                BorderRadius.circular(random.nextInt(300).toDouble());
          });
        },
        child: Icon(Icons.restore),
      ),
    );
  }
}
