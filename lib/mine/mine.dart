import 'package:flutter/material.dart';

class Mine extends StatefulWidget{
  State<StatefulWidget> createState() => new MineState();
}

class MineState extends State{
  @override
  Widget build(BuildContext context){
    Widget _body = new Container(
      child: new ListView(
        children: <Widget>[
          /**Avatar Box */
          new Container(
            height: 180,
            margin: EdgeInsets.only(bottom: 20),
            decoration: new BoxDecoration(
              color: Color.fromARGB(255, 255, 44, 37),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))
            ),
            child: new Column(
              children: <Widget>[
                new CircleAvatar(backgroundImage: new AssetImage('assets/images/avatar.jpg'), radius: 50),
                new Container(
                  child: Text('Johwen Chou', style: TextStyle(color: Colors.white, fontSize: 16),),
                  margin: EdgeInsets.only(top: 8),
                )
              ],
            ),
          ),
          /**Gold Box */
          new Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text('235', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500)),
                  Text('关注')
                ],
              ),
              Column(
                children: <Widget>[
                  Text('250', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500)),
                  Text('粉丝')
                ],
              ),
              Column(
                children: <Widget>[
                  Text('356', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500)),
                  Text('积分')
                ],
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          ),
          new Container(
            child: new Column(
              children: <Widget>[
                new Container(
                  child: new Row(
                    children: <Widget>[
                      Text('学习记录', style: TextStyle(fontSize: 16),),
                      Icon(Icons.chevron_right, color: Colors.grey,)
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                  padding: EdgeInsets.only(top: 15, bottom: 15, left: 5, right: 8),
                ),
                new Divider(indent: 5, height: 0, color: Colors.grey[200]),
                new Container(
                  child: new Row(
                    children: <Widget>[
                      Text('我的订单', style: TextStyle(fontSize: 16),),
                      Icon(Icons.chevron_right, color: Colors.grey,)
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                  padding: EdgeInsets.only(top: 15, bottom: 15, left: 5, right: 8),
                ),
                new Divider(indent: 5, height: 0, color: Colors.grey[200]),
                new Container(
                  child: new Row(
                    children: <Widget>[
                      Text('充值记录', style: TextStyle(fontSize: 16),),
                      Icon(Icons.chevron_right, color: Colors.grey,)
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                  padding: EdgeInsets.only(top: 15, bottom: 15, left: 5, right: 8),
                ),
                new Divider(indent: 5, height: 0, color: Colors.grey[200]),
                new Container(
                  child: new Row(
                    children: <Widget>[
                      Text('意见反馈', style: TextStyle(fontSize: 16),),
                      Icon(Icons.chevron_right, color: Colors.grey,)
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                  padding: EdgeInsets.only(top: 15, bottom: 15, left: 5, right: 8),
                ),
                new Divider(indent: 5, height: 0, color: Colors.grey[200]),
                new Container(
                  child: new Row(
                    children: <Widget>[
                      Text('常见问题', style: TextStyle(fontSize: 16),),
                      Icon(Icons.chevron_right, color: Colors.grey,)
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                  padding: EdgeInsets.only(top: 15, bottom: 15, left: 5, right: 8),
                ),
                new Divider(indent: 5, height: 0, color: Colors.grey[200]),
                new Container(
                  child: new Row(
                    children: <Widget>[
                      Text('设置', style: TextStyle(fontSize: 16),),
                      Icon(Icons.chevron_right, color: Colors.grey,)
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                  padding: EdgeInsets.only(top: 15, bottom: 15, left: 5, right: 8),
                ),
                new Divider(indent: 5, height: 0, color: Colors.grey[200]),
              ],
            ),
            margin: EdgeInsets.only(top: 15),
            padding: EdgeInsets.only(left: 8),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(style: BorderStyle.solid, width: 10, color: Colors.grey[200]))
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
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.message, color: Colors.white,),
              tooltip: '消息',
              onPressed: null,
            ),
            IconButton(
              icon: Icon(Icons.settings, color: Colors.white,),
              tooltip: '设置',
              onPressed: null,
            )
          ],
        ),
        body: _body,
      ),
    );
  }
}