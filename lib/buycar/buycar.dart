import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../product/detail.dart';

class Buycar extends StatefulWidget{
  State<StatefulWidget> createState() => new BuycarState();
}

class BuycarState extends State<Buycar> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    this.statSelect();
  }

  List<Map> _dataList = <Map>[
    {'id':1, 'title': '520系列经典款式运动鞋', 'src': 'assets/images/short01.jpg', 'color': '墨绿色', 'size': 'L', 'price': 124.00, 'count':1, 'select': true},
    {'id':2, 'title': '688清新款小白系帆布鞋', 'src': 'assets/images/short02.jpg', 'color': '白色', 'size': 'XL', 'price': 59.00, 'count':3, 'select': true},
    {'id':3, 'title': '夏季时尚休闲商务皮鞋', 'src': 'assets/images/short03.jpg', 'color': '天蓝色', 'size': 'M', 'price': 59.00, 'count':1, 'select': false},
    {'id':4, 'title': '574系列经典款式运动鞋', 'src': 'assets/images/short04.jpg', 'color': '黄色', 'size': 'XS', 'price': 42.00, 'count':2, 'select': true},
    {'id':5, 'title': '574系列经典款式运动鞋', 'src': 'assets/images/short04.jpg', 'color': '米白色', 'size': 'XS', 'price': 42.00, 'count':1, 'select': true},
    {'id':6, 'title': '574系列经典款式运动鞋', 'src': 'assets/images/short04.jpg', 'color': '墨绿色', 'size': 'XS', 'price': 42.00, 'count':1, 'select': true},
    {'id':7, 'title': '574系列经典款式运动鞋', 'src': 'assets/images/short04.jpg', 'color': '墨绿色', 'size': 'XS', 'price': 42.00, 'count':1, 'select': true},
    {'id':8, 'title': '574系列经典款式运动鞋', 'src': 'assets/images/short04.jpg', 'color': '墨绿色', 'size': 'XS', 'price': 42.00, 'count':1, 'select': true},
  ];
  bool _allSelect = false;
  int _countSelect = 0;
  double _countPrice = 0.00;

  void statSelect(){
    var stream = new Stream.fromIterable(_dataList);
    double price = 0.00;
    int count = 0;
    stream.listen((row) {
        if(row['select']){
          price += row['price'] * row['count'];
          count ++;
        }
    }, 
    onDone: () {
      setState(() {
        _countPrice = price;
        _countSelect = count;
      });
    });
  }
  void changeSelect(){
    new Stream.fromIterable(_dataList).listen((row){
      row['select'] = _allSelect ? true : false;
    }, onDone: () => statSelect());
  }
  Widget build(BuildContext context){
    Widget _li(int index){
      return new GestureDetector(
        child: new Container(
          height: 120,
          margin: EdgeInsets.only(top: 8, left: 8),
          decoration: BoxDecoration(color: Colors.white,),
          child: new Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: new GestureDetector(
                  child: _dataList[index]['select'] ? Icon(FontAwesomeIcons.solidCheckCircle, color: Colors.red,) : Icon(FontAwesomeIcons.circle, color: Colors.grey,),
                  onTap: (){
                    setState(() {
                      _dataList[index]['select'] = _dataList[index]['select'] ? false : true;
                      statSelect();
                      if(!_dataList[index]['select']){
                        setState(() {
                          _allSelect = false;
                        });
                      }
                    });
                  },
                ),
              ),
              Expanded(
                flex: 3,
                child: Image.asset(_dataList[index]['src'], fit: BoxFit.cover,),
              ),
              Expanded(
                flex: 6,
                child: new Container(
                  padding: EdgeInsets.all(8),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(_dataList[index]['title']),
                      Text('颜色：' + _dataList[index]['color'], style: TextStyle(height: 1.5, color: Colors.grey),),
                      Text('尺寸：' + _dataList[index]['size'], style: TextStyle(color: Colors.grey)), 
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text('¥' + _dataList[index]['price'].toString(), style: TextStyle(color: Colors.red, fontSize: 16, height: 1.2),),
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
                                        if(_dataList[index]['count'] > 1){
                                          _dataList[index]['count'] --;
                                          statSelect();
                                        }                
                                      });
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: new Container(
                                    alignment: AlignmentDirectional.center,
                                    child: Text(_dataList[index]['count'].toString(), style: TextStyle(color: Colors.grey),),
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
                                        _dataList[index]['count'] ++;
                                        statSelect();                   
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        onTap: (){
          Navigator.of(super.context).push(
            new MaterialPageRoute(
                builder: (BuildContext context) => new Detail(title: _dataList[index]['title'])));
            },
      );
    }

    Widget _body = new Container(
      padding: EdgeInsets.only(top: 15),
      child: new Stack(
        children: <Widget>[
          new ListView.builder(
            padding: EdgeInsets.only(bottom: 58),
            itemCount: _dataList.length,
            itemBuilder: (context, index){
              return _li(index);
            },
          ),
          new Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: new Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(color: Colors.grey[100]))
              ),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Expanded(
                    flex: 1,
                    child: new GestureDetector(
                      child: _allSelect ? Icon(FontAwesomeIcons.solidCheckCircle, color: Colors.red,) : Icon(FontAwesomeIcons.circle, color: Colors.grey,),
                      onTap: (){
                        setState(() {
                          _allSelect = _allSelect ? false : true;
                          changeSelect();
                        });
                      },
                    ),
                  ),
                  new Expanded(
                    flex: 4,
                    child: new Padding(
                      padding: EdgeInsets.all(0),
                      child: new Row(
                        children: <Widget>[
                          Text(' 合计：¥' + _countPrice.toString()),
                        ],
                      ),
                    ),
                  ),
                  new Container(
                    height: 50,
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: FlatButton(
                      child: Text('去结算(' + _countSelect.toString() + ')', style: TextStyle(color: Colors.white),),
                      onPressed: (){

                      },
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
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
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        resizeToAvoidBottomPadding: true,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 255, 44, 37),
          title: Text('购物车'),
          actions: <Widget>[
            FlatButton(
              child: Text('编辑全部', style: TextStyle(color: Colors.white70, fontSize: 14),),
              onPressed: (){},
            ),
          ],
        ),
        body: _body,
      ),
    );
  }
}