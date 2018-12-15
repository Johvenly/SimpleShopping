import 'package:flutter/material.dart';
import 'home/home.dart';
import 'classify/classify.dart';
import 'buycar/buycar.dart';
import 'mine/mine.dart';

class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState()  => new IndexState();
}

class IndexState extends State<Index>{
  @override
  int _currentIndex = 0;            //当前索引
  var _pageList = <StatefulWidget>[
    new Home(),
    new Classify(),
    new Buycar(),
    new Mine()
  ];
  Widget build(BuildContext context) {
    /*-----bottom nav start-------*/
    BottomNavigationBarItem _bottomNavigationBarItem(IconData icon, IconData activeIcon, String title, int itemIndex){
      var _bottomNavigationBarColor = Color.fromARGB(255, 166, 166, 166);
      if(_currentIndex == itemIndex){
        _bottomNavigationBarColor = Color.fromARGB(255, 255, 44, 37);
      }
      return BottomNavigationBarItem(icon: Icon(icon, color: _bottomNavigationBarColor), activeIcon: Icon(activeIcon, color: _bottomNavigationBarColor), title: Text(title, style: TextStyle(color: _bottomNavigationBarColor)));
    }
    BottomNavigationBar _bottomNavigationBar = BottomNavigationBar(
      items: [
        _bottomNavigationBarItem(Icons.home, Icons.home, '首页', 0),
        _bottomNavigationBarItem(Icons.view_list, Icons.filter_list, '分类', 1),
        _bottomNavigationBarItem(Icons.shopping_cart, Icons.shopping_cart, '购物车', 2),
        _bottomNavigationBarItem(Icons.person, Icons.account_circle, '我的', 3)
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      fixedColor: Colors.green,
      onTap: (index){
        setState(() {
          _currentIndex = index;        
        });
      },
    );
    /*-----bottom nav end-------*/
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _pageList[_currentIndex],
        bottomNavigationBar: _bottomNavigationBar,
        resizeToAvoidBottomPadding: false,
      ),
    );
  }
}
