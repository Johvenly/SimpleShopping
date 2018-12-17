import 'package:flutter/material.dart';

class Badge extends Positioned {
  final double top;
  final double bottom;
  final double right;
  final double left;
  final double angle;
  final double width;
  final double height;
  final double fontSize;
  final Color color;
  final String text;

  const Badge(this.text, {
    Key key,
    this.top = 10,
    this.bottom = null,
    this.right = -22,
    this.left = null,
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

class BadgeUnreaded extends Positioned {
  final double diameter;
  final double fontSize;
  final Color color;
  final Color bgColor;
  final int itemCount;
  final double top;
  final double right;
  final bool hideZeroCount;

  const BadgeUnreaded(this.itemCount, {
    Key key,
    Size size,
    this.diameter = 20,
    this.fontSize = 10,
    this.color = Colors.red,
    this.bgColor = Colors.white,
    this.hideZeroCount: true,
  }) : assert(itemCount >= 0), this.top = -diameter / 3, this.right = -diameter / 3;

  @override
  Widget get child => badge();
  Widget badge() {
    if (this.hideZeroCount && this.itemCount == 0) {
      return new Offstage();
    }
    return new ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: this.diameter,
        minHeight: this.diameter,
      ),
      child: new Container(
        child: Text(itemCount.toString(), style: TextStyle(color: this.color, fontSize: this.fontSize),),
        decoration: BoxDecoration(
          border: Border.all(color: this.color, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(this.diameter)),
          color: this.bgColor,
        ),
        alignment: AlignmentDirectional.center,
        padding: EdgeInsets.all(2),
      ),
    );
  }
}