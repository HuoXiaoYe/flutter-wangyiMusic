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
      
      child:Column(
        children: <Widget>[
          NavTabbar(), // 顶部导航栏
        ],
      )
    );
  }
}

 // 顶部导航栏
class NavTabbar extends StatelessWidget {

  Widget _navItem(index){
    return Container(
      child: Column(
        children: <Widget>[
          ClipOval(
            child: Image.network(mineNavList[index]["img"],width: 80,fit: BoxFit.fill,),
          ),
          Text(mineNavList[index]["title"])
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20,left: 10,right: 10),
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: mineNavList.length,
        itemBuilder: (context,index)=>_navItem(index),
      ),
    );
  }
}