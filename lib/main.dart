import 'package:flutter/material.dart';
import 'index.dart';
// import 'product/detail.dart';

void main() => runApp(new MainPage());

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Index(),
    );
  }
}
