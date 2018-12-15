import 'package:flutter/material.dart';
import 'search_bar_delegate.dart';

class Home extends StatefulWidget{
  State<StatefulWidget> createState() => new HomeState();
}

class HomeState extends State{
  @override
  Widget build(BuildContext context){
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text('41'),
        ],
      ),
    );
    Widget _body = new Container(
      child: new ListView(
        children: <Widget>[
          // Image.asset('assets/images/lake.jpg',width: 300.0,height: 240.0,fit: BoxFit.cover,),
          // titleSection,
          new Stack(
            children: <Widget>[
              Image.asset('assets/images/lake.jpg',width: 600.0,height: 180.0,fit: BoxFit.cover,)
            ],
          ),
          new Container(
            child: Column(
              children: <Widget>[
                Text('100秒套餐', style: TextStyle(color: Colors.white, fontSize: 22),),
                Text('用于消费100秒的套餐', style: TextStyle(color: Colors.white, fontSize: 16, height: 1.5),),
                new Row(
                  children: <Widget>[
                    new RaisedButton(
                      padding: EdgeInsets.only(top:8, bottom:8, left: 30, right: 30),
                      child: Text('立即购买', style: TextStyle(color: Colors.orange),),
                      color: Colors.white,
                      disabledColor: Colors.white,
                      elevation: 3,
                      highlightElevation: 3,
                      disabledElevation: 3,
                      shape: RoundedRectangleBorder(side: BorderSide(color: Colors.white), borderRadius: BorderRadius.all(Radius.circular(50))),
                      onPressed: (){
                        // new AlertDialog(
                        //   title: Text('sfsf', style: TextStyle(color: Colors.black),),
                        //   content: new Text("This is my content"),
                        // );
                        showDialog(
                          context: context,
                          child: new AlertDialog(
                            title: Text('温馨提示'),
                            content: Text('当前不能购买'),
                          ),
                        );
                      },
                    ),
                    Text('¥200.00', style: TextStyle(color: Colors.white, fontSize: 24),)
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                )
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.only(top: 20, bottom: 20, left: 15, right: 15),
            decoration: BoxDecoration(
              color: Colors.orangeAccent,
              borderRadius: BorderRadius.all(Radius.circular(8))
            ),
          )
        ],
      ),
    );
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 255, 44, 37),
          title: new Text('易鞋商城', style: TextStyle(color: Colors.white),),
          leading: IconButton(
            icon: Icon(Icons.filter_list, color: Colors.white, size: 30,)
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search, color: Colors.white, size: 30),
              onPressed: () => showSearch(context: context, delegate: SearchBarDelegate()),
            ),
          ],
        ),
        body: _body,
      ),
    );
  }
}