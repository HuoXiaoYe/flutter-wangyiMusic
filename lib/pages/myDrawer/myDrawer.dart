import "package:flutter/material.dart";

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: <Widget>[
      
        // 个人信息区域
        Stack(
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
                              Icon(Icons.music_video,
                                  size: 18, color: Colors.red),
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
                          padding: EdgeInsets.fromLTRB(16,2,16,2),
                          child: Text("签到",style: TextStyle(color:Colors.white70),),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(254, 58, 59, 1),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
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
                margin: EdgeInsets.only(left: 20,right: 20),
                height: 60,
                // color: Colors.black,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: ClipRRect(
                  child: Image.asset("images/black.PNG"),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
              // bottom: 20,
            ),
          ],
        )
      ],
    )
        // child: Text("你好 flutter"),

        );
  }
}
