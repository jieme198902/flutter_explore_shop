import 'dart:convert';

//import 'package:amap_location/amap_location.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'common/Constant.dart';
import 'common/Utils.dart';
import 'home/Home.dart';

void main() {
//  AMapLocationClient.setApiKey('0bc36bf5c1df67024b8b477fe3d36d49');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '探店',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: SplashStatefulWidget(),

      ///构建路由信息
      routes: {
        'home': (BuildContext context) => Home(),
      },
    );
  }
}

///状态可变的view
class SplashStatefulWidget extends StatefulWidget {
  SplashStatefulWidget({Key key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<StatefulWidget> createState() {
    return _SplashState();
  }
}

///一定需要注意下划线，😌
class _SplashState extends State<SplashStatefulWidget> {
  var _imgUrl = 'unknown';

  ///banner请求成功
  ok(String result) {
    var wangkResponse = jsonDecode(result);

    setState(() {
      _imgUrl = wangkResponse['data'][0]['bannerImg'];
    });

    ///延迟跳转到home页
    new Future.delayed(
        const Duration(seconds: 1),
        () => Navigator.pushNamedAndRemoveUntil(
            context, 'home', (router) => router == null));
  }

  ///下划线私有方法；获取banner列表
  _getBanner() async {
    Utils()
        .requestPost(findBanner, {'bannerType': '0'}).then(ok, onError: (e) {});
  }

  @override
  Widget build(BuildContext context) {
    return ExtendedImage.network(
      _imgUrl,
      width: ScreenUtil.instance.width,
      height: ScreenUtil.instance.height,
      fit: BoxFit.fill,
      cache: true,
    );
  }

  @override
  void initState() {
    super.initState();
    _getBanner();
  }
}
