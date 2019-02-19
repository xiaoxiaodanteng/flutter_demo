import 'package:flutter/material.dart';
import 'package:toutiao/module/pub.dart';
import 'package:toutiao/news/searchBox.dart';
import 'package:toutiao/news/tabBarBtn.dart';
import 'package:toutiao/news/tabContent.dart';

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  List chanels = [];

  _getChanels () async {
    print('111');
    var data = await PubModule.httpRequest('get', '/getChanels');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _getChanels();
    setState(() {
      chanels = [
        {
          'id': 0,
          'name': 'html'
        },
        {
          'id': 1,
          'name': 'js'
        },
        {
          'id': 2,
          'name': 'css'
        },
        {
          'id': 3,
          'name': 'java'
        },
        {
          'id': 4,
          'name': 'python'
        },
        {
          'id': 5,
          'name': 'c++'
        },
        {
          'id': 6,
          'name': 'php'
        },
        {
          'id': 7,
          'name': '大数据'
        },
      ];

      // print(chanels);
    });
  }

  @override
  Widget build(BuildContext context) {
    return chanels.length == 0 ? SizedBox(height: 20.0) : DefaultTabController(
      length: chanels.length,
      child: Scaffold(
        appBar: AppBar(
          title: SearchBox(),
          elevation: 0.0,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: TabBarBtn(chanels),
          )
        ),
        body: TabBarView(
          children: chanels.map((value) {
            return TabContent(value['id']);
          }).toList()
          /* children: <Widget>[
            TabContent()
          ], */
        ),
        // drawer: DrawerList(),
      ),
    );
  }
}
