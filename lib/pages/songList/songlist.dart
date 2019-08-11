import 'package:flutter/material.dart';

class SongList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: "导航栏渐变",
        home: HomePage(),
      ),
    );
  }
}

// class HomePage extends StatelessWidget {

// }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _opacity = 0.0;

  _onscroll(offset) {
    // print(offset);

    setState(() {
      _opacity = offset / 250 > 1 ? 1.0 : offset / 250;
      _opacity = _opacity < 0 ? 0.0 : _opacity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollUpdateNotification) {
            _onscroll(scrollNotification.metrics.pixels);
            return true;
          }
          return false;
        },
        child: Stack(
          children: <Widget>[
            Container(
              height: 800,
              child: ListView(
                children: <Widget>[
                  Intro(),
                  SongData(),
                ],
              ),
            ),
            MyAppBar(opacity: _opacity),
          ],
        ),
      ),
    );
  }
}

class MyAppBar extends StatelessWidget {
  final opacity;
  MyAppBar({this.opacity}) : super();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: opacity,
          child: Container(
            width: 500,
            height: 80,
            color: Color.fromRGBO(54, 53, 61, 1),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          alignment: Alignment.center,
          width: 500,
          height: 80,
          color: Colors.transparent,
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.navigate_before,
                    size: 48,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "歌单",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 1),
                      child: Text(
                        "编辑推荐：或许这个宇宙中，也有很多和我一样的人吧",
                        style: TextStyle(color: Colors.white, fontSize: 11),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 18,
                  top: 20,
                ),
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 18, top: 2),
                child: Text(
                  "...",
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      fontSize: 30),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class Intro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color.fromRGBO(54, 53, 61, 0.5),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 20, top: 15),
            alignment: Alignment.center,
            height: 300,
            width: 150,
            child: Stack(
              children: <Widget>[
                ClipRRect(
                  child: Image.network(
                    "http://p.qpic.cn/music_cover/HZnqT8B6sibc2iaxSb6biaOAReu5nQvU4LNMd9kQDCaCWmlxJnVPPKnQA/300?n=1",
                    // width: 300,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                Positioned(
                  left: 10,
                  top: 10,
                  child: Text("VIP",
                      style: TextStyle(color: Colors.white, fontSize: 14)),
                ),
                Positioned(
                    right: 10,
                    top: 6,
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 14,
                        ),
                        Text("183万",
                            style: TextStyle(color: Colors.white, fontSize: 14))
                      ],
                    )),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 20),
            width: 220,
            height: 150,
            // color: Colors.black,
            child: Column(
              children: <Widget>[
                Text(
                  "听完这些歌，恭喜你获得了与孤独和解的能力",
                  style: TextStyle(color: Colors.black45, fontSize: 18),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.music_video,
                        color: Colors.redAccent,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Text(
                          "网易云音乐",
                          style: TextStyle(color: Colors.black38),
                        ),
                      ),
                      Icon(
                        Icons.navigate_next,
                        color: Colors.black38
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  width: 220,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('"我好孤独。"',style: TextStyle(color: Colors.black54),),
                      Icon(Icons.navigate_next,color: Colors.black54)
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SongData extends StatelessWidget {
  final List mylist = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.red,
    Colors.blue,
    Colors.green
  ];
  Widget _item(item) {
    return Container(height: 100, color: item);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 1200,
      child: Column(
        children: mylist.map((item) => _item(item)).toList(),
      ),
    );
  }
}
