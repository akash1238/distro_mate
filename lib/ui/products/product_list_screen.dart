import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:distro_mate/ui/cart/cart_screen.dart';
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

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
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
              mText: 'Products',
              mFontWeight: FontWeight.w700,
              mColor: Colors.black),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.search,color: Colors.black,),
            )
          ],
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 70.0),
              child: SizedBox(
                height: size.height,
                child: GridView.builder(
                  itemCount: 20,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: const EdgeInsets.all(10.0),
                      margin: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.grey)),
                      child: Column(
                        children: [
                          SizedBox(height: 8),
                          Image.asset(
                            'assets/images/products.png',
                            height: 95,
                          ),
                          SizedBox(height: 8),
                          CommonWidgets.commonText(
                              mText: 'Tide ultra OXI powder laundry detergent',
                              mFontWeight: FontWeight.w400,
                              mSize: 12.0,
                              mColor: Colors.black),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CommonWidgets.commonText(
                                  mText: '\$12.0',
                                  mFontWeight: FontWeight.w700,
                                  mSize: 14.0,
                                  mColor: Colors.black),
                              Bounce(
                                duration: Duration(milliseconds: 110),
                                onPressed: () {
                                  showModalBottomSheet(
                                      backgroundColor: Colors.transparent,
                                      isScrollControlled: true,
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          padding: EdgeInsets.only(
                                              bottom: MediaQuery.of(context).viewInsets.bottom),
                                          decoration: BoxDecoration(
                                              color: ThemeManager.primaryText,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(15),
                                                  topRight: Radius.circular(15))),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 18.0,
                                                        vertical: 20),
                                                child: CommonWidgets.commonText(
                                                    mText: 'Add Quantity',
                                                    mFontWeight: FontWeight.w700,
                                                    mSize: 14.0,
                                                    mColor: Colors.black),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5, left: 15),
                                                child: CommonWidgets.commonText(
                                                    mText: 'Quantity',
                                                    mSize: 14.0,
                                                    mFontWeight: FontWeight.w600),
                                              ),
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    top: 5, left: 10, right: 10),
                                                child: TextFormField(
                                                  keyboardType:
                                                      TextInputType.number,
                                                  // validator: (input) => validateEmail(input!, context).toString() == "" ? null : validateEmail(input, context),

                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1,
                                                  decoration: InputDecorE()
                                                      .editBoxBorderGreyOnly(
                                                          context, '', false),
                                                ),
                                              ),
                                              SizedBox(height: 30),
                                              Align(
                                                child: Container(
                                                  height: 35,
                                                  width: 100,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 15),
                                                  decoration: BoxDecoration(
                                                      color: ThemeManager
                                                          .primaryColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: Center(
                                                    child:
                                                        CommonWidgets.commonText(
                                                            mText: 'ADD',
                                                            mFontWeight:
                                                                FontWeight.w700,
                                                            mSize: 12.0,
                                                            mColor: Colors.white),
                                                  ),
                                                  margin:
                                                      EdgeInsets.only(right: 15),
                                                ),
                                                alignment: Alignment.topRight,
                                              ),
                                              SizedBox(height: 30),
                                            ],
                                          ),
                                        );
                                      });
                                },
                                child: Container(
                                  height: 30,
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  decoration: BoxDecoration(
                                      color: ThemeManager.primaryColor,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                    child: CommonWidgets.commonText(
                                        mText: 'ADD',
                                        mFontWeight: FontWeight.w700,
                                        mSize: 12.0,
                                        mColor: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              height: 70,
              margin: EdgeInsets.all(20),
              color: ThemeManager.primaryColor,
              child: Row(
                children: [
                  SizedBox(width: 15),
                  Container(
                    child: Image.asset(
                      'assets/images/products.png',
                      height: 40,
                    ),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  SizedBox(width: 20),
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
                            mText: '\$1200.0',
                            mFontWeight: FontWeight.w700,
                            mSize: 14.0,
                            mColor: Colors.white),
                      ],
                    ),
                  ),
                  Bounce(
                    duration: Duration(milliseconds: 110),
                    onPressed: () {

                      Navigator.push(
                          context,
                          PageTransition(
                              child: CartScreen(),
                              type: PageTransitionType.fade,
                              duration: const Duration(milliseconds: 900),
                              reverseDuration: (const Duration(milliseconds: 900))));
                    },
                    child: Container(
                      height: 30,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: CommonWidgets.commonText(
                            mText: 'View Cart',
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
}
