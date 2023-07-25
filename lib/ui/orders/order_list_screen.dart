import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:distro_mate/ui/address/address_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../provider/provider/theme_provider.dart';
import '../../utils/helper/common_widgets.dart';
import '../../utils/helper/pref_utils.dart';
import '../../utils/helper/theme_manager.dart';
import '../../widgets/input_decor.dart';

class OrderListScreen extends StatefulWidget {
  const OrderListScreen({Key? key}) : super(key: key);

  @override
  State<OrderListScreen> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          bottomOpacity: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark, // For iOS (dark icons)
          ),
          toolbarHeight: kToolbarHeight + 1,
          centerTitle: true,
          backgroundColor: ThemeManager.colorWhite,
          title: CommonWidgets.commonText(
              mText: 'My Orders',
              mFontWeight: FontWeight.w700,
              mColor: Colors.black),
        ),
        body:
            ListView.builder(
              itemCount: 20,
             shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey.shade300)),
                  child: Row(
                    children: [
                      SizedBox(height: 8),
                      Image.asset(
                        'assets/images/products.png',
                        height: 95,
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonWidgets.commonText(
                              mText:
                                  'Accepted on 14 july, 2023',
                              mFontWeight: FontWeight.w400,
                              mSize: 12.0,
                              mColor: Colors.black),
                          CommonWidgets.commonText(
                              mText:
                                  'Tide ultra OXI powder laundry detergent',
                              mFontWeight: FontWeight.w400,
                              mSize: 12.0,
                              mColor: Colors.black),
                          CommonWidgets.commonText(
                              mText: '500 g',
                              mFontWeight: FontWeight.w400,
                              mSize: 12.0,
                              mColor: Colors.black),
                          CommonWidgets.commonText(
                              mText: 'Quantity : 50',
                              mFontWeight: FontWeight.w400,
                              mSize: 12.0,
                              mColor: Colors.black),
                          CommonWidgets.commonText(
                              mText: '\$12.0',
                              mFontWeight: FontWeight.w700,
                              mSize: 14.0,
                              mColor: Colors.black),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
        );
  }


}
