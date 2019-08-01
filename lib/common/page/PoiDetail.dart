import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_explore_shop/common/bean/PoiBean.dart';

///Poi详情
class PoiDetail extends StatefulWidget {
  PoiBean bean;

  PoiDetail(PoiBean bean) {
    this.bean = bean;
    print('ss--> ' + json.encode(bean));
  }

  @override
  State<StatefulWidget> createState() {
    return _PoiDetailState(bean);
  }
}

class _PoiDetailState extends State<PoiDetail> {
  PoiBean bean;

  _PoiDetailState(PoiBean bean) {
    this.bean = bean;
  }

  @override
  Widget build(BuildContext context) {
    return Text(json.encode(bean),style: TextStyle(fontSize: 10),);
  }
}
