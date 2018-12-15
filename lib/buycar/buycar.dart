import 'package:flutter/material.dart';

class Buycar extends StatefulWidget{
  State<StatefulWidget> createState() => new BuycarState();
}

class BuycarState extends State{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 44, 37),
          title: Text('购物车'),
        ),
      ),
    );
  }
}