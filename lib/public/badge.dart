import 'package:flutter/material.dart';

class Badge extends Positioned {
  final double top;
  final double right;
  final double angle;
  final double width;
  final double height;
  final double fontSize;
  final Color color;
  final String text;

  const Badge(this.text, {
    Key key,
    this.top = 10,
    this.right = -22,
    this.angle = 120,
    this.width = 100,
    this.height = 20,
    this.fontSize = 12,
    this.color = Colors.orange,
  });

  @override
  Widget get child => Transform.rotate(
    angle: this.angle,
    child: Container(
      width: this.width,
      height: this.height,
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
        color: this.color,
      ),
      child: Text(this.text, style: TextStyle(color: Colors.white, fontSize: this.fontSize),),
    ),
  );
}