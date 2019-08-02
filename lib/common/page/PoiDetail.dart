import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_explore_shop/common/bean/PoiBean.dart';

///Poi详情
class PoiDetail extends StatefulWidget {
  var beanStr;

  PoiDetail({Key key, this.beanStr}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PoiDetailState();
  }
}

class _PoiDetailState extends State<PoiDetail> {
  _menu() {
    print('menu');
  }

  ///
  @override
  Widget build(BuildContext context) {
    PoiBean bean = PoiBean.fromJson(jsonDecode(widget.beanStr));

    return Scaffold(
      appBar: AppBar(
        title: Text(bean.poiName),
        actions: <Widget>[
          Container(
              child: InkWell(
            child: Image.asset(
              'images/caidan.png',
              width: 40,
              height: 40,
            ),
            onTap: _menu,
          )),
        ],
      ),
      body: Center(
        child: Text(jsonEncode(bean)),
      ),
    );
  }
}
