import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Mine extends StatefulWidget{
  State<StatefulWidget> createState() => new MineState();
}

class MineState extends State{
  @override
  Widget build(BuildContext context){
    Widget Badge(String text, {Color color = Colors.red, double bwidth = 20.0, double bheight = 20.0}){
      return new Container(
        child: Text(text, style: TextStyle(color: color, fontSize: 10),),
        decoration: BoxDecoration(
          border: Border.all(color: color, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(100)),
          color: Colors.white,
        ),
        width: bwidth,
        height: bheight,
        alignment: AlignmentDirectional.center,
        padding: EdgeInsets.all(2),
      );
    }

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
              RawMaterialButton(
                constraints: BoxConstraints(minWidth: 0),
                child: new Stack(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Icon(Icons.payment, size: 45, color: Colors.black87,),
                        Text('待付款', style: TextStyle(color: Colors.black54,),),
                      ],
                    ),
                  ],
                  alignment: AlignmentDirectional.topEnd,
                ),
                onPressed: (){},
              ),
              RawMaterialButton(
                constraints: BoxConstraints(minWidth: 0),
                child: new Stack(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Icon(Icons.card_giftcard, size: 45, color: Colors.black87,),
                        Text('待发货', style: TextStyle(color: Colors.black54,),),
                      ],
                    ),
                    Positioned(top: 0, child: Badge('8'),),
                  ],
                  alignment: AlignmentDirectional.topEnd,
                ),
                onPressed: (){},
              ),
              RawMaterialButton(
                constraints: BoxConstraints(minWidth: 0),
                child: new Stack(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Icon(Icons.local_taxi, size: 45, color: Colors.black87,),
                        Text('待收货', style: TextStyle(color: Colors.black54,),),
                      ],
                    ),
                    Positioned(top: 0, child: Badge('2'),),
                  ],
                  alignment: AlignmentDirectional.topEnd,
                ),
                onPressed: (){},
              ),
              RawMaterialButton(
                constraints: BoxConstraints(minWidth: 0),
                child: new Stack(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Icon(Icons.message, size: 45, color: Colors.black87,),
                        Text('待评价', style: TextStyle(color: Colors.black54,),),
                      ],
                    ),
                  ],
                  alignment: AlignmentDirectional.topEnd,
                ),
                onPressed: (){},
              ),
              RawMaterialButton(
                constraints: BoxConstraints(minWidth: 0),
                child: new Stack(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Icon(Icons.autorenew, size: 45, color: Colors.black87,),
                        Text('退款/售后', style: TextStyle(color: Colors.black54,),),
                      ],
                    ),
                  ],
                  alignment: AlignmentDirectional.topEnd,
                ),
                onPressed: (){},
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
                      Row(
                        children: <Widget>[
                          Icon(FontAwesomeIcons.list, size: 16, color: Colors.red,),
                          Text('  我的订单', style: TextStyle(fontSize: 16),)
                        ],
                      ),
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
                      Row(
                        children: <Widget>[
                          Icon(FontAwesomeIcons.star, size: 18, color: Colors.yellow[700],),
                          Text('  收藏商品', style: TextStyle(fontSize: 16),)
                        ],
                      ),
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
                      Row(
                        children: <Widget>[
                          Icon(FontAwesomeIcons.addressBook, size: 18, color: Colors.black45,),
                          Text('  地址管理', style: TextStyle(fontSize: 16),)
                        ],
                      ),
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
                      Row(
                        children: <Widget>[
                          Icon(FontAwesomeIcons.clock, size: 18, color: Colors.black45,),
                          Text('  最近浏览', style: TextStyle(fontSize: 16),)
                        ],
                      ),
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
                      Row(
                        children: <Widget>[
                          Icon(FontAwesomeIcons.weixin, size: 18, color: Colors.black45,),
                          Text('  意见反馈', style: TextStyle(fontSize: 16),)
                        ],
                      ),
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
                      Row(
                        children: <Widget>[
                          Icon(FontAwesomeIcons.cog, size: 18, color: Colors.black45,),
                          Text('  设置', style: TextStyle(fontSize: 16),)
                        ],
                      ),
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
            padding: EdgeInsets.only(left: 12),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(style: BorderStyle.solid, width: 10, color: Colors.grey[200]))
            ),
          )
        ],
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
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