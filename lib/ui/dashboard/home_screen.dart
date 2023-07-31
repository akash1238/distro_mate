import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../provider/provider/theme_provider.dart';
import '../../utils/helper/common_methods.dart';
import '../../utils/helper/common_widgets.dart';
import '../../utils/helper/pref_utils.dart';
import '../../utils/helper/theme_manager.dart';
import '../../widgets/input_decor.dart';
import '../cart/cart_screen.dart';
import '../products/product_list_screen.dart';
import '../profile/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          bottomOpacity: 0.0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark, // For iOS (dark icons)
          ),
          toolbarHeight: kToolbarHeight + 1,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonWidgets.commonText(
                  mText: ' Hello, ${PrefUtils.getCompanyName()}',
                  mFontWeight: FontWeight.w700,
                  mColor: Colors.black),
              Wrap(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: Colors.red,
                    size: 20,
                  ),
                  CommonWidgets.commonText(
                      mText: PrefUtils.getAddress(),
                      mSize: 12.0,
                      mFontWeight: FontWeight.w400,
                      mColor: Colors.black),
                ],
              ),
            ],
          ),
          leading: Bounce(
            duration: const Duration(milliseconds: 110),
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      child: ProfileScreen(),
                      type: PageTransitionType.fade,
                      duration: const Duration(milliseconds: 900),
                      reverseDuration: (const Duration(milliseconds: 900))));
            },
            child: Hero(
              tag: 'profile',
              child: Container(
                  margin: const EdgeInsets.only(left: 8),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(color: Colors.white)),
                  child: Image.asset('assets/images/profile.png')),
            ),
          ),
          actions: [
            Row(
              children: [
                Image.asset(
                  'assets/images/notification.png',
                  height: 30,
                ),
                const SizedBox(
                  width: 15,
                ),
                Bounce(
                  duration: const Duration(milliseconds: 100),
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: CartScreen(),
                            type: PageTransitionType.fade,
                            duration: const Duration(milliseconds: 900),
                            reverseDuration: (const Duration(milliseconds: 900))));
                  //  CommonWidgets.showLogountDialog(context);
                  },
                  child: Image.asset(
                    'assets/images/cart.png',
                    height: 30,
                  ),
                ),
                const SizedBox(width: 10),
                Bounce(
                    duration: Duration(milliseconds: 110),
                    onPressed: () {
                      CommonMethods.showLogountDialog(context);
                    },
                    child: const Icon(Icons.power_settings_new,
                        color: Colors.black)),
                const SizedBox(
                  width: 20,
                )
              ],
            )
          ],
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
              children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 375),
                childAnimationBuilder: (widget) => SlideAnimation(
                  horizontalOffset: 50.0,
                  child: SlideAnimation(
                    child: widget,
                  ),
                ),
            children: [
              SizedBox(height: size.height * 0.04),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Row(
                            children: [
                              Icon(Icons.search),
                              CommonWidgets.commonText(
                                  mText: 'Search', mColor: Colors.grey),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Container(
                      height: 50,
                      width: 50,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: ThemeManager.primaryColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Image.asset(
                        'assets/images/filter.png',
                        height: 30,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.04),
              Container(
                  child: CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                ),
                items: imgList
                    .map((item) => Container(
                          child: Image.asset('assets/images/banner.png',
                              fit: BoxFit.fill, width: 1100),
                        ))
                    .toList(),
              )),
              SizedBox(height: size.height * 0.04),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: [
                    Expanded(
                      child: CommonWidgets.commonText(
                          mText: 'Available Brands',
                          mSize: 16.0,
                          mColor: Colors.black,
                          mFontWeight: FontWeight.w700),
                    ),
                    CommonWidgets.commonText(
                        mText: 'See All',
                        mSize: 16.0,
                        mColor: Colors.red,
                        mFontWeight: FontWeight.w700),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.02),
              GridView.builder(
                itemCount: 20,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Bounce(
                    duration: Duration(milliseconds: 110),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                              const ProductListScreen()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/images/brand.png',
                        height: 90,
                      ),
                    ),
                  );
                },
              ),
            ],
          )
          ),
        ));
  }
}
