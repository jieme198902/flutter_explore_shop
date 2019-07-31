import 'package:flutter/material.dart';

class NearByPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _NearByPageState();
}

///
class _NearByPageState extends State<NearByPage> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('周边'),
          actions: <Widget>[new Container()],
        ),
        body: new Center(
          child: null,
        ),
      ),
    );
  }
}
