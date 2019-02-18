import 'package:flutter/material.dart';
import 'package:toutiao/news/news.dart';
import 'package:toutiao/question/question.dart';
import 'package:toutiao/user/user.dart';
import 'package:toutiao/video/video.dart';

/* class Home extends StatelessWidget {
  List _bodys = [
    News(),
    Question(),
    Video(),
    User(),
  ];
  int index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: _bodys[index],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('首页')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_answer),
            title: Text('问答')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_label),
            title: Text('视频')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('我的')
          ),
        ],
        onTap: (index) {
          print(index);
        },
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
} */

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _bodys = [
    News(),
    Question(),
    Video(),
    User(),
  ];
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodys[_index],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('首页')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_answer),
            title: Text('问答')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_label),
            title: Text('视频')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('我的')
          ),
        ],
        onTap: (index) {
          setState(() {
           _index = index;
          });
        },
        currentIndex: _index,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}