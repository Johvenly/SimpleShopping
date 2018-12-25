import 'package:flutter/material.dart';
import 'package:event_bus/event_bus.dart';

EventBus eventBus;

class DataInterEvent {
  Map pageGlobalData;
 
  DataInterEvent({this.pageGlobalData});
}

class Detail extends StatefulWidget{
  final String title;
  Detail({Key key, this.title}) : super(key: key);

  State<StatefulWidget> createState() => new DetailState();
}

class DetailState extends State<Detail> with TickerProviderStateMixin {
  //初始化页面数据
  Map pageRowData = new Map();

  @override
  void initState() {
    super.initState();

    //初始化页面数据
    pageRowData = {
      'price': 89.8,
      'number': '0021',
      'specifications': <Map>[
        {'id': 1, 'name': '44'},
        {'id': 2, 'name': '43'},
        {'id': 3, 'name': '42'},
        {'id': 4, 'name': '41'},
        {'id': 5, 'name': '40'},
        {'id': 6, 'name': '39'}
      ],
      'selectSpecIndex': 0,
      'quantity': 1,
    };

    eventBus = new EventBus();

    eventBus.on<DataInterEvent>().listen((DataInterEvent data) =>
      this.setState(() {
        pageRowData = data.pageGlobalData;
      }),
    );
  }

  @override
  Widget build(BuildContext context){
    List<Widget> _sliverBuilder(BuildContext context, bool innerBoxIsScrolled) {
      return <Widget>[
        SliverAppBar(
          //标题居中
          centerTitle: true,
          //展开高度250
          expandedHeight: 300.0,
          //不随着滑动隐藏标题
          floating: true,
          //固定在顶部
          pinned: true,
          forceElevated: true,
          elevation: 0,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            // title: Text('我是一个FlexibleSpaceBar',),
            background: Image.asset('assets/images/ad04.jpg', fit: BoxFit.cover,),
          ),
          leading: IconButton(
            icon: BackButtonIcon(),
            onPressed: (){
              Navigator.pop(super.context);
            },
          ),
          backgroundColor: Color.fromARGB(255, 255, 44, 37),
          // title: Text('产品详情'),
        )
      ];
    }

    Widget _commentli(){
      return new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Padding(
            padding: EdgeInsets.all(0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    new CircleAvatar(backgroundImage: new AssetImage('assets/images/avatar.jpg'), radius: 10),
                    Text(' Johwen Chou')
                  ],
                ),
                new Row(
                  children: <Widget>[
                    Icon(Icons.star, size: 16, color: Colors.red,),
                    Icon(Icons.star, size: 16, color: Colors.red,),
                    Icon(Icons.star, size: 16, color: Colors.red,),
                    Icon(Icons.star_border, size: 16, color: Colors.red,),
                    Icon(Icons.star_border, size: 16, color: Colors.red,),
                  ],
                )
              ],
            ),
          ),
          new Padding(
            padding: EdgeInsets.only(top: 8, bottom: 8),
            child: Text('鞋子很透气，穿起来非常舒服，很不错！'),
          ),
          new Wrap(
            spacing: 10,
            runSpacing: 5,
            children: <Widget>[
              Image.asset('assets/images/short05.jpg', width: MediaQuery.of(context).size.width / 4 - 15, height: MediaQuery.of(context).size.width / 4 - 10,),
              Image.asset('assets/images/short01.jpg', width: MediaQuery.of(context).size.width / 4 - 15, height: MediaQuery.of(context).size.width / 4 - 10,),
              Image.asset('assets/images/short05.jpg', width: MediaQuery.of(context).size.width / 4 - 15, height: MediaQuery.of(context).size.width / 4 - 10,),
              Image.asset('assets/images/short05.jpg', width: MediaQuery.of(context).size.width / 4 - 15, height: MediaQuery.of(context).size.width / 4 - 10,),
              // Image.asset('assets/images/short05.jpg', width: MediaQuery.of(context).size.width / 4 - 15, height: MediaQuery.of(context).size.width / 4 - 10,),
            ],
          ),
          new Padding(
            padding: EdgeInsets.only(top: 8, bottom: 0),
            child: Text('墨绿色； 24', style: TextStyle(fontSize: 14, color: Colors.grey),),
          ),
          new Divider(height: 24,),
        ],
      );
    }

    Widget _body = new Container(
      color: Colors.grey[100],
      child: new Stack(
        overflow: Overflow.clip,
        children: <Widget>[
          new ListView(
            padding: EdgeInsets.all(0),
            children: <Widget>[
              //标题等内容
              new Container(
                color: Colors.white,
                padding: EdgeInsets.only(left: 15, bottom: 20),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Padding(
                      padding: EdgeInsets.all(0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('¥' + pageRowData['price'].toString(), style: TextStyle(color: Colors.red, fontSize: 24, fontWeight: FontWeight.bold),),
                          ButtonBar(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(Icons.star),
                                    onPressed: null,
                                  ),
                                  Text('收藏', style: TextStyle(fontSize: 12, height: 0.5),),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(Icons.share),
                                    onPressed: null,
                                  ),
                                  Text('分享', style: TextStyle(fontSize: 12, height: 0.5),),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    new Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Text(widget.title + '  ' + pageRowData['specifications'][pageRowData['selectSpecIndex']]['name'], style: TextStyle(fontSize: 18),),
                    ),
                    new Padding(
                      padding: EdgeInsets.all(0),
                      child: Text('【圣诞特惠】官方正品保证，支持七天无理由退换货，领劵199减20，399减50', style: TextStyle(fontSize: 14, color: Colors.black54),),
                    ),
                  ],
                ),
              ),

              //规格选择Box
              new Builder(
                builder: (BuildContext context){
                  return new GestureDetector(
                    child: new Container(
                      color: Colors.white,
                      padding: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
                      margin: EdgeInsets.only(top: 12, bottom: 12),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('已选 产品规格：' + pageRowData['specifications'][pageRowData['selectSpecIndex']]['name'] + '， ' + pageRowData['quantity'].toString() + '件', style: TextStyle(fontSize: 16, color: Colors.grey),),
                          Icon(Icons.more_horiz, color: Colors.black54,),
                        ],
                      ),
                    ),
                    onTap: (){
                      //触发弹出面板
                      Scaffold.of(context).showBottomSheet(
                        (BuildContext context){
                          return new bottomSheetDliog(pageRowData: pageRowData);
                        },
                      );
                    },
                  );
                },
              ),

              //评价
              new Container(
                color: Colors.white,
                padding: EdgeInsets.all(15),
                child: new Column(
                  children: <Widget>[
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Row(
                          children: <Widget>[
                            Icon(Icons.local_florist, color: Colors.red, size: 18,),
                            Text('评价(35453)'),
                          ],
                        ),
                        new Row(
                          children: <Widget>[
                            Text('好评度 '),
                            Text('99%', style: TextStyle(color: Colors.red),),
                            Icon(Icons.chevron_right, color: Colors.black54,)
                          ],
                        ),
                      ],
                    ),
                    new Divider(height: 24,),
                    
                    new Column(
                      children: <Widget>[
                        _commentli(),
                        _commentli(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          //底部按钮组
          new Positioned(
            width: MediaQuery.of(context).size.width,
            height: 60,
            bottom: 0,
            child: new Container(
              child: new Row(
                children: <Widget>[
                  Expanded(
                    child: new Container(
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          side: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.zero),
                        ),
                        padding: EdgeInsets.only(top: 20, bottom: 20),
                        color: Color.fromARGB(255, 180, 10, 10),
                        disabledColor: Color.fromARGB(255, 180, 10, 10),
                        child: Text('加入购物车', style: TextStyle(color: Colors.white),),
                        onPressed: (){
                          print('点击了加入购物车按钮');
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: new Container(
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          side: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.zero),
                        ),
                        padding: EdgeInsets.only(top: 20, bottom: 20),
                        color: Color.fromARGB(255, 230, 10, 10),
                        disabledColor: Color.fromARGB(255, 230, 10, 10),
                        child: Text('立即购买', style: TextStyle(color: Colors.white),),
                        onPressed: (){
                          print('点击了立即购买按钮');
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: _sliverBuilder,
          body: _body,
        ),
      ),
    );
  }
}


/*---------------底部弹出框 ---------------------*/

class bottomSheetDliog extends StatefulWidget{
  final Map pageRowData;
  @override
  bottomSheetDliog({Key key, this.pageRowData}) : super(key: key);

  State<StatefulWidget> createState() => new bottomSheetDliogState();
}
class bottomSheetDliogState extends State<bottomSheetDliog> {
  Map pageRowData;

  @override
    void initState() {
      super.initState();
      pageRowData = widget.pageRowData;
    }

  @override
  Widget build(BuildContext context){
    return new Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey[300])),
      ),
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          //面板内容
          new Positioned(
            top: -25,
            child: new Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 15, right: 15),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      //商品缩略图
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        child: Image.asset('assets/images/short05.jpg', fit: BoxFit.cover, height: 120,),
                      ),
                      //价格编号说明
                      Container(
                        height: 50,
                        padding: EdgeInsets.only(left: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text('¥' + pageRowData['price'].toString(), style: TextStyle(color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),),
                            Text('商品编号：' + pageRowData['number'], style: TextStyle(fontSize: 16),)
                          ],
                        ),
                      ),
                    ],
                  ),
                  //产品规格
                  new Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 8),
                    child: Text('产品规格', style: TextStyle(fontSize: 20),),
                  ),
                  new Wrap(
                    spacing: 8.0, // gap between adjacent chips
                    runSpacing: 0,
                    children: pageRowData['specifications'].map<Widget>((Map map){
                      int index = pageRowData['specifications'].indexOf(map);
                      return new Padding(
                        padding: EdgeInsets.all(0),
                        child: new FlatButton(
                          color: pageRowData['selectSpecIndex'] == index ? Color.fromARGB(255, 200, 10, 10) : null,
                          disabledColor: pageRowData['selectSpecIndex'] == index ? Color.fromARGB(255, 200, 10, 10) : null,
                          child: Text(map['name'], style: TextStyle(color: pageRowData['selectSpecIndex'] == index ? Colors.white : Color.fromARGB(255, 200, 10, 10)),),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Color.fromARGB(255, 200, 10, 10)),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          onPressed: (){
                            setState(() {
                              pageRowData['selectSpecIndex'] = index;
                            });
                            eventBus.fire(new DataInterEvent(pageGlobalData: pageRowData));
                          },
                        ),
                      );
                    }).toList(),
                  ),
                  new Container(
                    padding: EdgeInsets.only(top: 15, bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text('购买数量', style: TextStyle(fontSize: 20),),
                        //数量选择器
                        new Container(
                          width: 100,
                          height: 25,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                width: 30,
                                child: new GestureDetector(
                                  child: Icon(Icons.remove, size: 12,),
                                  onTap: (){
                                    int tempcount = --pageRowData['quantity'];
                                    setState(() {
                                      if(tempcount > 0){
                                        pageRowData['quantity'] = tempcount; 
                                      }                
                                    });
                                    eventBus.fire(new DataInterEvent(pageGlobalData: pageRowData));
                                  },
                                ),
                              ),
                              Expanded(
                                child: new Container(
                                  alignment: AlignmentDirectional.center,
                                  child: Text(pageRowData['quantity'].toString(), style: TextStyle(color: Colors.grey),),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 30,
                                child: new GestureDetector(
                                  child: Icon(Icons.add, size: 12,),
                                  onTap: (){
                                    int tempcount = ++pageRowData['quantity'];
                                    setState(() {
                                      pageRowData['quantity'] = tempcount;           
                                    });
                                    eventBus.fire(new DataInterEvent(pageGlobalData: pageRowData));
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          //弹出面板关闭按钮
          new Positioned(
            width: 30,
            height: 30,
            top: 8,
            right: 8,
            child: FloatingActionButton(
              elevation: 0,
              backgroundColor: Colors.black26,
              child: Icon(Icons.close),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
          ),
          //底部按钮组
          new Positioned(
            width: MediaQuery.of(context).size.width,
            height: 60,
            bottom: 0,
            child: new Container(
              child: new Row(
                children: <Widget>[
                  Expanded(
                    child: new Container(
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          side: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.zero),
                        ),
                        padding: EdgeInsets.only(top: 20, bottom: 20),
                        color: Color.fromARGB(255, 180, 10, 10),
                        disabledColor: Color.fromARGB(255, 180, 10, 10),
                        child: Text('加入购物车', style: TextStyle(color: Colors.white),),
                        onPressed: (){
                          print('点击了加入购物车按钮');
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: new Container(
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          side: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.zero),
                        ),
                        padding: EdgeInsets.only(top: 20, bottom: 20),
                        color: Color.fromARGB(255, 230, 10, 10),
                        disabledColor: Color.fromARGB(255, 230, 10, 10),
                        child: Text('立即购买', style: TextStyle(color: Colors.white),),
                        onPressed: (){
                          print('点击了立即购买按钮');
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}