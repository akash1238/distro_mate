import 'dart:async';

import 'package:distro_mate/utils/helper/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

import 'common_methods.dart';

class DropdownMenuItemSeparator<T> extends DropdownMenuItem<T> {
  final String name;

  DropdownMenuItemSeparator({required this.name, Key? key})
      : super(
          key: key,
          child: Text(
            name,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ), // Trick the assertion.
        );
}

class CommonWidgets {
  static bool isFirst = false;
  static bool isSync = true;

  static Widget redAstric() {
    return commonText(mText: '*', mColor: Colors.red);
  }

  static Future<void> showLogountDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          buttonPadding: EdgeInsets.all(0),
          title: const Center(
            child: Text('LOGOUT',
                textScaleFactor: 1.0,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.black)),
          ),
          content: const Text(
              'Are you sure you want to log out from \nGREENLAM GUESS?',
              textScaleFactor: 1.0,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.black)),
          contentTextStyle: TextStyle(color: Colors.black),
          actions: <Widget>[
            Container(
              child: Column(
                children: [
                  const Divider(height: 3, color: Colors.black),
                  IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                            child: const Text('Cancel',
                                textScaleFactor: 1.0,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black)),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                        const VerticalDivider(width: 3, color: Colors.black),
                        TextButton(
                          child: const Text('Logout',
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black)),
                          onPressed: () async {
                            /*     String username =
                                await CommonMethods.getStringPref(prefUserName);
                            CommonMethods.clearSharedPReference();
                            CommonMethods.setStringPref(prefUserName, username);
                            CommonMethods.setBoolPref(prefIsLogin, false);
                            Navigator.of(context)
                                .popUntil((route) => route.isFirst);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));*/
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  static Widget logoutView(BuildContext context, VoidCallback mCallback) {
    return Wrap(
      children: [
        commonText(mText: 'Logout', mSize: 18.0, mFontWeight: FontWeight.w600),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: commonText(
            mText: 'Do you want to logout from the App?',
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: mCallback,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: commonText(
                  mText: 'OK',
                ),
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: commonText(
                  mText: 'Cancel',
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  static Widget roundCornerView(
      {top = 0.0,
      bottom = 0.0,
      mChild,
      mHeight = 50.0,
      mWidth = double.infinity,
      mColor = Colors.white,
      mPadding = const EdgeInsets.all(0.0),
      mCallback}) {
    return InkWell(
      onTap: mCallback,
      child: Padding(
        padding: mPadding,
        child: Container(
          height: mHeight,
          width: mWidth,
          decoration: BoxDecoration(
            color: mColor,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(top),
                bottomRight: Radius.circular(bottom),
                topLeft: Radius.circular(top),
                bottomLeft: Radius.circular(bottom)),
          ),
          child: mChild,
        ),
      ),
    );
  }

  static Widget outlineTextView(
      {mText = '',
      mTextColor = Colors.white,
      mBackColor = Colors.white,
      mOutlineColor = Colors.white}) {
    return Container(
      decoration: BoxDecoration(
          color: mBackColor,
          border: Border.all(
            color: mOutlineColor,
          ),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 5.0),
        child: CommonWidgets.commonText(
            mText: mText,
            mColor: mTextColor,
            mSize: 10.0,
            mFontWeight: FontWeight.w500),
      ),
    );
  }

  static Widget roundCornerViewDynamic(
      {topCorner = 0.0,
      bottomCorner = 0.0,
      mChild,
      mWidth = double.infinity,
      mColor = Colors.white,
      mPadding = const EdgeInsets.all(0.0),
      mCallback}) {
    return InkWell(
      onTap: mCallback,
      child: Padding(
        padding: mPadding,
        child: Container(
          width: mWidth,
          decoration: BoxDecoration(
            color: mColor,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(topCorner),
                bottomRight: Radius.circular(bottomCorner),
                topLeft: Radius.circular(topCorner),
                bottomLeft: Radius.circular(bottomCorner)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: mChild,
          ),
        ),
      ),
    );
  }

  static Widget commonTextFieldsUpdate(
      String title, String hint, TextEditingController mCtrl, int maxLines,
      {isEnable = true,
      isClickable = true,
      isTopText = true,
      mCallback,
      mKeyboardType = TextInputType.text,
      mMaxLength = 500,
      mTitleColor = Colors.black,
      mValueColor = Colors.black,
      vRedAstric = false,
      mDividerColor = Colors.black,
      mInputFormatters = '[[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}'}) {
    return InkWell(
      onTap: isClickable ? mCallback : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isTopText
              ? Column(
                  children: [
                    Row(
                      children: [
                        CommonWidgets.commonText(
                            mText: title,
                            mColor: isEnable ? mTitleColor : Colors.grey),
                        vRedAstric ? redAstric() : Container()
                      ],
                    ),
                  ],
                )
              : Container(),
          SizedBox(
            height: 30.0,
            child: TextField(
                controller: mCtrl,
                enabled: !isClickable,
                maxLines: maxLines,
                maxLength: mMaxLength,
                keyboardType: mKeyboardType,
                /*  inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(mInputFormatters)),
              ],*/
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  counterText: "",
                  border: InputBorder.none,
                  hintText: hint,
                ),
                style: TextStyle(
                  color: isEnable ? mValueColor : Colors.grey,
                )),
          ),
          Divider(
            color: isEnable ? mDividerColor : Colors.grey,
          )
        ],
      ),
    );
  }

  static Widget commonTextFields(
      String title, String hint, TextEditingController mCtrl, int maxLines,
      {isEnable = true,
      isTopText = true,
      mCallback,
      mKeyboardType = TextInputType.text,
      mMaxLength = 500,
      mTitleColor = Colors.black,
      mValueColor = Colors.black,
      vRedAstric = false,
      mDividerColor = Colors.black,
      mInputFormatters = '[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}'}) {
    return InkWell(
      onTap: isEnable ? () {} : mCallback,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isTopText
              ? Column(
                  children: [
                    Row(
                      children: [
                        CommonWidgets.commonText(
                            mText: title,
                            mSize: 12.0,
                            mColor: isEnable ? mTitleColor : Colors.grey),
                        vRedAstric ? redAstric() : Container()
                      ],
                    ),
                  ],
                )
              : Container(),
          Container(
            height: 40.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.grey)
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                controller: mCtrl,
                enabled: isEnable,
                maxLines: maxLines,
                maxLength: mMaxLength,
                keyboardType: mKeyboardType,
                textInputAction: TextInputAction.done,
                /* inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(mInputFormatters)),
                ],*/
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  counterText: "",
                  border: InputBorder.none,
                  hintText: hint,
                ),
                style: TextStyle(color: isEnable ? mValueColor : Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget commonNumberFields(
      String title, String hint, TextEditingController mCtrl, int maxLines,
      {isEnable = true,
      isTopText = true,
      mCallback,
      mKeyboardType = TextInputType.text,
      mMaxLength = 500,
      mTitleColor = Colors.black,
      mValueColor = Colors.black,
      vRedAstric = false,
      mDividerColor = Colors.black,
      mInputFormatters = '[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}'}) {
    return InkWell(
      onTap: isEnable ? () {} : mCallback,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isTopText
              ? Column(
                  children: [
                    Row(
                      children: [
                        CommonWidgets.commonText(
                            mText: title,
                            mColor: isEnable ? mTitleColor : Colors.grey),
                        vRedAstric ? redAstric() : Container()
                      ],
                    ),
                  ],
                )
              : Container(),
          SizedBox(
            height: 30.0,
            child: TextField(
                controller: mCtrl,
                enabled: isEnable,
                maxLines: maxLines,
                maxLength: mMaxLength,
                keyboardType: mKeyboardType,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  counterText: "",
                  border: InputBorder.none,
                  hintText: hint,
                ),
                style: TextStyle(color: isEnable ? mValueColor : Colors.grey)),
          ),
          Divider(
            color: isEnable ? mDividerColor : Colors.grey,
          )
        ],
      ),
    );
  }

  static Widget commonTextFields2(
      String title, String hint, TextEditingController mCtrl, int maxLines,
      {isEnable = true,
      isTopText = true,
      mCallback,
      mKeyboardType = TextInputType.text,
      mMaxLength = 500,
      mTitleColor = Colors.black,
      mValueColor = Colors.black,
      vRedAstric = false,
      mDividerColor = Colors.black,
      mInputFormatters = '[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}',
      mChange}) {
    return InkWell(
      onTap: isEnable ? () {} : mCallback,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isTopText
              ? Column(
                  children: [
                    Row(
                      children: [
                        CommonWidgets.commonText(
                            mText: title, mColor: mTitleColor),
                        vRedAstric ? redAstric() : Container()
                      ],
                    ),
                  ],
                )
              : Container(),
          SizedBox(
            child: TextField(
              controller: mCtrl,
              enabled: isEnable,
              maxLines: maxLines,
              maxLength: mMaxLength,
              onChanged: mChange,
              textCapitalization: TextCapitalization.sentences,
              /*   inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(mInputFormatters)),
              ],*/
              keyboardType: mKeyboardType,
              decoration: InputDecoration(
                counterText: "",
                border: InputBorder.none,
                hintText: hint,
              ),
              style: GoogleFonts.poppins(color: mValueColor),
            ),
          ),
          const Divider(
            color: Colors.black,
            height: 2,
          )
        ],
      ),
    );
  }

  static Widget commonTextFields3(
      String title, String hint, TextEditingController mCtrl, int maxLines,
      {isEnable = true,
      isTopText = true,
      mCallback,
      mKeyboardType = TextInputType.text,
      mMaxLength = 500,
      mTitleColor = Colors.black,
      mValueColor = Colors.black,
      vRedAstric = false,
      mDividerColor = Colors.black,
      mInputFormatters = '[0-9]',
      mChange}) {
    return InkWell(
      onTap: isEnable ? () {} : mCallback,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isTopText
              ? Column(
                  children: [
                    Row(
                      children: [
                        CommonWidgets.commonText(
                            mText: title, mColor: mTitleColor),
                        vRedAstric ? redAstric() : Container()
                      ],
                    ),
                  ],
                )
              : Container(),
          SizedBox(
            child: TextField(
              controller: mCtrl,
              enabled: isEnable,
              maxLines: maxLines,
              maxLength: mMaxLength,
              onChanged: mChange,
              textCapitalization: TextCapitalization.sentences,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(mInputFormatters)),
              ],
              keyboardType: mKeyboardType,
              decoration: InputDecoration(
                  counterText: "",
                  border: InputBorder.none,
                  hintText: hint,
                  hintStyle: GoogleFonts.poppins(fontSize: 14.0)),
              style: GoogleFonts.poppins(color: mValueColor),
            ),
          ),
          const Divider(
            color: Colors.black,
            height: 2,
          )
        ],
      ),
    );
  }

  static buttonClickLoading(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const Center(
              child: SizedBox(
            height: 60,
            child: LoadingIndicator(
                indicatorType: Indicator.ballRotateChase,
                colors: [Colors.white],

                /// Optional, The color collections
                strokeWidth: 2,

                /// Optional, The stroke of the line, only applicable to widget which contains line
                backgroundColor: Colors.transparent,

                /// Optional, Background of the widget
                pathBackgroundColor: Colors.white

                /// Optional, the stroke backgroundColor
                ),
          ));
        });
  }

  static Widget noInternetView(BuildContext context) {
    return SizedBox(
      height: CommonMethods.deviceHeight(context) * 0.8,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.signal_wifi_connected_no_internet_4,
              color: Colors.white,
            ),
            const SizedBox(
              width: 10,
            ),
            CommonWidgets.commonText(
                mText: 'Connection Error',
                mColor: Colors.white,
                mSize: 16.0,
                mFontWeight: FontWeight.w500),
          ],
        ),
      ),
    );
  }

  static Widget roundButton({
    mColor,
    mIcon,
    mIconColor = Colors.white,
    mCallback,
  }) {
    return InkWell(
      onTap: mCallback,
      child: Container(
          height: 40.0,
          width: 40.0,
          decoration: BoxDecoration(
              color: mColor, borderRadius: BorderRadius.circular(50.0)),
          child: Center(
            child: Icon(
              mIcon,
              color: mIconColor,
            ),
          )),
    );
  }

  static Widget commonButton({
    mText,
    mCallback,
    mBackgroundColor = Colors.white
  }) {
    return GestureDetector(
      onTap: mCallback,
      child: Container(
        height: 40.0,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        decoration: BoxDecoration(
            color: mBackgroundColor, borderRadius: BorderRadius.circular(8.0)),
        child: Center(
            child: commonText(
                mText: mText, mSize: 18.0, mFontWeight: FontWeight.w600)),
      ),
    );
  }

  static Widget commonStrokeButton({
    mText,
    mCallback,
  }) {
    return InkWell(
      onTap: mCallback,
      child: Container(
        height: 40.0,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            color: Colors.black,
            borderRadius: BorderRadius.circular(8.0)),
        child: Center(
            child: commonText(
                mText: mText, mSize: 18.0, mFontWeight: FontWeight.w600,mColor: Colors.white)),
      ),
    );
  }

  static Widget roundSVGButton({
    mColor,
    mIcon,
    mIconColor = Colors.white,
    mCallback,
  }) {
    return InkWell(
      onTap: mCallback,
      child: Container(
          height: 40.0,
          width: 40.0,
          decoration: BoxDecoration(
              color: mColor, borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: SvgPicture.asset(
              mIcon,
              height: 20.0,
              width: 20.0,
              allowDrawingOutsideViewBox: true,
            ),
          )),
    );
  }

  static Widget roundContainer({mColor, mChild, mPadding}) {
    return Container(
        decoration: BoxDecoration(
            color: mColor, borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: mPadding,
          child: Center(
            child: mChild,
          ),
        ));
  }

  static Widget outlineContainer(
      {mOutlineColor, mChild, mBackgroundColor, mRoundCorner, mWidth}) {
    return Container(
        width: mWidth,
        decoration: BoxDecoration(
            color: mBackgroundColor,
            border: Border.all(
              color: mOutlineColor,
            ),
            borderRadius: BorderRadius.all(Radius.circular(mRoundCorner))),
        child: mChild);
  }

  static Widget outlineContainer2(
      {mOutlineColor, mChild, mBackgroundColor, mRoundCorner}) {
    return Container(
      decoration: BoxDecoration(
          color: mBackgroundColor,
          border: Border.all(
            color: mOutlineColor,
          ),
          borderRadius: BorderRadius.all(Radius.circular(mRoundCorner))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 5.0),
        child: mChild,
      ),
    );
  }

  static Widget buildLoading() => const Center(
          child: SizedBox(
        height: 60,
        child: LoadingIndicator(
            indicatorType: Indicator.ballRotateChase,
            colors: [Colors.black],
            strokeWidth: 2,

            /// Optional, The stroke of the line, only applicable to widget which contains line
            backgroundColor: Colors.transparent,

            /// Optional, Background of the widget
            pathBackgroundColor: Colors.black

            /// Optional, the stroke backgroundColor
            ),
      )) /*Center(
          child: CircularProgressIndicator(
        backgroundColor: Colors.white,
      ))*/
      ;

  static Widget commonText(
      {mText = 'text',
      mColor = Colors.black,
      mSize = 15.0,
      isUnderline = false,
      mFontWeight = FontWeight.normal,
      mOverflow = TextOverflow.visible,
      mTextAlign = TextAlign.start,
      mLetterSpacing = 0.0,
      mMaxLine = 2}) {
    return Text(
      mText,
      textAlign: mTextAlign,
      overflow: mOverflow,
      maxLines: mMaxLine,
      style: GoogleFonts.poppins(
        color: mColor,
        fontSize: mSize,
        letterSpacing: mLetterSpacing,
        decoration:
            isUnderline ? TextDecoration.underline : TextDecoration.none,
        fontWeight: mFontWeight,
      ),
    );
  }

  static Widget commonMontserratText(
      {mText = 'text',
      mColor = Colors.black,
      mSize = 15.0,
      isUnderline = false,
      mFontWeight = FontWeight.normal,
      mOverflow = TextOverflow.visible,
      mTextAlign = TextAlign.start}) {
    return Text(
      mText,
      textAlign: mTextAlign,
      overflow: mOverflow,
      style: GoogleFonts.montserrat(
        color: mColor,
        fontSize: mSize,
        decoration:
            isUnderline ? TextDecoration.underline : TextDecoration.none,
        fontWeight: mFontWeight,
      ),
    );
  }

  static Future openAlertBox(BuildContext context, Widget mChild,
      double mHeight, double mWidth) async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            insetPadding: EdgeInsets.zero,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            content: Container(
              height: mHeight,
              width: mWidth,
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: mChild,
              ),
            ),
          );
        });
  }

  static Future<dynamic> openAlertBox1(
      BuildContext context, Widget mChild, double mWidth,
      {bool isDismiss = true}) async {
    return await showDialog(
        barrierDismissible: isDismiss,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            insetPadding: EdgeInsets.zero,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            content: Container(
              width: mWidth,
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: mChild,
              ),
            ),
          );
        });
  }

  static Widget selectorView(BuildContext context, VoidCallback mCallback,
      VoidCallback mCallback2, VoidCallback mCallback3) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Select Image From",
              style: GoogleFonts.poppins(fontSize: 20.0),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.cancel,
                color: Colors.black,
                size: 30.0,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30.0,
        ),
        CommonWidgets.selectOptionTile(
            'Camera', Icons.radio_button_off, mCallback),
        const SizedBox(
          height: 15.0,
        ),
        CommonWidgets.selectOptionTile(
            'Gallery', Icons.radio_button_off, mCallback2),
        const SizedBox(
          height: 15.0,
        ),
        CommonWidgets.selectOptionTile(
            'Document', Icons.radio_button_off, mCallback3)
      ],
    );
  }

  static Widget selectOptionTile(String title, IconData iconData, mCallback) {
    return InkWell(
      onTap: mCallback,
      child: outlineContainer(
          mOutlineColor: Colors.black,
          mRoundCorner: 10.0,
          mChild: Center(
            child: Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonWidgets.commonText(mText: title, mSize: 18.0),
                  Icon(
                    iconData,
                    color: Colors.black,
                  )
                ],
              ),
            ),
          )),
    );
  }


  static Future<dynamic> openAlertBox2(
      BuildContext context, Widget mChild, double mWidth,
      {bool isDismiss = true}) async {
    return await showDialog(
        barrierDismissible: isDismiss,
        context: context,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              insetPadding: EdgeInsets.zero,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              content: Container(
                width: mWidth,
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: mChild,
                ),
              ),
            ),
          );
        });
  }

  static Future<dynamic> openAlertBoxSync(
      BuildContext context, Widget mChild, double mWidth) async {
    return await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              insetPadding: EdgeInsets.zero,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              content: Container(
                width: mWidth,
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: mChild,
                ),
              ),
            ),
          );
        });
  }

  openAlertBoxForVal(BuildContext context, Widget mChild, double mWidth) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            insetPadding: EdgeInsets.zero,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            content: Container(
              width: mWidth,
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: mChild,
              ),
            ),
          );
        });
  }

  static Future<void> openMap(double latitude, double longitude) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }

/*
  static Widget getGoogleMap(BuildContext context, initLatLng,
      List<Marker> markers, dynamic uiHeight, dynamic uiWidth) {
    Completer<GoogleMapController> _controller = Completer();
    return Container(
      height: uiHeight,
      width: uiWidth,
      child: GoogleMap(
        myLocationEnabled: true,
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: initLatLng,
          zoom: 4.2,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: Set<Marker>.of(markers),
      ),
    );
  }
*/

/*
  static Widget getAppGoogleMap(
      BuildContext context,
      initLatLng,
      List<Marker> markers,
      dynamic uiHeight,
      dynamic uiWidth,
      Completer<GoogleMapController> _controller) {
    return Container(
      height: uiHeight,
      width: uiWidth,
      child: GoogleMap(
        mapToolbarEnabled: true,
        buildingsEnabled: true,
        myLocationEnabled: true,
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: initLatLng,
          zoom: 4.2,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: Set<Marker>.of(markers),
        onTap: (latlang) {
          debugPrint('test');
          // _onAddMarkerButtonPressed(latlang);
        },
      ),
    );
  }
*/

  static Widget iconByStatus(String status) {
    Widget mIcon = Container();
    switch (status.toLowerCase()) {
      case 'pending':
        mIcon = ClipOval(
          child: Material(
            color: Colors.yellow, // Button color
            child: InkWell(
              splashColor: Colors.white, // Splash color
              onTap: () {},
              child: const SizedBox(
                  width: 20,
                  height: 20,
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Divider(
                      color: Colors.white,
                      thickness: 3,
                    ),
                  )),
            ),
          ),
        );
        break;
      case 'cancel':
        mIcon = const Icon(
          Icons.cancel,
          color: Colors.red,
          size: 35.0,
        );
        break;
      case 'done':
        mIcon = ClipOval(
          child: Material(
            color: ThemeManager.elevationColor, // Button color
            child: InkWell(
              splashColor: Colors.white, // Splash color
              onTap: () {},
              child: const SizedBox(
                  width: 30,
                  height: 30,
                  child: Icon(
                    Icons.done_rounded,
                    color: Colors.white,
                  )),
            ),
          ),
        );
        break;
    }
    return mIcon;
  }

  static Widget successDialog(BuildContext context, String title,
      String message, VoidCallback mCallback2) {
    double corner = 10.0;
    return Wrap(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CommonWidgets.commonText(
                  mText: message,
                  mSize: 13.0,
                  mColor: Colors.black,
                  mMaxLine: 5),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Center(
            child: CommonWidgets.roundCornerViewDynamic(
                topCorner: corner,
                bottomCorner: corner,
                mColor: Colors.red,
                mWidth: CommonMethods.deviceWidth(context) * 0.2,
                mCallback: mCallback2,
                mChild: Center(
                  child: CommonWidgets.commonText(
                      mText: 'OK', mColor: Colors.white),
                )),
          ),
        )
      ],
    );
  }

  static Widget clearDataDialog(BuildContext context, String title,
      String message, VoidCallback mCallback2) {
    double corner = 10.0;
    return Wrap(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CommonWidgets.commonText(
                  mText: title,
                  mSize: 17.0,
                  mFontWeight: FontWeight.bold,
                  mColor: Colors.black,
                  mMaxLine: 3),
            ),
            Center(
              child: CommonWidgets.commonText(
                  mText: message,
                  mSize: 13.0,
                  mColor: Colors.black,
                  mMaxLine: 5),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Center(
            child: CommonWidgets.roundCornerViewDynamic(
                topCorner: corner,
                bottomCorner: corner,
                mColor: Colors.red,
                mWidth: CommonMethods.deviceWidth(context) * 0.2,
                mCallback: mCallback2,
                mChild: Center(
                  child: CommonWidgets.commonText(
                      mText: 'Logout', mColor: Colors.white),
                )),
          ),
        )
      ],
    );
  }

  static Widget confirmationDialog(BuildContext context, String title,
      String message, VoidCallback mCallback2) {
    double corner = 10.0;
    return Wrap(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CommonWidgets.commonText(
                  mText: message,
                  mSize: 13.0,
                  mColor: Colors.black,
                  mMaxLine: 5),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Row(
            children: [
              CommonWidgets.roundCornerViewDynamic(
                  topCorner: corner,
                  bottomCorner: corner,
                  mColor: Colors.red,
                  mWidth: CommonMethods.deviceWidth(context) * 0.2,
                  mCallback: mCallback2,
                  mChild: Center(
                    child: CommonWidgets.commonText(
                        mText: 'OK', mColor: Colors.white),
                  )),
              CommonWidgets.roundCornerViewDynamic(
                  topCorner: corner,
                  bottomCorner: corner,
                  mColor: Colors.red,
                  mWidth: CommonMethods.deviceWidth(context) * 0.2,
                  mCallback: mCallback2,
                  mChild: Center(
                    child: CommonWidgets.commonText(
                        mText: 'Cancel', mColor: Colors.white),
                  )),
            ],
          ),
        )
      ],
    );
  }

  static Widget locationAlertDialog(BuildContext context, String title,
      String message, VoidCallback mCallback2) {
    double corner = 10.0;
    return Wrap(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/gif/alert.gif',
                  height: 20,
                  width: 20,
                ),
                SizedBox(width: 10),
                CommonWidgets.commonText(
                    mText: title,
                    mSize: 13.0,
                    mColor: Colors.black,
                    mMaxLine: 1,
                    mFontWeight: FontWeight.bold),
              ],
            ),
            SizedBox(height: 5),
            Center(
              child: CommonWidgets.commonText(
                  mText: message,
                  mSize: 13.0,
                  mColor: Colors.black,
                  mMaxLine: 3),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Center(
            child: CommonWidgets.roundCornerViewDynamic(
                topCorner: corner,
                bottomCorner: corner,
                mColor: Colors.red,
                mWidth: CommonMethods.deviceWidth(context) * 0.35,
                mCallback: mCallback2,
                mChild: Center(
                  child: CommonWidgets.commonText(
                      mText: 'Open Setting',
                      mColor: Colors.white,
                      mFontWeight: FontWeight.bold,
                      mSize: 12.0),
                )),
          ),
        )
      ],
    );
  }

  static Widget commonHeader(BuildContext context, String header,
      {mColor = Colors.white}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        height: CommonMethods.deviceHeight(context) * 0.08,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 40.0,
                width: 40.0,
                child: Center(
                  child: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: mColor,
                  ),
                ),
              ),
            ),
            commonText(
                mText: header,
                mColor: mColor,
                mSize: 18.0,
                mFontWeight: FontWeight.w600),
            Container(
              height: 40,
              width: 40,
            )
          ],
        ),
      ),
    );
  }

  final ValueChanged<dynamic> update;

  CommonWidgets({required this.update});

  Widget commonStrDropdown(BuildContext context, String title,
      List masterDataListActivity, dynamic selectedActivity,
      {isEnable = true, vRedAstric = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CommonWidgets.commonText(
                mText: title, mColor: isEnable ? Colors.black : Colors.grey),
            vRedAstric ? redAstric() : Container()
          ],
        ),
        Container(
          width: CommonMethods.deviceWidth(context) * 0.9,
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              hint: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: CommonWidgets.commonText(mText: title),
              ),
              value: selectedActivity,
              icon: const Icon(Icons.keyboard_arrow_down_outlined),
              onChanged: isEnable
                  ? (newValue) {
                      update(newValue);
                    }
                  : null,
              items:
                  masterDataListActivity.map<DropdownMenuItem<String>>((value) {
                return DropdownMenuItem(
                  value: value,
                  child: CommonWidgets.commonText(
                      mText: value,
                      mColor: isEnable ? Colors.black : Colors.grey),
                );
              }).toList(),
            ),
          ),
        ),
        Divider(
          color: isEnable ? Colors.black : Colors.grey,
        )
      ],
    );
  }

  static Widget noItemFoundForSearch(BuildContext context,
      {customMessage = 'No Record Found!!', okCallback}) {
    return Container(
      height: CommonMethods.deviceHeight(context) * 0.08,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CommonWidgets.commonText(
                mText: customMessage,
                mSize: 18.0,
                mColor: Colors.white
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }

  static Widget noItemFoundForSearchLead(BuildContext context,
      {customMessage = 'No Records Found!!', okCallback}) {
    return Container(
      height: CommonMethods.deviceHeight(context) * 0.03,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CommonWidgets.commonText(
                mText: customMessage,
                mColor: Colors.red,
                mSize: 18.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget cardWithIcon(IconData mIcon, VoidCallback mCallback) {
    return Card(
      elevation: 2,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: CommonWidgets.roundButton(
          mColor: Colors.white,
          mIcon: mIcon,
          mIconColor: Colors.black,
          mCallback: mCallback),
    );
  }

  static Widget twoButtonDialog(BuildContext context, VoidCallback mCallback,
      {title = 'Logout', message = 'message', messageLines = 4}) {
    return IntrinsicHeight(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          commonText(mText: title, mSize: 18.0, mFontWeight: FontWeight.w600),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: commonText(mText: message, mMaxLine: messageLines),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: mCallback,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: commonText(
                    mText: 'OK',
                  ),
                ),
              ),
              const SizedBox(
                width: 20.0,
              ),
              InkWell(
                onTap: () => Navigator.pop(context, true),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: commonText(
                    mText: 'Cancel',
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  static Widget followConfirmationDialog(
      BuildContext context, VoidCallback mCallback, type,
      {title = 'Logout', message = 'message'}) {
    return Wrap(
      children: [
        commonText(mText: title, mSize: 18.0, mFontWeight: FontWeight.w600),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: commonText(
            mText: message,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: mCallback,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: commonText(
                  mText: 'Yes',
                ),
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            InkWell(
              onTap: () {
                if (type == 'tag') {
                  Navigator.pop(context, true);
                  Navigator.pop(context, true);
                  Navigator.pop(context, true);
                  Navigator.pop(context, true);
                } else {
                  Navigator.pop(context, true);
                  Navigator.pop(context, true);
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: commonText(
                  mText: 'No',
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  static Widget commonTextSpan(
      {mText = 'text',
      mText1 = 'text1',
      mColor = Colors.black,
      mSize = 16.0,
      isUnderline = false,
      mFontWeight = FontWeight.normal,
      isOverflow = false}) {
    return RichText(
      text: TextSpan(
          text: mText,
          style: TextStyle(color: Colors.black, fontSize: mSize),
          children: <TextSpan>[
            TextSpan(
              text: mText1,
              style: TextStyle(color: Colors.red, fontSize: 18),
            )
          ]),
    );
  }

  // const Divider(color: Colors.black,)
  static Widget withoutSyncUI1(BuildContext context) {
    return Container(
      height: CommonMethods.deviceHeight(context) * 0.8,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonWidgets.commonText(
                mText: 'Sync the data to show all Customers',
                mColor: Colors.white,
                mFontWeight: FontWeight.w600),
            const SizedBox(
              height: 5.0,
            ),
            CommonWidgets.commonText(
                mText: 'Make sure you are connected to the internet',
                mColor: Colors.white,
                mSize: 12.0,
                mFontWeight: FontWeight.w600),
          ],
        ),
      ),
    );
  }

  static Widget withoutSyncUI(BuildContext context) {
    return Center(
      child: CommonWidgets.commonText(
        mText: 'No Records Found!!',
        mSize: 12.0,
      ),
    ); /*Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CommonWidgets.commonText(
          mText: 'No Records Found!!',
          mSize: 12.0,
        ),
        const SizedBox(
          height: 5.0,
        ),
        CommonWidgets.commonText(
          mText: 'Make sure you are connected to the internet',
          mSize: 12.0,
        ),
      ],
    );*/
  }

  static Widget commonGraphText(
      {mText = 'text',
      mText1 = 'text2',
      mColor = Colors.black,
      mSize = 15.0,
      isUnderline = false,
      mFontWeight = FontWeight.w800,
      mfontWeightSmall = FontWeight.w500,
      mFontSizeSmall = 13.0,
      mOverflow = TextOverflow.visible,
      mTextAlign = TextAlign.start,
      mLetterSpacing = 0.0,
      mMaxLine = 2}) {
    return Text.rich(TextSpan(children: [
      TextSpan(
        text: mText,
        style: GoogleFonts.poppins(
          color: mColor,
          fontSize: mSize,
          letterSpacing: mLetterSpacing,
          decoration:
              isUnderline ? TextDecoration.underline : TextDecoration.none,
          fontWeight: mFontWeight,
        ),
      ),
      TextSpan(
        text: mText1,
        style: GoogleFonts.poppins(
          color: mColor,
          fontSize: mFontSizeSmall,
          letterSpacing: mLetterSpacing,
          decoration:
              isUnderline ? TextDecoration.underline : TextDecoration.none,
          fontWeight: mfontWeightSmall,
        ),
      )
    ]));
  }
}
