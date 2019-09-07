/*
 * @Author: meetqy
 * @since: 2019-08-06 11:35:23
 * @lastTime: 2019-09-07 11:10:05
 * @LastEditors: meetqy
 */

import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/pages/toolbar/home/index.dart';
import 'package:flutter_luckin_coffee/pages/toolbar/menu/index.dart';
import 'package:flutter_luckin_coffee/pages/toolbar/mine/index.dart';
import 'package:flutter_luckin_coffee/pages/toolbar/order/index.dart';
import 'package:flutter_luckin_coffee/pages/toolbar/shoppingCart/index.dart';
import 'package:flutter_luckin_coffee/utils/index.dart';

class Toolbar extends StatefulWidget {
  final String routeName;

  // 初始化所有的toolbar页面
  static Home _home = Home();
  static Menu _menu = Menu();
  static Order _order = Order();
  static ShoppingCart _shoppingCart = ShoppingCart();
  static Mine _mine = Mine();


  // 所有导航页面
  final Map<int, Map> pages = { 
    0: _createPage(_home, appbar: _home.getAppBar()),
    1: _createPage(_menu, appbar: _menu.getAppBar()),
    2: _createPage(_order, appbar: _order.getAppBar()),
    3: _createPage(_shoppingCart, appbar: _shoppingCart.getAppBar()),
    4: _createPage(_mine, appbar: _mine.getAppBar())
  };
  

  /// 创建页面map
  /// ```
  /// @param {Widget} page - 页面
  /// @param {Appbar} appbar - 当前页面是否显示appbar 默认为true
  /// ```
  static Map _createPage(Widget page, { AppBar appbar}) {
    return {
      "widget": page,
      "appbar": appbar
    };
  }

  Toolbar({
    this.routeName,
  });

  // 通过 routeName 获取对应页面的索引
  getPageIndex(routeName) {
    switch(routeName) {
      case '/menu': return 1;
      case '/order': return 2;
      case '/shopping_cart': return 3;
      case '/mine': return 4;
      default: return 0;
    }
  }


  _NavigationState createState() {
    
    return _NavigationState(getPageIndex(routeName));
  }
}

class _NavigationState extends State<Toolbar> {
  static int currentIndex;


  _NavigationState(int index) {
    currentIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    var page = widget.pages[currentIndex];

    return Scaffold(
      appBar: page['appbar'],
      body: Container(
        color: hex('#fff'),
        child: page['widget']
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: iconlogoNotText(),
              title: Text('首页'),
            ),
            BottomNavigationBarItem(
              icon: iconcaidan(),
              title: Text('菜单'),
            ),
            BottomNavigationBarItem(
              icon: iconorder(),
              title: Text('订单'),
            ),
            BottomNavigationBarItem(
              icon: icongouwuche(),
              title: Text('购物车'),
            ),
            BottomNavigationBarItem(
              icon: iconmine(),
              title: Text('我的'),
            ),  
          ],
          unselectedFontSize: 10, // 未选中字体大小
          selectedFontSize: 10, // 选中字体大小
          selectedItemColor: rgba(43, 76, 126, 1), // 选中字体颜色
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        )
      )
    );
  }
}