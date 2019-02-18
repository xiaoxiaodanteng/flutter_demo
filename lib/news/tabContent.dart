import 'package:flutter/material.dart';
import 'package:toutiao/module/article.dart';
import 'package:toutiao/module/pub.dart';

class TabContent extends StatefulWidget {
  final int id;
  // List data = [];
  TabContent(this.id);
  @override
  _TabContentState createState() => _TabContentState();
}

class _TabContentState extends State<TabContent> {
  List<Article> _data = [];

  _getData() {
    // PubModule.httpRequest('post', '/getData', {'id': widget.id});
    setState(() {
      List dataDemo = [
        {
          'artId': 0,
          'title': '发放是',
          'autId': 2,
          'autName': '麻子',
          'commCount': 5
        },
        {
          'artId': 1,
          'title': '发放23423是',
          'autId': 2,
          'autName': '麻子12',
          'commCount': 5
        },
        {
          'artId': 2,
          'title': '发放是23423',
          'autId': 2,
          'autName': '麻子2',
          'commCount': 676
        },
      ];
      _data = dataDemo.map((value) => Article.fromJson(value)).toList();
      print(_data);
    });
  }

  // 刷新
  _refresh () {
    setState(() {
      
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print(widget.id);
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refresh,
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: ListView.builder(
          itemCount: _data.length,
          itemBuilder: (context, index) {
            return NewsItem(_data[index]);
          },
        )
      ),
    );
  }
}

class NewsItem extends StatelessWidget {
  final Article article;
  NewsItem(this.article);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
      Text(
        article.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16.0
        ),
      ),
      SizedBox(height: 5.0),
      RichText(
        text: TextSpan(
          text: '置顶  ',
          style: TextStyle(
            color: Colors.red
          ),
          children: [
            TextSpan(
              text: article.autName + '   ',
              style: TextStyle(
                color: Colors.grey
              )
            ),
            TextSpan(
              text: '${article.commCount}评论   ',
              style: TextStyle(
                color: Colors.grey
              )
            ),
            TextSpan(
              text: '1小时前',
              style: TextStyle(
                color: Colors.grey
              )
            ),
          ]
        ),
      )
    ]);
  }
}
/* ListView(
  children: <Widget>[
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
      Text(
        'Consectetur incididunt ut pariatur anim fugiat consectetur.',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16.0
        ),
      ),
      SizedBox(height: 5.0),
      RichText(
        text: TextSpan(
          text: '置顶  ',
          style: TextStyle(
            color: Colors.red
          ),
          children: [
            TextSpan(
              text: '好好好  ',
              style: TextStyle(
                color: Colors.grey
              )
            ),
            TextSpan(
              text: '99评论  ',
              style: TextStyle(
                color: Colors.grey
              )
            ),
            TextSpan(
              text: '1小时前',
              style: TextStyle(
                color: Colors.grey
              )
            ),
          ]
        ),
      )
    ],),
    Divider(height: 20.0),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
      Text(
        'Consectetur incididunt ut pariatur anim fugiat consectetur.',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16.0
        ),
      ),

      SizedBox(height: 10.0),

      Row(
        children: <Widget>[
          Expanded(
            child: AspectRatio(
              aspectRatio: 1/1,
              child: Image.network(
                'https://p1.pstatp.com/list/190x124/pgc-image/0032e7df80c44b11bc944eff9e8e54e8',
                fit: BoxFit.cover
              ),
            ),
          ),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1/1,
              child: Image.network(
                'https://p3.pstatp.com/list/190x124/pgc-image/RHrUIHl8i9Q9T4',
                fit: BoxFit.cover
              ),
            )
          ),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1/1,
              child: Image.network(
                'https://p1.pstatp.com/list/190x124/pgc-image/0032e7df80c44b11bc944eff9e8e54e8',
                fit: BoxFit.cover
              ),
            ),
          ),
        ],
      ),

      SizedBox(height: 10.0),

      RichText(
        text: TextSpan(
          text: '置顶  ',
          style: TextStyle(
            color: Colors.red
          ),
          children: [
            TextSpan(
              text: '好好好  ',
              style: TextStyle(
                color: Colors.grey
              )
            ),
            TextSpan(
              text: '99评论  ',
              style: TextStyle(
                color: Colors.grey
              )
            ),
            TextSpan(
              text: '1小时前',
              style: TextStyle(
                color: Colors.grey
              )
            ),
          ]
        ),
      )
    ],),

    Divider(height: 20.0),

    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          Expanded(
            child: Text(
              'Consectetur incididunt ut pariatur anim fugiat consectetur.',
              // maxLines: 1,
              // overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0
              ),
            ),
          ),
          SizedBox(
            child: Image.network(
              'https://p1.pstatp.com/list/190x124/pgc-image/0032e7df80c44b11bc944eff9e8e54e8',
              fit: BoxFit.cover
            ),
            height: 130.0,
            width: 130.0,
          ),
        ]),
        SizedBox(height: 5.0),
        RichText(
          text: TextSpan(
            text: '置顶  ',
            style: TextStyle(
              color: Colors.red
            ),
            children: [
              TextSpan(
                text: '好好好  ',
                style: TextStyle(
                  color: Colors.grey
                )
              ),
              TextSpan(
                text: '99评论  ',
                style: TextStyle(
                  color: Colors.grey
                )
              ),
              TextSpan(
                text: '1小时前',
                style: TextStyle(
                  color: Colors.grey
                )
              ),
            ]
          ),
        )
    ],),
  ],
), */
