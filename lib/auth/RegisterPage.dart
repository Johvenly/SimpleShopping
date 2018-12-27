import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yx/app/OsApplication.dart';
import 'package:yx/domain/event/LoginEvent.dart';
import 'package:yx/utils/WidgetsUtils.dart';
import 'package:yx/utils/cache/SpUtils.dart';
import 'package:yx/utils/net/Api.dart';
import 'package:yx/utils/net/Http.dart';
import 'package:yx/utils/net/YxApi.dart';
import 'package:yx/utils/net/YxHttp.dart';
import 'package:yx/utils/toast/TsUtils.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  WidgetsUtils widgetsUtils;
  var _userPassController = new TextEditingController();
  var _phoneController = new TextEditingController();
  var _shareCodeController = new TextEditingController();
  var _verifyController = new TextEditingController();

  var leftRightPadding = 40.0;
  var topBottomPadding = 4.0;
  var textTips = new TextStyle(fontSize: 16.0, color: Colors.black);
  var hintTips = new TextStyle(fontSize: 15.0, color: Colors.black26);
  static const LOGO = "images/android.jpg";

  String _verifyCode = '';

  int _seconds = 0;

  String _verifyStr = '获取验证码';

  Timer _timer;

  _startTimer() {
    _seconds = 5;

    _timer = new Timer.periodic(new Duration(seconds: 1), (timer) {
      if (_seconds == 0) {
        _cancelTimer();
        return;
      }

      _seconds--;
      _verifyStr = '$_seconds(s)';
      setState(() {});
      if (_seconds == 0) {
        _verifyStr = '重新发送';
      }
    });
  }

  _cancelTimer() {
    _timer?.cancel();
  }

  @override
  void dispose() {
    super.dispose();
    _cancelTimer();
  }

  Widget _buildPhoneEdit() {
    var node = new FocusNode();
    return new Padding(
      padding: new EdgeInsets.fromLTRB(
          leftRightPadding, 40.0, leftRightPadding, topBottomPadding),
      child: new TextField(
        onChanged: (str) {
        },
        style: hintTips,
        controller: _phoneController,
        decoration: new InputDecoration(
          hintText: '请输入手机号',
        ),
        maxLines: 1,
        maxLength: 11,
        //键盘展示为号码
        keyboardType: TextInputType.phone,
        //只能输入数字
        inputFormatters: <TextInputFormatter>[
          WhitelistingTextInputFormatter.digitsOnly,
        ],
        onSubmitted: (text) {
          FocusScope.of(context).reparentIfNeeded(node);
        },
      ),
    );
  }

  Widget _buildVerifyCodeEdit() {
    var node = new FocusNode();
    Widget verifyCodeEdit = new TextField(
      onChanged: (str) {
      },
      decoration: new InputDecoration(
        hintText: '请输入短信验证码',
      ),
      maxLines: 1,
      maxLength: 6,
      controller: _verifyController,
      //键盘展示为数字
      keyboardType: TextInputType.number,
      //只能输入数字
      inputFormatters: <TextInputFormatter>[
        WhitelistingTextInputFormatter.digitsOnly,
      ],
      onSubmitted: (text) {
        FocusScope.of(context).reparentIfNeeded(node);
      },
    );

    Widget verifyCodeBtn = new InkWell(
      onTap: (_seconds == 0)
          ? () {
            if(_phoneController.text.isEmpty){
                return TsUtils.showShort("请先输入手机号码");
            }
            setState(() {
              _startTimer();
            });

            YxHttp.get(YxApi.GET_SMS+_phoneController.text).then((res){
              try {
                Map<String, dynamic> map = jsonDecode(res);
                print(map);
                var data = map['content']['sms_data'];
                setState(() {
                  _verifyCode = data['sms_code'];
                });
              } catch (e) {
                return TsUtils.showShort("获取验证码出错了");
              }
            });
          }
          : null,
      child: new Container(
        alignment: Alignment.center,
        width: 100.0,
        height: 36.0,
        decoration: new BoxDecoration(
          border: new Border.all(
            width: 1.0,
            color: Colors.blue,
          ),
        ),
        child: new Text(
          '$_verifyStr',
          style: new TextStyle(fontSize: 14.0),
        ),
      ),
    );

    return new Padding(
      padding: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
      child: new Stack(
        children: <Widget>[
          verifyCodeEdit,
          new Align(
            alignment: Alignment.topRight,
            child: verifyCodeBtn,
          ),
        ],
      ),
    );
  }

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
        body: new SingleChildScrollView(
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
                  height: 170,
                  child: new Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Text('让生活更简单', style:TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.center,),
                  ),
                  width: widgetsUtils.screenWidth,
                ),
             ),
              _buildPhoneEdit(),
              _buildVerifyCodeEdit(),
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
              new Padding(
                padding: new EdgeInsets.fromLTRB(
                    leftRightPadding, 30.0, leftRightPadding, topBottomPadding),
                child: new TextField(
                  style: hintTips,
                  controller: _shareCodeController,
                  decoration: new InputDecoration(hintText: "请输入约享邀请码"),
                  obscureText: false,
                ),
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
                      _postRegister(
                            _phoneController.text,
                            _userPassController.text,
                            _shareCodeController.text,
                            _verifyController.text
                        );
                    },
                    child: new Padding(
                      padding: new EdgeInsets.all(10.0),
                      child: new Text(
                        '提交注册',
                        style:
                        new TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                    )),
              )
            ],
          ),
        ));
  }

  void _postRegister(String phone, String password, String shareCode,String verifyCode) {

    String passWordConfirm = password;
    if (phone.isNotEmpty &&
        password.isNotEmpty &&
        passWordConfirm.isNotEmpty&&shareCode.isNotEmpty) {
      if (password == passWordConfirm) {
        Map<String, String> params = new Map();
        params['mobile'] = phone;
        params['password'] = password;
        params['promo_code'] = shareCode;
        params['sms_code'] = verifyCode;
        YxHttp.post(YxApi.USER_REGISTER, params: params, saveCookie: true)
            .then((result) {
            print(result);
            //{"content":{"existed":false,"token":"184001a0e48094bf56dc6ff45159cdc5c6f78bfc","user_id":"223","verified":true},"desc":"验证码通过，用户创建!","errors":{},"state":true}
            Map<String, dynamic> map = result['content'];
            if(map["token"] == null){
              TsUtils.showShort(result["desc"]);
              return;
            }
            map['nickname'] = '?';
            map['sys_id'] = '0';
          SpUtils.map2UserInfo(map).then((userInfoBean) {
            if (userInfoBean != null) {
              OsApplication.eventBus
                  .fire(new LoginEvent(userInfoBean.username));
              SpUtils.saveUserInfo(userInfoBean);
              Navigator.pop(context);
            }
          });
        });
      } else {
        TsUtils.showShort('两次密码不一致哟~');
      }
    } else {
      TsUtils.showShort('请输入用户名和密码');
    }
  }
}

class BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 30);
    path.lineTo(size.width, size.height);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}