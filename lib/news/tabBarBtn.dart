import 'package:flutter/material.dart';

class TabBarBtn extends StatelessWidget {
  final List chanels;
  TabBarBtn(this.chanels);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: TabBar(
        labelColor: Colors.black,
        unselectedLabelColor: Colors.black45,
        indicatorColor: Colors.blueAccent,
        indicatorWeight: 3.0,
        indicatorSize: TabBarIndicatorSize.label,
        isScrollable: true, // 设置滚动
        labelPadding: EdgeInsets.symmetric(horizontal: 20.0),
        labelStyle: TextStyle(fontSize: 16.0),
        tabs: chanels.map((value){
          return Tab(text: value['name']);
        }).toList(),
      ),
    );
  }
}
