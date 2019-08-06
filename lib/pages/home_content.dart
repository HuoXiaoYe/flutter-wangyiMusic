import 'package:flutter/material.dart';

// 引入四个主页面

import "./video/video.dart";
import "./cloud/cloud.dart";
import "./search/search.dart";
import "./mine/mine.dart";

// 引入侧抽屉页面

import "./myDrawer/myDrawer.dart";

class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    _controller = new TabController(initialIndex: 1, length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          // 顶部导航栏
          Container(
            height: 20,
          ),
          Container(
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: InkWell(
                    child: Icon(
                      Icons.list,
                      size: 28,
                    ),
                    onTap: () {},
                  ),
                ),
                Container(
                  height: 50,
                  width: 240,
                  padding: EdgeInsets.only(top: 10.0),
                  // color: Colors.white,
                  child: TabBar(
                    controller: _controller,
                    indicatorSize: TabBarIndicatorSize.label,
                    // labelPadding: EdgeInsets.only(bottom: -2.0),
                    // unselectedLabelColor: Colors.red,
                    labelStyle: TextStyle(color: Colors.pink),
                    tabs: <Widget>[
                      Text(
                        "我的",
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        "发现",
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        "云村",
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        "视频",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: InkWell(
                    child: Icon(
                      Icons.search,
                      size: 28,
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),

          // 主体区域
          Expanded(
            child: TabBarView(
              controller: _controller,
              children: <Widget>[Mine(), Search(), Cloud(), Video()],
            ),
          ),
         
        ],
      ),
       drawer: MyDrawer(),
    );
  }
}
