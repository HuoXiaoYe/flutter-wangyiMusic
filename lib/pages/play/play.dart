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
              )
              ,Container(
                child: Icon(Icons.share),
              )
            ],
          ),
        ),
        body: Center(
          child: Text("nihao"),
        ),
      ),
    );
  }
}
