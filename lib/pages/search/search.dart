import "package:flutter/material.dart";

import "package:flutter_swiper/flutter_swiper.dart";

import "../../config/resource.dart";

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Wriper(wriperList), // 轮播图
          NavBar(navList), // 导航
          RecommendSongList("推荐歌单", "歌单广场", recommendList), // 推荐歌单
        ],
      ),
    );
  }
}

// 轮播图

class Wriper extends StatelessWidget {
  //
  List WriperList;
  Wriper(this.WriperList) : super();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.0),
      height: 150.0,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return new Image.network(
            WriperList[index],
            fit: BoxFit.fill,
          );
        },
        itemCount: WriperList.length,
        itemWidth: 300.0,
        viewportFraction: 0.85,
        scale: 0.9,
        autoplay: true,
      ),
    );
  }
}

// 导航栏

class NavBar extends StatelessWidget {
  List navList;
  NavBar(this.navList) : super();
  // 每一个item

  Widget _navItem(context, item) {
    return InkWell(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Colors.black12),
              child: ClipOval(
                child: Image.network(item["img"], width: 60),
              )),
          Text(item["desc"])
        ],
      ),
      onTap: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0, bottom: 10),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 0.5, color: Colors.black38))),
      height: 110.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: navList.map((item) => _navItem(context, item)).toList(),
      ),
    );
  }
}

// 推荐歌单

class RecommendSongList extends StatelessWidget {
  List recommendList;
  String str1;
  String str2;

  RecommendSongList(this.str1, this.str2, this.recommendList) : super();

  // 推荐歌单标题
  Widget _title(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            str1,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            padding: EdgeInsets.only(bottom: 3, top: 3, left: 10, right: 10),
            child: InkWell(
              child: Text(str2),
            ),
            decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(Radius.circular(15))),
          )
        ],
      ),
    );
  }

  Widget _recommendItem(BuildContext context, item) {
    return InkWell(
      child: Container(
        width: 130,
        height: 180,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 120,
                  child: Image.network(
                    item["img"],
                    width: 125,
                  ),
                ),
                Positioned(
                  right: 4,
                  child:Row(
                    children: <Widget>[
                      Icon(Icons.playlist_play,size: 14,),
                      Text(item["count"],style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400),)
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, left: 10),
              child: Text(
                item["desc"],
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
      onTap: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 410,
      child: Column(
        children: <Widget>[
          _title(context),
          Wrap(
            spacing: 3,
            children: recommendList
                .map((item) => _recommendItem(context, item))
                .toList(),
          )
        ],
      ),
    );
  }
}
