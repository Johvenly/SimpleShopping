import 'package:flutter/material.dart';

class Classify extends StatefulWidget{
  State<StatefulWidget> createState() => new ClassifyState();
}

class ClassifyState extends State{
  @override
  Widget build(BuildContext context){
    Widget _body = new Container(
      child: new TabBarView(
        children: <Widget>[
          new Center(
            child: new Text('运动鞋'),
          ),
          new Center(
            child: new Text('休闲鞋'),
          ),
          new Center(
            child: new Text('女式凉鞋'),
          ),
          new Center(
            child: new Text('登山鞋'),
          ),
          new Center(
            child: new Text('商务皮鞋'),
          ),
          new Center(
            child: new Text('时尚布鞋'),
          ),
        ],
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new DefaultTabController(
        length: 6,
        child: new Scaffold(
          appBar: AppBar(
            // elevation: 0,
            backgroundColor: Color.fromARGB(255, 255, 44, 37),
            title: Text('分类'),
            bottom: TabBar(
              isScrollable: true,
              tabs: <Widget>[
                Tab(text: '运动鞋',),
                Tab(text: '休闲鞋',),
                Tab(text: '女式凉鞋',),
                Tab(text: '登山鞋',),
                Tab(text: '商务皮鞋',),
                Tab(text: '时尚布鞋',),
              ],
              indicatorColor: Colors.white,
              unselectedLabelColor: Colors.white,
            ),
          ),
          body: _body,
        ),
      ),
    );
  }
}