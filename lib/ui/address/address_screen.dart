import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../provider/provider/theme_provider.dart';
import '../../utils/helper/common_widgets.dart';
import '../../utils/helper/pref_utils.dart';
import '../../utils/helper/theme_manager.dart';
import '../../widgets/input_decor.dart';
import 'add_addres_screen.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
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
              mText: 'Address',
              mFontWeight: FontWeight.w700,
              mColor: Colors.black),
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 70.0, left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.builder(
                    itemCount: 2,
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
                            SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonWidgets.commonText(
                                    mText: 'Akash Gupta',
                                    mFontWeight: FontWeight.w400,
                                    mSize: 12.0,
                                    mColor: Colors.black),
                                CommonWidgets.commonText(
                                    mText:
                                        'Glycol private limited sector 126, Noida.',
                                    mFontWeight: FontWeight.w400,
                                    mSize: 12.0,
                                    mColor: Colors.black),
                                CommonWidgets.commonText(
                                    mText: 'Near by Samsung Tower',
                                    mFontWeight: FontWeight.w400,
                                    mSize: 12.0,
                                    mColor: Colors.black),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Bounce(
              duration: Duration(milliseconds: 110),
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: AddAddressScreen(),
                        type: PageTransitionType.fade,
                        duration: const Duration(milliseconds: 900),
                        reverseDuration: (const Duration(milliseconds: 900))));
              },
              child: Container(
                height: 35,
                padding: EdgeInsets.symmetric(horizontal: 15),
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: ThemeManager.primaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: CommonWidgets.commonText(
                      mText: 'Add Address',
                      mFontWeight: FontWeight.w700,
                      mSize: 12.0,
                      mColor: Colors.white),
                ),
              ),
            ),
          ],
        ));
  }
}
