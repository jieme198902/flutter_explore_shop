import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_explore_shop/common/Utils.dart';
import 'dart:convert';

import 'package:flutter_explore_shop/common/bean/PoiBean.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExploreShopPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _ExploreShopPageState();
}

///
class _ExploreShopPageState extends State<ExploreShopPage> {
  GlobalKey<EasyRefreshState> _easyRefreshKey =
      new GlobalKey<EasyRefreshState>();
  GlobalKey<RefreshHeaderState> _headerKey =
      new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footerKey =
      new GlobalKey<RefreshFooterState>();

  List<Data> _data = List();

  int _page = 1;

  ok(String result) {
    setState(() {
      if (1 == _page) {
        _data.clear();
      }
      _page++;
      List list = json.decode(result)['data'];
      var data = list.map((m) => Data.fromJson(m)).toList();
      _data.addAll(data);
    });
  }

  ///请求
  _request() {
    Utils().requestPost("/explore-shop/api/business/findPoiList",
        {'page': _page.toString(), 'size': '20'}).then(ok, onError: (e) {});
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('探店'),
          actions: <Widget>[new Container()],
        ),
        body: new Center(
          child: new EasyRefresh(
            key: _easyRefreshKey,
            behavior: ScrollBehavior(),
            refreshHeader: ClassicsHeader(
              key: _headerKey,
              bgColor: Colors.transparent,
              textColor: Colors.black87,
              moreInfoColor: Colors.black54,
              showMore: true,
            ),
            refreshFooter: ClassicsFooter(
              key: _footerKey,
              bgColor: Colors.transparent,
              textColor: Colors.black87,
              moreInfoColor: Colors.black54,
              showMore: true,
            ),
            child: new ListView.builder(
                itemCount: _data.length,
                itemBuilder: (BuildContext context, int index) {
                  var bean = _data[index];
                  return new Container(
                      height: 70.0,
                      child: new Row(
                        children: <Widget>[
                          ExtendedImage.network(
                            ((null == bean.poiCover) ? "" : bean.poiCover),
                            width: 60,
                            height: 60,
                            fit: BoxFit.fill,
                            cache: true,
                          ),
                          new Column(
                            children: <Widget>[
                              new Text(bean.poiName),
                              new Text("营业时间：" + bean.poiBusinessHours),
                              new Text((null == bean.poiMapLocation)
                                  ? ""
                                  : bean.poiMapLocation),
                            ],
                          )
                        ],
                      ));
                }),
            onRefresh: () async {
              _page = 1;
              print('onrefresh');
              _request();
            },
            loadMore: () async {
              print('loadMore');
              _request();
            },
          ),
        ),
      ),
    );
  }
}
