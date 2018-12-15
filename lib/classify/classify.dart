import 'package:flutter/material.dart';

class Classify extends StatefulWidget{
  State<StatefulWidget> createState() => new ClassifyState();
}

class ClassifyState extends State{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 44, 37),
          title: Text('分类'),
        ),
      ),
    );
  }
}