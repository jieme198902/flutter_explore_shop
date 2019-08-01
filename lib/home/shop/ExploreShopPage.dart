import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_explore_shop/common/Constant.dart';
import 'package:flutter_explore_shop/common/Utils.dart';
import 'package:flutter_explore_shop/common/adapter/ItemChild.dart';

import 'package:flutter_explore_shop/common/bean/PoiBean.dart';

///探店列表
class ExploreShopPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _ExploreShopPageState();
}

///
class _ExploreShopPageState extends State<ExploreShopPage> {
  GlobalKey<EasyRefreshState> _easyRefreshKey =
      new GlobalKey<EasyRefreshState>();

  //
  GlobalKey<RefreshHeaderState> _headerKey =
      new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footerKey =
      new GlobalKey<RefreshFooterState>();

  List<PoiBean> _data = List();

  int _page = 1;

  @override
  void initState() {
    super.initState();
    _request();
  }

  ok(String result) {
    setState(() {
      if (1 == _page) {
        _data.clear();
      }
      _page++;
      List list = handleResp(result).data;
      var data = list.map((m) => PoiBean.fromJson(m)).toList();
      _data.addAll(data);
    });
  }

  ///请求
  _request() {
    Utils().requestPost(findPoiList,
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
            refreshHeader: MaterialHeader(
              key: _headerKey,
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
                  return getPoiItem(context, _data[index], index);
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
