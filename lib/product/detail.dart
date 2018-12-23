import 'package:flutter/material.dart';

class Detail extends StatefulWidget{
  final String title;
  Detail({Key key, this.title}) : super(key: key);

  State<StatefulWidget> createState() => new DetailState();
}

class DetailState extends State<Detail> with TickerProviderStateMixin {
  int buycount = 1;

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
                showBottomSheet<State>(
                  context: context,
                  builder: (BuildContext context){
                    return new bottomSheetDliog();
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
            child: Text(widget.title + buycount.toString(), style: TextStyle(fontSize: 18),),
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
  State<StatefulWidget> createState() => new bottomSheetDliogState();
}
class bottomSheetDliogState extends State{
  int buycount = 1;
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
                            Text('¥89.8', style: TextStyle(color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),),
                            Text('商品编号：001', style: TextStyle(fontSize: 16),)
                          ],
                        ),
                      ),
                    ],
                  ),
                  new Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 8),
                    child: Text('产品规格', style: TextStyle(fontSize: 20),),
                  ),
                  new Row(
                    children: <Widget>[
                      new FlatButton(
                        color: Color.fromARGB(255, 180, 10, 10),
                        disabledColor: Color.fromARGB(255, 200, 10, 10),
                        child: Text('时尚运动版', style: TextStyle(color: Colors.white),),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        onPressed: null,
                      ),
                      Text('    '),
                      new FlatButton(
                        color: Color.fromARGB(255, 180, 10, 10),
                        child: Text('炫动休闲版', style: TextStyle(color: Color.fromARGB(255, 200, 10, 10)),),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Color.fromARGB(255, 200, 10, 10)),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        onPressed: null,
                      ),
                    ],
                  ),
                  new Container(
                    width: MediaQuery.of(context).size.width - 30,
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
                                    setState(() {
                                      if(buycount > 1){
                                        buycount --;
                                      }                
                                    });
                                  },
                                ),
                              ),
                              Expanded(
                                child: new Container(
                                  alignment: AlignmentDirectional.center,
                                  child: Text(buycount.toString(), style: TextStyle(color: Colors.grey),),
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
                                    setState(() {
                                      buycount ++;             
                                    });
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