import 'dart:async';

import 'package:flutter/material.dart';
/* import 'dart:io';
import 'package:dio/dio.dart'; */
import 'package:toutiao/module/pub.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
        elevation: 0.0,
      ),
      body: Container(
        color: Colors.grey[100],
        child: Formregist(),
      ),
    );
  }
}

class Formregist extends StatefulWidget {
  @override
  _FormregistState createState() => _FormregistState();
}

class _FormregistState extends State<Formregist> {
  String _verifyStr = '获取验证码';
  int _seconds = 0;
  Timer _timer;
  String username = '';
  String smsCode = '';

  // 获取验证码
  _getSmscode() {
    if(_seconds == 0 && username != '') {
      // 开启倒计时
      _startTimer();

      // 请求短信
      // http请求
      // 1引入Io
      // 2建立client
      /* var httpClient = new HttpClient();
      // 3构造uri
      var uri = new Uri.http('baidu.com', '/path', {'name': '大爷'});
      // 4发起请求
      var request = await httpClient.getUrl(uri);
      // 5关闭请求
      var response = await request.close(); */

      PubModule.httpRequest('get', '/getSmsCode').then((response) {
        // print(response);
        Scaffold.of(context).showSnackBar(
          SnackBar(content: Text('验证码发送成功!'),)
        );
      });
    }
  }

  // 开启倒计时
  _startTimer() {
    _seconds = 10;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if(_seconds == 0) {
        _cancelTimer();
        return;
      }
      _seconds--;
     setState(() {
       if(_seconds == 0) {
         _verifyStr = '重新获取验证码';
       } else {
         _verifyStr = '$_seconds(S)'; 
       }
     });
    });
  }
  // 关闭定时器
  _cancelTimer() {
    _timer.cancel();
  }

  // 登录
  _login(context) async{
    /* PubModule.httpRequest('post', '/login', {'username':username, 'smsCode':smsCode}).then((response) {
        print(response);
    }); */
    // 数据持久化
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getString('token'));
    await prefs.setString('token', '889988');
    // Navigator.pushNamed(context, '/home');
    Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: TextField(
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.mobile_screen_share, color: Colors.grey,),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black12
              )
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black12
              )
            ),
            hintText: '请输入手机号',
            hintStyle: TextStyle(
              color: Colors.black38,
              fontSize: 14.0
            )
          ),
          onChanged: (value) {
            setState(() {
             username = value; 
            });
          },
          onSubmitted: (value) {

          },
        ),
      ),
      Container(
        color: Colors.white,
        child: Row(children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.verified_user, color: Colors.grey,),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide.none
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide.none
                  ),
                  hintText: '请输入验证码',
                  hintStyle: TextStyle(
                    color: Colors.black38,
                    fontSize: 14.0
                  )
                ),
                onChanged: (value) {
                  setState(() {
                    smsCode = value; 
                  });
                },
                onSubmitted: (value) {

                },
              ),
            )
          ),
          GestureDetector(
            onTap: () {
              _getSmscode();
            },
            child: Container(
              width: 110.0,
              height: 30.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color.fromARGB(51, 51, 51, 1),
                borderRadius: BorderRadius.circular(115.0)
              ),
              child: Text(_verifyStr),
            ),
          ),
          SizedBox(width: 10.0)
        ]),
      ),
      Container(
        width: double.infinity,
        height: 40.0,
        // color: Colors.blue,
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        margin: EdgeInsets.only(top: 20.0),
        child: RaisedButton(
          onPressed: username == '' || smsCode == '' ? null : () {
            _login(context);
          },
          child: Text(
            '登录',
            style: TextStyle(
              color: Colors.white
            ),
          ),
          disabledColor: Colors.blue[200],
          color: Colors.blue,
          elevation: 0.0,
        ),
      )
    ],);
  }
}