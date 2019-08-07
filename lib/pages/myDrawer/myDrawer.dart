import "package:flutter/material.dart";

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: <Widget>[
        DrawerHeaderInfo(), // 个人信息区域
        DrawerNav(), // 侧抽屉导航
        Padding(
          child: Divider(indent: 12, endIndent: 12, color: Colors.black87),
          padding: EdgeInsets.only(top: 6),
        ),
        ColumnNav(), // 纵列列表导航
        Divider(indent: 12, endIndent: 12, color: Colors.black87),
        MyBottomAppBar() // 底部设置
      ],
    ));
  }
}

// 个人信息区域
class DrawerHeaderInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: FractionalOffset(0, 1.3),
      children: <Widget>[
        Container(
          height: 180,
          padding: EdgeInsets.only(bottom: 15),
          color: Color.fromRGBO(214, 216, 215, 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: ClipOval(
                  child: Image.network(
                    "http://p.qpic.cn/music_cover/8icT3FJia3icDlR3nFE4vFIyd2tNho7tqTNyof0T1cmZJaibibIErUIVialQ/300?n=1",
                    width: 60,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20, left: 20, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          Text("霍小叶"),
                          Container(
                            width: 10,
                          ),
                          Icon(Icons.music_video, size: 18, color: Colors.red),
                          Container(
                            // width: 30,
                            // height: 10,
                            margin: EdgeInsets.only(left: 10),
                            padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                            // color: Colors.black12,
                            child: Text("LV.6"),
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      padding: EdgeInsets.fromLTRB(16, 2, 16, 2),
                      child: Text(
                        "签到",
                        style: TextStyle(color: Colors.white70),
                      ),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(254, 58, 59, 1),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
          // bottom: ,
          child: Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            height: 60,
            // color: Colors.black,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: ClipRRect(
              child: Image.asset("images/black.PNG"),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
          // bottom: 20,
        ),
      ],
    );
  }
}

// 下方导航栏区域

class DrawerNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          InkWell(
            onTap: () {},
            child: Column(
              children: <Widget>[
                Stack(
                  alignment: Alignment(3.6, -3),
                  children: <Widget>[
                    Icon(
                      Icons.message,
                      color: Colors.red,
                    ),
                    Container(
                      // padding: EdgeInsets.all(3),
                      width: 16,
                      height: 16,
                      alignment: Alignment.center,
                      child: Text(
                        "2",
                        style: TextStyle(color: Colors.white),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(14))),
                    )
                  ],
                ),
                Container(
                  height: 6,
                ),
                Text(
                  "我的消息",
                  style: TextStyle(fontSize: 12),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {},
            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(left: 15)),
                Icon(Icons.child_friendly, color: Colors.red),
                Container(
                  height: 6,
                ),
                Text(
                  "我的好友",
                  style: TextStyle(fontSize: 12),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {},
            child: Column(
              children: <Widget>[
                Icon(Icons.people, color: Colors.red),
                Container(
                  height: 6,
                ),
                Text(
                  "个性换肤",
                  style: TextStyle(fontSize: 12),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {},
            child: Column(
              children: <Widget>[
                Icon(Icons.queue_music, color: Colors.red),
                Container(
                  height: 6,
                ),
                Text(
                  "听歌识曲",
                  style: TextStyle(fontSize: 12),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 纵列列表导航

class ColumnNav extends StatelessWidget {
  List<Map> columnNavList = [
    {"title": "演出", "icon": "Icons.shop"},
    {"title": "商城", "icon": "Icons.shop"},
    {"title": "附近的人", "icon": "Icons.shop"},
    {"title": "口袋铃声", "icon": "Icons.shop"},
    {"title": "我的订单", "icon": "Icons.shop"},
    {"title": "定是停止播放", "icon": "Icons.shop"},
    {"title": "扫一扫", "icon": "Icons.shop"},
    {"title": "音乐闹钟", "icon": "Icons.shop"},
    {"title": "音乐云盘", "icon": "Icons.shop"},
    {"title": "在线听歌免流量", "icon": "Icons.shop"},
    {"title": "附近的人", "icon": "Icons.shop"},
    {"title": "口袋铃声", "icon": "Icons.shop"},
    {"title": "我的订单", "icon": "Icons.shop"},
  ];

  Widget _columnNavItem(BuildContext context, index) {
    return Container(
      height: 40,
      margin: EdgeInsets.only(left: 20),
      child: Row(
        children: <Widget>[
          Icon(Icons.shop, color: Colors.black38),
          // Icon(columnNavList[index]["icon"]),
          Padding(
            padding: EdgeInsets.only(left: 6),
            child: Text(columnNavList[index]["title"]),
          )
          // Text("你好"),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 330,
      child: ListView.builder(
        padding: EdgeInsets.only(top: 0),
        itemCount: columnNavList.length,
        itemBuilder: (context, index) {
          return _columnNavItem(context, index);
        },
      ),
    );
  }
}

class MyBottomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          InkWell(
            onTap: (){},
            child: Row(
              children: <Widget>[Icon(Icons.mood), Container(width: 3,) ,Text("夜间模式")],
            ),
          ),
          InkWell(
            onTap: (){},
            child:Padding(
              padding: EdgeInsets.only(top: 3),
              child: Row(
              children: <Widget>[Icon(Icons.settings), Container(width: 3,) ,Text("设置")],
            ),),
          ),
          InkWell(
            onTap: (){},
            child: Row(
              children: <Widget>[Icon(Icons.all_out), Container(width: 3,) ,Text("退出")],
            ),
          )
        ],
    );
  }
}
