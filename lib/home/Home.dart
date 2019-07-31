import 'package:flutter/material.dart';
import 'package:flutter_explore_shop/common/NavigationIconView.dart';

import 'mine/MinePage.dart';
import 'nearby/NearByPage.dart';
import 'shop/ExploreShopPage.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

///
class _HomeState extends State<Home> with TickerProviderStateMixin {
  int _currentIndex = 0; // 当前界面的索引值
  List<NavigationIconView> _navigationViews; // 底部图标按钮区域
  List<StatefulWidget> _pageList; // 用来存放我们的图标对应的页面
  StatefulWidget _currentPage; // 当前的显示页面

  // 定义一个空的设置状态值的方法
  void _rebuild() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    // 初始化导航图标
    _navigationViews = <NavigationIconView>[
      new NavigationIconView(
          icon: new Icon(Icons.assessment), title: new Text("探店"), vsync: this),
      // vsync 默认属性和参数
      new NavigationIconView(
          icon: new Icon(Icons.all_inclusive),
          title: new Text("附近"),
          vsync: this),
      new NavigationIconView(
          icon: new Icon(Icons.perm_identity),
          title: new Text("我的"),
          vsync: this),
    ];

    // 给每一个按钮区域加上监听
    for (NavigationIconView view in _navigationViews) {
      view.controller.addListener(_rebuild);
    }

    // 将我们 bottomBar 上面的按钮图标对应的页面存放起来，方便我们在点击的时候
    _pageList = <StatefulWidget>[
      new ExploreShopPage(),
      new NearByPage(),
      new MinePage(),
    ];
    _currentPage = _pageList[_currentIndex];
  }

  @override
  Widget build(BuildContext context) {
    // 声明定义一个 底部导航的工具栏
    final BottomNavigationBar bottomNavigationBar = new BottomNavigationBar(
      items: _navigationViews
          .map((NavigationIconView navigationIconView) =>
              navigationIconView.item)
          .toList(), // 添加 icon 按钮
      currentIndex: _currentIndex, // 当前点击的索引值
      type: BottomNavigationBarType.fixed, // 设置底部导航工具栏的类型：fixed 固定
      onTap: (int index) {
        // 添加点击事件
        setState(() {
          // 点击之后，需要触发的逻辑事件
          _navigationViews[_currentIndex].controller.reverse();
          _currentIndex = index;
          _navigationViews[_currentIndex].controller.forward();
          _currentPage = _pageList[_currentIndex];
        });
      },
    );

    return new MaterialApp(
      home: new Scaffold(
        body: new Center(child: _currentPage // 动态的展示我们当前的页面
            ),
        bottomNavigationBar: bottomNavigationBar, // 底部工具栏
      ),
      theme: new ThemeData(
        primarySwatch: Colors.blue, // 设置主题颜色
      ),
    );
  }
}