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
              child: Text(mineNavList[index]["title"],style: TextStyle(color: Colors.black54),),
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
