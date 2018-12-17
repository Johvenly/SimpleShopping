import 'package:flutter/material.dart';
import '../home/search_bar_delegate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Classify extends StatefulWidget{
  State<StatefulWidget> createState() => new ClassifyState();
}

class ClassifyState extends State{
  @override
  int _tabsActiveIndex = 0;
  bool _showLineList = false;
  Widget build(BuildContext context){
    const List<Map> _tabList = const <Map>[
      {'id':1, 'title': '运动鞋'},
      {'id':2, 'title': '休闲鞋'},
      {'id':4, 'title': '滑板鞋'},
      {'id':5, 'title': '登山鞋'},
      {'id':8, 'title': '商务皮鞋'},
      {'id':12, 'title': '时尚布鞋'},
    ];

    const List<List> _tabBody = <List>[
      <Map>[
        {'id': 1, 'title': '247系列', 'src': 'assets/images/short01.jpg', 'des': '传承中的经典'},
        {'id': 2, 'title': 'CRT300系列', 'src': 'assets/images/short02.jpg', 'des': '传承中的经典'},
        {'id': 3, 'title': '520系列', 'src': 'assets/images/short03.jpg', 'des': '传承中的经典'},
        {'id': 4, 'title': '668系列', 'src': 'assets/images/short04.jpg', 'des': '传承中的经典'},
        {'id': 5, 'title': '925系列', 'src': 'assets/images/short03.jpg', 'des': '传承中的经典'},
        {'id': 6, 'title': '996系列', 'src': 'assets/images/short02.jpg', 'des': '传承中的经典'},
        {'id': 7, 'title': '258系列', 'src': 'assets/images/short03.jpg', 'des': '传承中的经典'},
      ],
      <Map>[
        {'id': 1, 'title': '225系列', 'src': 'assets/images/short02.jpg', 'des': '传承中的经典'},
        {'id': 2, 'title': '1314系列', 'src': 'assets/images/short01.jpg', 'des': '传承中的经典'},
        {'id': 3, 'title': '457系列', 'src': 'assets/images/short03.jpg', 'des': '传承中的经典'},
        {'id': 4, 'title': '668系列', 'src': 'assets/images/short04.jpg', 'des': '传承中的经典'},
        {'id': 5, 'title': '925系列', 'src': 'assets/images/short03.jpg', 'des': '传承中的经典'},
        {'id': 6, 'title': '996系列', 'src': 'assets/images/short02.jpg', 'des': '传承中的经典'},
      ],
      <Map>[
        {'id': 1, 'title': '888系列', 'src': 'assets/images/short03.jpg', 'des': '传承中的经典'},
        {'id': 2, 'title': 'CRT300系列', 'src': 'assets/images/short02.jpg', 'des': '传承中的经典'},
        {'id': 3, 'title': '520系列', 'src': 'assets/images/short03.jpg', 'des': '传承中的经典'},
        {'id': 4, 'title': '668系列', 'src': 'assets/images/short04.jpg', 'des': '传承中的经典'},
      ],
      <Map>[
        {'id': 1, 'title': '237系列', 'src': 'assets/images/short04.jpg', 'des': '传承中的经典'},
        {'id': 2, 'title': 'CRT300系列', 'src': 'assets/images/short02.jpg', 'des': '传承中的经典'},
        {'id': 3, 'title': '520系列', 'src': 'assets/images/short03.jpg', 'des': '传承中的经典'},
        {'id': 4, 'title': '668系列', 'src': 'assets/images/short04.jpg', 'des': '传承中的经典'},
        {'id': 5, 'title': '925系列', 'src': 'assets/images/short03.jpg', 'des': '传承中的经典'},
      ],
    ];

    Widget _li(String name, {String src = null, String des = ''}){
      Widget _tablibody;
      if(!_showLineList){
        _tablibody = new Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Image.asset(src, fit: BoxFit.cover, height: 80,),
            Text(name, style: TextStyle(fontSize: 16,),),
          ],
        );
      }else{
        _tablibody = new Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Image.asset(src, fit: BoxFit.cover,),
            ),
            Expanded(
              flex: 3,
              child: new Padding(
                padding: EdgeInsets.all(8),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(name, style: TextStyle(fontSize: 16,),),
                    Text(des, style: TextStyle(fontSize: 12, color: Colors.black54,),overflow: TextOverflow.ellipsis,),
                  ],
                ),
              ),
            ),
          ],
        );
      }

      return new Container(
        margin: EdgeInsets.only(top: 8, left: 4, right: 4),
        padding: EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
        decoration: BoxDecoration(
          color: Colors.white70,
        ),
        child: _tablibody,
      );
    }

    Widget _body = new Container(
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Expanded(
            flex: 1,
            child: new Container(
              padding: EdgeInsets.only(top: 25, bottom: 15),
              decoration: BoxDecoration(
                color: Colors.grey[100],
              ),
              child: new ListView.builder(
                itemCount: _tabList.length,
                itemBuilder: (context, index){
                  Color color = Colors.black54;
                  Color bgcolor = null;
                  if(index == _tabsActiveIndex){
                    color = Colors.red;
                    bgcolor = Colors.white54;
                  }
                  return new FlatButton(
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    child: Text(_tabList[index]['title'], style: TextStyle(color: color),),
                    color: bgcolor,
                    onPressed: (){
                      setState((){
                        _tabsActiveIndex = index;
                      });
                    },
                  );
                },
              ),
            ),
          ),
          new Expanded(
            flex: 2,
            child: new IndexedStack(
              index: _tabsActiveIndex,
              children: _tabList.map((Map map){
                int lindex = _tabList.indexOf(map);
                //判断键值是否存在，避免异常
                if(lindex > _tabBody.length - 1){
                  return new Center(child: Text('数据为空！', style:TextStyle(color: Colors.grey[300])),);
                }
                return new GridView.count(
                  primary: false,
                  childAspectRatio: _showLineList ? 2.5 : 1,
                  crossAxisCount: _showLineList ? 1 : 2,
                  children: _tabBody[lindex].map((list){
                    for (var i = 0; i < list.length; i++) {
                      return _li(list['title'], src: list['src'], des: list['des']);
                    }
                  }).toList(),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new DefaultTabController(
        length: _tabList.length,
        child: new Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Color.fromARGB(255, 255, 44, 37),
            title: Text('商品分类'),
            leading: IconButton(
              // icon: Icon(Icons.format_list_bulleted, color: Colors.white, size: 30,)
              icon: Icon((_showLineList ? FontAwesomeIcons.thLarge : FontAwesomeIcons.listUl), color: Colors.white, size: 22,),
              onPressed: (){
                setState(() {
                  _showLineList = _showLineList ? false : true;                
                });
              },
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
      ),
    );
  }
}