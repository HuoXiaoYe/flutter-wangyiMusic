import 'package:flutter/material.dart';

class SongPlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.pink
          ),
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: <Widget>[
              InkWell(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: Icon(Icons.navigate_before),
              ),
              Text("一眼万年")
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
