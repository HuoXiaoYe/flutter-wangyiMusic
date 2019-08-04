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
    return Column(
      children: <Widget>[Wriper(wriperList)],
    );
  }
}

// 轮播图

class Wriper extends StatelessWidget {
  //
  List WriperList;
  Wriper(this.WriperList):super();
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
        
      ),
    );
  }
}
