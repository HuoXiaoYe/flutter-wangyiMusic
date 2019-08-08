import "package:flutter/material.dart";

import "../../config/resource.dart";

class Mine extends StatefulWidget {
  @override
  _MineState createState() => _MineState();
}

class _MineState extends State<Mine> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        NavTabbar(), // 顶部导航栏
        Divider(
          height: 5,
          color: Colors.black54,
        ),
        MyMusicDesc(), // 个人音乐描述列表
      ],
    ));
  }
}

// 顶部导航栏
class NavTabbar extends StatelessWidget {
  Widget _navItem(index) {
    return Container(
      margin: EdgeInsets.only(right: 25),
      child: InkWell(
        onTap: () {},
        child: Column(
          children: <Widget>[
            ClipOval(
              child: Image.network(
                mineNavList[index]["img"],
                width: 60,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                mineNavList[index]["title"],
                style: TextStyle(color: Colors.black54),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
      height: 95,
      child: ListView.builder(
        // padding: EdgeInsets.only(bottom: 20),
        scrollDirection: Axis.horizontal,
        itemCount: mineNavList.length,
        itemBuilder: (context, index) => _navItem(index),
      ),
    );
  }
}

class MyMusicDesc extends StatelessWidget {
  Widget _descItem(item) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(left: 10),
      height: 50,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            Icons.music_video,
            size: 30,
          ),
          Expanded(
            child: Container(
                margin: EdgeInsets.only(left: 10, top: 4),
                padding: EdgeInsets.only(bottom: 15),
                child: Row(
                  children: <Widget>[
                    Text(item['title']),
                    Text("(${item['desc']})")
                  ],
                ),
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(width: 0.5, color: Colors.black12)))),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Column(
        children: mineMusicList.map((item) => _descItem(item)).toList(),
      ),
    );
  }
}
