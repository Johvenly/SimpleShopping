import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login extends StatefulWidget{
  State<StatefulWidget> createState() => new LoginState();
}

class LoginState extends State<Login>{

  @override
  Widget build(BuildContext context){

    Widget _body = new Container(
      child: new Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          //头部背景
          new ClipPath(
            clipper: BottomClipper(),
            child: new Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 44, 37),
                image: DecorationImage(
                  image: AssetImage('assets/images/bg_login.png',),
                  fit: BoxFit.cover,
                  alignment: AlignmentDirectional.topCenter,
                ),
              ),
              width: MediaQuery.of(context).size.width,
              height: 180,
              child: new Padding(
                padding: EdgeInsets.only(top: 60),
                child: Text('读万卷书，行千里路', style:TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.center,),
              ),
            ),
          ),

          //表单列表
          new Padding(
            padding: EdgeInsets.only(top:45, left: 45, right: 45),
            child: new TextField(
              // style: hintTips,
              // controller: _userNameController,
              decoration: new InputDecoration(hintText: "请输入用户名"),
              obscureText: false,
            ),
          ),
          new Padding(
            padding: EdgeInsets.only(top: 25, left: 45, right: 45),
            child: new TextField(
              // style: hintTips,
              // controller: _userPassController,
              decoration: new InputDecoration(hintText: "请输入用户密码"),
              obscureText: true,
            ),
          ),
          new GestureDetector(
            child: new Padding(
              padding: EdgeInsets.only(top:25, left: 45, right: 45),
              child: Text('没有账号？马上注册', textAlign: TextAlign.end,),
            ),
            onTap: null,
          ),
          new Container(
            margin: EdgeInsets.only(top: 45),
            padding: EdgeInsets.only(left: 45, right: 45),
            child: new FlatButton(
              color: Color.fromARGB(255, 255, 44, 37),
              padding: EdgeInsets.all(12),
              shape: RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(40)),
              ),
              onPressed: () {
                // _postLogin(
                //     _userNameController.text, _userPassController.text);
              },
              child: Text('马上登录', style: new TextStyle(color: Colors.white, fontSize: 16.0),)
            ),
          ),

          //第三方登录列表
          new Padding(
            padding: EdgeInsets.only(left: 45, right: 45, top: 60),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new GestureDetector(
                  child: new CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.black54,
                    child: Icon(FontAwesomeIcons.qq, color: Colors.white, size: 26,),
                  ),
                ),
                new GestureDetector(
                  child: new CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.black54,
                    child: Icon(FontAwesomeIcons.weixin, color: Colors.white, size: 26,),
                  ),
                ),
                new GestureDetector(
                  child: new CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.black54,
                    child: Icon(FontAwesomeIcons.facebookF, color: Colors.white, size: 26,),
                  ),
                ),
                new GestureDetector(
                  child: new CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.black54,
                    child: Icon(FontAwesomeIcons.twitter, color: Colors.white, size: 26,),
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 255, 44, 37),
          leading: IconButton(
            icon: BackButtonIcon(),
            onPressed: (){
              Navigator.pop(super.context);
            },
          ),
        ),
        body: _body,
      ),
    );
  }
}

class BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 20);

    int doble = 12; int cdy = 40;
    for(var i = 1; i <= (doble / 2); i++){
      if(i.isOdd){
        path.quadraticBezierTo(size.width / doble * (2 * i - 1) - (size.width / (doble *3)), size.height - cdy, size.width / doble * 2 * i, size.height - 20);
      }else{
        path.quadraticBezierTo(size.width / doble * (2 * i - 1) + (size.width / (doble *3)), size.height, size.width / doble * 2 * i, size.height - 20);
      }
    }

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}