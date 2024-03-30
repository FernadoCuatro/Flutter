// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  @override
  State<AnimatedContainerPage> createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {

  double _width  = 50;
  double _height = 50;
  Color? _color  = Colors.blue[200];
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration( milliseconds: 500 ),
          curve: Curves.fastOutSlowIn,
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
            color: _color
          ),
        ),
      ),
      // El boton de al lado
      floatingActionButton: FloatingActionButton(
        onPressed: _cambiarForma,
        child: Icon( Icons.play_arrow_outlined ),
      ),
    );
  }

  void _cambiarForma() {
    final random = Random();

    setState(() {
      _width  = random.nextInt(400).toDouble();
      _height = random.nextInt(400).toDouble();
      _color = Color.fromRGBO(random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);

      _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
    }); 
  }
}