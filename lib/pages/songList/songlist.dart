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
            color: Colors.pink,
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
              IconButton(
                onPressed: () {
                  // Navigator.pop(context);
                  Navigator.of(context).pop();

                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.navigate_before,
                  size: 48,
                  color: Colors.black38,
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
                      style: TextStyle(color: Colors.black38, fontSize: 18),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 1),
                      child: Text(
                        "编辑推荐：或许这个宇宙中，也有很多和我一样的人吧",
                        style: TextStyle(color: Colors.black38, fontSize: 11),
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
                  color: Colors.black38,
                  size: 30,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 18, top: 2),
                child: Text(
                  "...",
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Colors.black38,
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
      padding: EdgeInsets.only(top: 40),
      height: 320,

      decoration: BoxDecoration(
        color: Color.fromRGBO(54, 53, 61, 0.5),
        // color: Colors.blue,
        image: DecorationImage(
          image: NetworkImage(
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1565689518074&di=27a4b386e20e7c772171e328cc248853&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201502%2F08%2F20150208174429_wnhM5.jpeg"),
          fit: BoxFit.fill,
          // colorFilter:ColorFilter.mode(Colors.blue, BlendMode.luminosity),
        ),
      ),
      // color: Colors.pink,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            // 顶部下方图片文字
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 20, top: 15),
                alignment: Alignment.center,
                height: 150,
                width: 150,
                // color: Colors.red,
                child: Stack(
                  children: <Widget>[
                    ClipRRect(
                      child: Image.network(
                        "http://p.qpic.cn/music_cover/YqQNFQNJiaSkibexzichdYOoNEGDeYgkNukmO5NA2JqLqx63rgHrP0X5A/300?n=1",
                        // width: 300,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    Positioned(
                      left: 10,
                      top: 10,
                      child: Text("VIP",
                          style:
                              TextStyle(color: Colors.black38, fontSize: 14)),
                    ),
                    Positioned(
                        right: 10,
                        top: 6,
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.play_arrow,
                              color: Colors.black38,
                              size: 14,
                            ),
                            Text("183万",
                                style: TextStyle(
                                    color: Colors.black38, fontSize: 14))
                          ],
                        )),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 20),
                width: 220,
                height: 140,
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
                          Icon(Icons.navigate_next, color: Colors.black38),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      width: 220,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '"我好孤独。"',
                            style: TextStyle(color: Colors.black54),
                          ),
                          Icon(Icons.navigate_next, color: Colors.black54)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
            // alignment: Alignment(1,0),
            padding: EdgeInsets.only(top: 15),
            margin: EdgeInsets.only(top: 20),
            height: 80,
            // color: Colors.black38,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: () {},
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.home,
                        size: 28,
                        color: Colors.black38,
                      ),
                      Text(
                        "导航1",
                        style: TextStyle(color: Colors.black38),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.home,
                        size: 28,
                        color: Colors.black38,
                      ),
                      Text(
                        "导航1",
                        style: TextStyle(color: Colors.black38),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.home,
                        size: 28,
                        color: Colors.black38,
                      ),
                      Text(
                        "导航1",
                        style: TextStyle(color: Colors.black38),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.home,
                        size: 28,
                        color: Colors.black38,
                      ),
                      Text(
                        "导航1",
                        style: TextStyle(color: Colors.black38),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.home,
                        size: 28,
                        color: Colors.black38,
                      ),
                      Text(
                        "导航1",
                        style: TextStyle(color: Colors.black38),
                      )
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
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 1200,
      child: Stack(
        children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width,
              height: 2925,
              alignment: Alignment.topLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    height: 60,
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.music_video,
                          size: 28,
                          color: Colors.red,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text("VIP专享,开通VIP畅听无阻"),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 20),
                    height: 60,
                    child: Row(
                      children: <Widget>[
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "新客仅5元>",
                            style: TextStyle(color: Colors.grey),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)))),
          Positioned(
            top: 60,
            child: Container(
              width: MediaQuery.of(context).size.width,
              // height:2740,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Column(
                children: <Widget>[
                  _itemHeader(),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 40,
                    itemBuilder: (context,index)=>_songItem(index),
                    // itemBuilder: (context,index)=>,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _songItem(index){
    return Container(
      height: 60,
      margin: EdgeInsets.only(top: 10),
      // color: Colors.blue,
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Row(
              children: <Widget>[
                Container(
                  width: 30,
                  alignment: Alignment.center,
                  // color: Colors.red,
                  child:Text((index+1).toString(),style: TextStyle(fontSize: 24,color: Colors.black54),)
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("小星星(Remastered ver.)",style: TextStyle(fontSize: 16),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(right: 4,top: 4),
                            alignment: Alignment.center,
                            width: 20,
                            height: 12,
                            child: Text("VIP",style: TextStyle(fontSize: 10,color: Colors.red),),
                            decoration: BoxDecoration(
                              border: Border.all(width: 1,color: Colors.red)
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 4,top: 4),
                            alignment: Alignment.center,
                            width: 20,
                            height: 12,
                            child: Text("SVIP",style: TextStyle(fontSize: 10,color: Colors.red),),
                            decoration: BoxDecoration(
                              border: Border.all(width: 1,color: Colors.red)
                            ),
                          ),
                          Container(
                             margin: EdgeInsets.only(right: 4,top: 4),
                            alignment: Alignment.center,
                            width: 20,
                            height: 12,
                            child: Text("SQ",style: TextStyle(fontSize: 10,color: Colors.red),),
                            decoration: BoxDecoration(
                              border: Border.all(width: 1,color: Colors.red)
                            ),
                          ),
                          Text("周振南-Little Star-V的序曲",style: TextStyle(color: Colors.black54),)
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),

        ],
      ),
    );
  }

  Widget _itemHeader() {
    return Container(
      alignment: Alignment.center,
      height: 60,
      // color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Row(
              children: <Widget>[
                Icon(Icons.music_note),
                Text("播放全部"),
                Text("(共40首)",style: TextStyle(color: Colors.grey),)
              ],
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(right: 20),
              alignment: Alignment.center,
              width: 110,
              height: 38,
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.add,color: Colors.white,),
                  Text("收藏(22942)",style: TextStyle(color: Colors.white),),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
