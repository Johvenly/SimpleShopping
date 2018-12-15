import 'package:flutter/material.dart';
import 'index.dart';

void main() => runApp(new MainPage());

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Index(),
    );
  }
}
