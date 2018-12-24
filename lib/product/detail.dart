import 'package:flutter/material.dart';
import 'package:event_bus/event_bus.dart';

EventBus eventBus = new EventBus();

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

    eventBus.on<DataInterEvent>().listen((DataInterEvent data) =>
      setState(() {
        pageRowData = data.pageGlobalData;
      })
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
            background: Image.asset('assets/images/lake.jpg', fit: BoxFit.cover,),
          ),
          leading: IconButton(
            icon: BackButtonIcon(),
            onPressed: (){
              Navigator.pop(super.context);
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share, color: Colors.white,),
              onPressed: (){
                //弹出面板
                Scaffold.of(context).showBottomSheet(
                  (BuildContext context){
                    return new bottomSheetDliog(pageRowData: pageRowData);
                  }
                );
              },
            ),
          ],
          backgroundColor: Color.fromARGB(255, 255, 44, 37),
          // title: Text('产品详情'),
        )
      ];
    }

    Widget _body = new Container(
      child: new ListView(
        padding: EdgeInsets.all(0),
        children: <Widget>[
          new Padding(
            padding: EdgeInsets.all(15),
            child: Text(widget.title + '   购买数量：' + pageRowData['quantity'].toString(), style: TextStyle(fontSize: 18),),
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
            height: 80,
            bottom: 0,
            child: new Row(
              children: <Widget>[
                Expanded(
                  child: FloatingActionButton(
                    child: Text(' 加入购物车'),
                    shape: Border(),
                    backgroundColor: Color.fromARGB(255, 180, 10, 10),
                    isExtended: true,
                    onPressed: null,
                  ),
                ),
                Expanded(
                  child: FloatingActionButton(
                    child: Text('立即购买'),
                    shape: Border(),
                    backgroundColor: Color.fromARGB(255, 230, 10, 10),
                    onPressed: null,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}