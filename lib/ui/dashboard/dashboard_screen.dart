import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:distro_mate/utils/helper/common_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/helper/theme_manager.dart';
import '../orders/order_list_screen.dart';
import 'home_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage: 1);

  /// Controller to handle bottom nav bar and also handles initial page
  final _controller = NotchBottomBarController(index: 1);

  int maxCount = 5;
  var _pagedata;
  static int _SelectedItem = 0;
  bool showSelectedLabels = true;
  bool showUnselectedLabels = false;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// widget list

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pagedata = [
      const HomeScreen(),
      const OrderListScreen(),
      const Page3(),
    ];
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(child: _pagedata[_SelectedItem]),
      bottomNavigationBar: SnakeNavigationBar.color(
        backgroundColor: Colors.transparent,
        behaviour: SnakeBarBehaviour.pinned,
        snakeShape: SnakeShape.indicator,
        shape: null,
        // padding: EdgeInsets.fromLTRB(10, 0, 0, 0),

        snakeViewColor:ThemeManager.primaryColor,
        selectedItemColor: ThemeManager.primaryColor,
        unselectedItemColor: Colors.black,

        //snakeViewGradient: selectedGradient,
        // /selectedItemGradient: snakeShape == SnakeShape.indicator ? selectedGradient : null,
        //unselectedItemGradient: unselectedGradient,

        showUnselectedLabels: true,
        showSelectedLabels: true,
        unselectedLabelStyle: const TextStyle(fontSize: 12,fontWeight: FontWeight.w700),
        selectedLabelStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.w700),
        currentIndex: _SelectedItem,
        onTap: (setValue) {
          setState(() {
            _SelectedItem = setValue;
          });
        },
        //onTap: (index) => setState(() => _selectedItemPosition = index),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: 'Orders'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_accessibility),
              label: 'Settings'),
        ],
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Center(
            child: CommonWidgets.commonText(
                mText: 'Coming Soon', mColor: Colors.black,mFontWeight: FontWeight.w800)));
  }
}
