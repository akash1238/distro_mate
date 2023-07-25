import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:page_transition/page_transition.dart';

import '../login/login_screen.dart';
import '../utils/helper/common_widgets.dart';
import '../utils/helper/theme_manager.dart';

class Introscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent),
    );
    return OnBoardingPage();
  }
}

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();
  late double screenHeight;
  late double screenWidth;

  void _onIntroEnd(context) {}

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    var pageDecoration = PageDecoration(
      titleTextStyle:
          const TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      pageColor: ThemeManager.primaryColor,
      imagePadding: EdgeInsets.zero,
    );

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: IntroductionScreen(
        key: introKey,
        pages: [
          PageViewModel(
            title: '',
            body: '',
            image: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Image.asset(
                    "assets/images/intro_one.png",
                    height: MediaQuery.of(context).size.height * 0.6,
                  ),
                ),
                const SizedBox(height: 20),
                CommonWidgets.commonText(
                    mText:
                        'EXPLORE MANY PRODUCTS\n\nfinancial benefits to you\nat a single click.',
                    mColor: Colors.white,
                    mSize: 18.0,
                    mFontWeight: FontWeight.w700,
                    mMaxLine: 4,
                    mTextAlign: TextAlign.center),
                SizedBox(height: MediaQuery.of(context).size.height * 0.15)
              ],
            ),
            decoration: pageDecoration.copyWith(
                contentMargin: const EdgeInsets.symmetric(horizontal: 16),
                fullScreen: true,
                imageFlex: 1,
                pageColor: ThemeManager.primaryColor),
          ),
          PageViewModel(
            title: '',
            body: '',
            image: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Image.asset(
                    "assets/images/intro_two.png",
                    height: MediaQuery.of(context).size.height * 0.6,
                  ),
                ),
                const SizedBox(height: 20),

                CommonWidgets.commonText(
                    mText: 'CHOOSE AND CHECKOUT\n\nCustomize edit result.',
                    mColor: Colors.white,
                    mSize: 18.0,
                    mFontWeight: FontWeight.w700,
                    mMaxLine: 3,
                    mTextAlign: TextAlign.center),
                SizedBox(height: MediaQuery.of(context).size.height * 0.15)
              ],
            ),
            decoration: pageDecoration.copyWith(
                contentMargin: const EdgeInsets.symmetric(horizontal: 16),
                fullScreen: true,
                imageFlex: 1,
                pageColor: ThemeManager.primaryColor),
          ),
          PageViewModel(
            title: '',
            body: '',
            image: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Image.asset(
                    "assets/images/intro_three.png",
                    height: MediaQuery.of(context).size.height * 0.55,
                  ),
                ),
                const SizedBox(height: 20),
                CommonWidgets.commonText(
                    mText:
                        'GET YOUR ORDER\n\nAI to do the Auto linkage\nof your receipt to the\n bank statements.',
                    mColor: Colors.white,
                    mSize: 18.0,
                    mFontWeight: FontWeight.w700,
                    mMaxLine: 4,
                    mTextAlign: TextAlign.center),
                SizedBox(height: MediaQuery.of(context).size.height * 0.15)
              ],
            ),
            decoration: pageDecoration.copyWith(
                contentMargin: const EdgeInsets.symmetric(horizontal: 16),
                fullScreen: true,
                imageFlex: 1,
                pageColor: ThemeManager.primaryColor),
          ),
        ],
        onDone: () => _onIntroEnd(context),
        onSkip: () => _onIntroEnd(context),
        // You can override onSkip callback
        showSkipButton: true,
        globalBackgroundColor: ThemeManager.primaryColor,
        skip: GestureDetector(
          onTap: () {
            Navigator.pushAndRemoveUntil(
                context,
                PageTransition(
                    child: const LoginScreen(),
                    type: PageTransitionType.fade,
                    duration: const Duration(milliseconds: 900),
                    reverseDuration: (const Duration(milliseconds: 900))),
                (Route<dynamic> route) => false);
          },
          child: Container(
            height: 30,
            width: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).primaryColor),
            child: Center(
              child: Text(
                'Skip',
                style: TextStyle(
                    color: ThemeManager.colorWhite,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        next: Bounce(
          duration: Duration(milliseconds: 110),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                PageTransition(
                    child: const LoginScreen(),
                    type: PageTransitionType.fade,
                    duration: const Duration(milliseconds: 900),
                    reverseDuration: (const Duration(milliseconds: 900))),
                    (Route<dynamic> route) => false);
          },
          child: const Icon(
            Icons.arrow_forward,
            color: Colors.white,
          ),
        ),
        curve: Curves.fastLinearToSlowEaseIn,
        controlsMargin: const EdgeInsets.only(left: 5, right: 5),
        controlsPadding: kIsWeb
            ? const EdgeInsets.all(12.0)
            : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
        dotsDecorator: const DotsDecorator(
          size: Size(10.0, 10.0),
          color: Color(0xFFA19C9C),
          activeSize: Size(20.0, 10.0),
          activeColor: Colors.white,
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
        dotsContainerDecorator: const ShapeDecoration(
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
        done: GestureDetector(
          onTap: () {
            Navigator.pushAndRemoveUntil(
                context,
                PageTransition(
                    child: const LoginScreen(),
                    type: PageTransitionType.fade,
                    duration: const Duration(milliseconds: 900),
                    reverseDuration: (const Duration(milliseconds: 900))),
                    (Route<dynamic> route) => false);
          },
          child: Container(
            height: 30,
            width: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).primaryColor),
            child: Center(
              child: Text('Done',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ThemeManager.colorWhite,
                      fontSize: 14)),
            ),
          ),
        ),
      ),
    );
  }
}
