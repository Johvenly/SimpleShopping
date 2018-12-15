import 'package:flutter/material.dart';

class Buycar extends StatefulWidget{
  State<StatefulWidget> createState() => new BuycarState();
}

class BuycarState extends State{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 255, 44, 37),
          title: Text('购物车'),
          actions: <Widget>[
            FlatButton(
              child: Text('编辑', style: TextStyle(color: Colors.white70, fontSize: 14),),
              onPressed: (){},
            ),
          ],
        ),
      ),
    );
  }
}