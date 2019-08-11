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
            color: Color.fromRGBO(145, 15, 25, 1),
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
      color: Colors.lightBlue,
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
