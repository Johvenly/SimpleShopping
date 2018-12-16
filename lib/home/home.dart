import 'package:flutter/material.dart';
import 'search_bar_delegate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../public/badge.dart';

class Home extends StatefulWidget{
  State<StatefulWidget> createState() => new HomeState();
}

class HomeState extends State{
  @override
  Widget build(BuildContext context){
    List _slides = <Widget>[
      Image.asset('assets/images/slide01.jpg', fit: BoxFit.cover,),
      Image.asset('assets/images/slide03.jpg', fit: BoxFit.cover,),
      Image.asset('assets/images/slide04.jpg', fit: BoxFit.cover,),
    ];
    Widget _body = new Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: new ListView(
        children: <Widget>[
          new Container(
            width: MediaQuery.of(context).size.width,
            height: 180.0,
            child: Swiper.children(
              children: _slides,
              pagination: new SwiperPagination(
                builder: DotSwiperPaginationBuilder(
                  color: Colors.black54,
                  activeColor: Colors.red,
                )
              ),
              control: null,
              autoplay: true,
              onTap: (index) => print('点击了第$index个'),
            )
          ),
          new Padding(
            padding: EdgeInsets.all(0),
            child: new ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(icon: Image.asset('assets/images/short01.jpg', fit: BoxFit.cover,),iconSize:80, padding: EdgeInsets.all(0),),
                    Text('男鞋'),
                  ],
                ),
                Column(
                  children: <Widget>[
                    IconButton(icon: Image.asset('assets/images/short02.jpg', fit: BoxFit.cover,),iconSize:80, padding: EdgeInsets.all(0),),
                    Text('商务皮鞋'),
                  ],
                ),
                Column(
                  children: <Widget>[
                    IconButton(icon: Image.asset('assets/images/short03.jpg', fit: BoxFit.cover,),iconSize:80, padding: EdgeInsets.all(0),),
                    Text('运动鞋'),
                  ],
                ),
                Column(
                  children: <Widget>[
                    IconButton(icon: Image.asset('assets/images/short04.jpg', fit: BoxFit.cover,),iconSize:80, padding: EdgeInsets.all(0),),
                    Text('篮球鞋'),
                  ],
                ),
              ],
            ),
          ),
          new Padding(
            child: new Row(
              children: <Widget>[
                Icon(FontAwesomeIcons.fire, color: Color.fromARGB(255, 255, 44, 37),),
                Text(' 热销单品'),
              ],
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
            padding: EdgeInsets.all(8),
          ),
          new Padding(
            padding: EdgeInsets.only(left: 8, right: 8, top: 8),
            child: new Stack(
              alignment: AlignmentDirectional.topEnd,
              children: <Widget>[
                Image.asset('assets/images/ad05.jpg', width: MediaQuery.of(context).size.width, fit: BoxFit.cover,),
                new Badge('正在热销', color: Colors.red,),
              ],
            ),
          ),
          new Container(
            height: 120,
            padding: EdgeInsets.all(8),
            child: new Row(
              children: <Widget>[
                Expanded(
                  child: new Padding(
                    padding: EdgeInsets.only(right: 2),
                    child: Image.asset('assets/images/ad06.jpg', fit: BoxFit.cover,),
                  ),
                ),
                Expanded(
                  child: new Padding(
                    padding: EdgeInsets.only(left: 2),
                    child: Image.asset('assets/images/ad07.jpg', fit: BoxFit.cover,),
                  ),
                )
              ],
            ),
          ),
          new Padding(
            child: new Row(
              children: <Widget>[
                Icon(FontAwesomeIcons.award, color: Color.fromARGB(255, 255, 44, 37),),
                Text(' 新品上市'),
              ],
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
            padding: EdgeInsets.all(8),
          ),
          new Container(
            height: 160,
            child: new ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 4),
                  child: Image.asset('assets/images/ad01.jpg', fit: BoxFit.fitHeight,),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 4),
                  child: Image.asset('assets/images/ad02.jpg', fit: BoxFit.fitHeight,),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 4),
                  child: Image.asset('assets/images/ad03.jpg', fit: BoxFit.fitHeight,),
                ),
                Padding(
                  padding: EdgeInsets.all(0),
                  child: Image.asset('assets/images/ad04.jpg', fit: BoxFit.fitHeight,),
                ),
              ],
            ),
            padding: EdgeInsets.all(8),
          ),
        ],
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 255, 44, 37),
          title: Image.asset('assets/images/logo.png', fit: BoxFit.cover, height: 45,),
          leading: IconButton(
            icon: Icon(Icons.format_list_bulleted, color: Colors.white, size: 30,)
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