import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yx/app/OsApplication.dart';
import 'package:yx/domain/event/LoginEvent.dart';
import 'package:yx/pages/login/RegisterPage.dart';
import 'package:yx/utils/WidgetsUtils.dart';
import 'package:yx/utils/cache/SpUtils.dart';
import 'package:yx/utils/net/Api.dart';
import 'package:yx/utils/net/Http.dart';
import 'package:yx/utils/net/YxApi.dart';
import 'package:yx/utils/net/YxHttp.dart';
import 'package:yx/utils/toast/TsUtils.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  var leftRightPadding = 40.0;
  var topBottomPadding = 4.0;
  var textTips = new TextStyle(fontSize: 16.0, color: Colors.black);
  var hintTips = new TextStyle(fontSize: 15.0, color: Colors.black26);
  static const LOGO = "images/android.jpg";

  var _userPassController = new TextEditingController();
  var _userNameController = new TextEditingController();

  WidgetsUtils widgetsUtils;

  @override
  Widget build(BuildContext context) {
    widgetsUtils = new WidgetsUtils(context);
    return new Scaffold(
      resizeToAvoidBottomPadding: true,
        appBar: new AppBar(
          elevation: 0,
          brightness: Brightness.dark,
          // title: widgetsUtils.getAppBar('登录'),
          iconTheme: new IconThemeData(color: Colors.white),
        ),
        body:
        new SingleChildScrollView(
          child: new Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
             new ClipPath(
               clipper: BottomClipper(),
               child: new Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 252, 130, 45),
                    image: DecorationImage(
                      image: AssetImage('images/bg_login.png',),
                      fit: BoxFit.cover,
                      alignment: AlignmentDirectional.topCenter,
                    ),
                  ),
                  height: 190,
                  child: new Padding(
                    padding: EdgeInsets.only(top: 60),
                    child: Text('—— 约享 ——', style:TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.center,),
                  ),
                  width: widgetsUtils.screenWidth,
                ),
             ),
              new Padding(
                padding: new EdgeInsets.fromLTRB(
                    leftRightPadding, 40.0, leftRightPadding, topBottomPadding),
                child: new TextField(
                  style: hintTips,
                  controller: _userNameController,
                  decoration: new InputDecoration(hintText: "请输入用户名"),
                  obscureText: false,
                ),
              ),
              new Padding(
                padding: new EdgeInsets.fromLTRB(
                    leftRightPadding, 30.0, leftRightPadding, topBottomPadding),
                child: new TextField(
                  style: hintTips,
                  controller: _userPassController,
                  decoration: new InputDecoration(hintText: "请输入用户密码"),
                  obscureText: true,
                ),
              ),
              new InkWell(
                child: new Container(
                    alignment: Alignment.centerRight,
                    child: new Text(
                      '没有账号？马上注册',
                      style: hintTips,
                    ),
                    padding: new EdgeInsets.fromLTRB(
                        leftRightPadding, 10.0, leftRightPadding, 0.0)),
                onTap: (() {
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (context) => new RegisterPage()));
                }),
              ),
              new Container(
                width: 360.0,
                margin: new EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 0.0),
                padding: new EdgeInsets.fromLTRB(leftRightPadding,
                    topBottomPadding, leftRightPadding, topBottomPadding),
                  child: new FlatButton(
                    color: const Color.fromARGB(255, 252, 130, 45),
                    shape: RoundedRectangleBorder(
                      side: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    onPressed: () {
                      _postLogin(
                          _userNameController.text, _userPassController.text);
                    },
                    child: new Padding(
                      padding: new EdgeInsets.all(10.0),
                      child: new Text(
                        '马上登录',
                        style:
                        new TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                    )),
              )
            ],
          )
          ),

    );
  }

  _postLogin(String userName, String userPassword) {
    if (userName.isNotEmpty && userPassword.isNotEmpty) {
      Map<String, String> params = new Map();
      params['username'] = userName;
      params['password'] = userPassword;
      YxHttp.post(YxApi.USER_LOGIN, params: params, saveCookie: true)
          .then((result) {
            if(result["errors"].length > 0){
              TsUtils.showShort(result["desc"]);
              return;
            }
        Map<String, dynamic> map = result['content'];
        SpUtils.map2UserInfo(map).then((userInfoBean) {
          if (userInfoBean != null) {
            OsApplication.eventBus.fire(new LoginEvent(userInfoBean.username));
            SpUtils.saveUserInfo(userInfoBean);
            Navigator.pop(context);
          }
        });
      });
    } else {
      TsUtils.showShort('请输入用户名和密码');
    }
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