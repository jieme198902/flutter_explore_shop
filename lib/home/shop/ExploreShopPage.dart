import 'package:flutter/material.dart';

class ExploreShopPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _ExploreShopPageState();
}

///
class _ExploreShopPageState extends State<ExploreShopPage> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('探店'),
          actions: <Widget>[new Container()],
        ),
        body: new Center(
          child: null,
        ),
      ),
    );
  }
}
