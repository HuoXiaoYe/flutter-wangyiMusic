import 'package:flutter/material.dart';

class SongPlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.pink),
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.navigate_before,
                        size: 38,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "走在冷风中",
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          "周二珂",
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                child: Icon(Icons.share),
              )
            ],
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          // color: Colors.red,
          child: Column(
            children: <Widget>[
              Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 78,bottom: 75),
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(200))),
                      // color: Colors.red,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(200)),
                        child: Image.network(
                          "http://qpic.y.qq.com/music_cover/AhbCa0vazSRDjEJhYwthgoxuDAGq1YzV4yAoTrgsiaEnM5SU56fDKvA/300?n=1",
                          fit: BoxFit.fill,
                        ),
                      )),
                  Container(
                    height: 150,
                    color: Colors.blue,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
