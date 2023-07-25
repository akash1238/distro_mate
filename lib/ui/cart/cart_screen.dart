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

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<String> payModeList = ['Online Payment', 'My Wallet', 'My Credit Limit'];
  var paymentMode = ''.obs;

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
              mText: 'Cart',
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
                            SizedBox(height: 8),
                            Image.asset(
                              'assets/images/products.png',
                              height: 90,
                            ),
                            SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                  CommonWidgets.commonText(
                      mText: 'Order quantity should be 100 or greater*',
                      mFontWeight: FontWeight.w500,
                      mSize: 10.0,
                      mColor: Colors.red),
                  SizedBox(height: 30),
                  CommonWidgets.commonText(
                      mText: 'Delivery Address',
                      mSize: 16.0,
                      mColor: Colors.black,
                      mFontWeight: FontWeight.w700),
                  SizedBox(height: 15),
                  Bounce(
                    duration: Duration(milliseconds: 110),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddressScreen()));
                    },
                    child: Container(
                      height: 30,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                          color: ThemeManager.primaryColor,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: CommonWidgets.commonText(
                            mText: 'Add Address',
                            mFontWeight: FontWeight.w700,
                            mSize: 12.0,
                            mColor: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Expanded(
                        child: CommonWidgets.commonText(
                            mText: 'Item Total',
                            mFontWeight: FontWeight.w600,
                            mSize: 14.0,
                            mColor: Colors.black),
                      ),
                      CommonWidgets.commonText(
                          mText: '\$24',
                          mFontWeight: FontWeight.w600,
                          mSize: 14.0,
                          mColor: Colors.black),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: CommonWidgets.commonText(
                            mText: 'Discount',
                            mFontWeight: FontWeight.w600,
                            mSize: 14.0,
                            mColor: Colors.black),
                      ),
                      CommonWidgets.commonText(
                          mText: '\$12',
                          mFontWeight: FontWeight.w600,
                          mSize: 14.0,
                          mColor: Colors.black),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: CommonWidgets.commonText(
                            mText: 'Delivery Fee',
                            mFontWeight: FontWeight.w600,
                            mSize: 14.0,
                            mColor: Colors.green),
                      ),
                      CommonWidgets.commonText(
                          mText: 'free',
                          mFontWeight: FontWeight.w600,
                          mSize: 14.0,
                          mColor: Colors.green),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: CommonWidgets.commonText(
                            mText: 'Grand Total',
                            mFontWeight: FontWeight.w700,
                            mSize: 15.0,
                            mColor: Colors.black),
                      ),
                      CommonWidgets.commonText(
                          mText: '\$12',
                          mFontWeight: FontWeight.w700,
                          mSize: 15.0,
                          mColor: Colors.black),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 70,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              color: ThemeManager.primaryColor,
              child: Row(
                children: [
                  SizedBox(width: 5),
                  /*Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonWidgets.commonText(
                            mText: 'Pay Using ^',
                            mFontWeight: FontWeight.w600,
                            mSize: 12.0,
                            mColor: Colors.black),
                        CommonWidgets.commonText(
                            mText: 'Visa 4544',
                            mFontWeight: FontWeight.w600,
                            mSize: 12.0,
                            mColor: Colors.black),
                      ],
                    ),
                  ),*/
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonWidgets.commonText(
                            mText: '100 Items',
                            mFontWeight: FontWeight.w700,
                            mSize: 14.0,
                            mColor: Colors.white),
                        CommonWidgets.commonText(
                            mText: '\$24.0',
                            mFontWeight: FontWeight.w700,
                            mSize: 14.0,
                            mColor: Colors.white),
                      ],
                    ),
                  ),
                  Bounce(
                    duration: Duration(milliseconds: 110),
                    onPressed: () {
                      paymentModeBottomSheet();
                    },
                    child: Container(
                      height: 35,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: CommonWidgets.commonText(
                            mText: 'Proceed to pay',
                            mFontWeight: FontWeight.w700,
                            mSize: 12.0,
                            mColor: Colors.red),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                ],
              ),
            )
          ],
        ));
  }

  Future paymentModeBottomSheet() {
    return showModalBottomSheet(
      isScrollControlled: false,
      useSafeArea: true,
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      isDismissible: true,
      builder: (context) => WillPopScope(
        onWillPop: () async => true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ThemeManager.primaryColor,
                ),
                width: 100,
                height: 5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 20, right: 20),
              child: Row(
                children: [
                  CommonWidgets.commonText(
                      mText: 'Payment Mode',
                      mFontWeight: FontWeight.w700,
                      mColor: ThemeManager.primaryColor,
                      mSize: 16.0),
                  const Spacer(),
                  Bounce(
                    duration: const Duration(milliseconds: 110),
                    onPressed: () {
                      paymentMode.value = '';

                    //  Navigator.pop(context);
                    },
                    child: CommonWidgets.commonText(
                        mText: 'Reset',
                        mFontWeight: FontWeight.w600,
                        mColor: ThemeManager.primaryColor,
                        mSize: 12.0),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Scrollbar(
              isAlwaysShown: true,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: payModeList.length,
                itemBuilder: (BuildContext, index) {
                  return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      child: SlideAnimation(
                          verticalOffset: 50.0,
                          child: FadeInAnimation(
                              child: paymentrowListView(index))));
                },
              ),
            ),
           Obx(
             ()=> paymentMode.value.isNotEmpty ?  Center(
                child: Container(
                  height: 35,
                  width: 120,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  margin: EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                      color: ThemeManager.primaryColor,
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: CommonWidgets.commonText(
                        mText: 'Proceed',
                        mFontWeight: FontWeight.w700,
                        mSize: 12.0,
                        mColor: Colors.white),
                  ),
                ),
              ):Container(),
           ),
          ],
        ),
      ),
    );
  }

  paymentrowListView(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Bounce(
              duration: Duration(milliseconds: 110),
              onPressed: () {
                paymentMode.value = payModeList[index];
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.withOpacity(0.2))),
                child: Row(
                  children: [
                    paymentMode.value == payModeList[index]
                        ? Icon(Icons.radio_button_checked,
                            color: ThemeManager.primaryColor)
                        : Icon(Icons.circle_outlined,
                            color: ThemeManager.primaryColor),
                    const SizedBox(width: 15),
                    CommonWidgets.commonText(
                        mText: payModeList[index],
                        mFontWeight: FontWeight.w500,
                        mColor: Colors.black,
                        mSize: 14.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
