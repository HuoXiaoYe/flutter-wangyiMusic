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
    
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: mineNavList.length,
        itemBuilder: (context,index)=>_navItem(index),
      ),
    );
  }
}