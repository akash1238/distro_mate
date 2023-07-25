import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:distro_mate/utils/helper/pref_utils.dart';
import 'package:distro_mate/utils/helper/theme_manager.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';




// import 'package:loader_animated/loader.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';



class CommonMethods {
  static File? visitingCardFile;
  static StreamSubscription<ConnectivityResult>? connectivity;
  static var notificationcount = 0.obs;


  static void showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.black,
        textColor: Colors.white);
  }

  static void showBottomToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.black,
        textColor: Colors.white);
  }

  static String getTimeDiff(time1, time2) {
    var format = DateFormat("HH:mm");
    var one = format.parse(time1);
    var two = format.parse(time2);
    return "${two.difference(one).inMinutes}";
  }

  // static void showAlertDialog(BuildContext context){
  //   AlertDialog alert=AlertDialog(
  //     content: LoadingBouncingLine(size: 30,),
  //   );
  //   showDialog(barrierDismissible: false,
  //     context:context,
  //     builder:(BuildContext context){
  //       return alert;
  //     },
  //   );
  // }
  static double deviceHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double deviceWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static Future<dynamic> isConnected() async {
    return await (Connectivity().checkConnectivity());
  }

  static Future<bool> checkUserConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (exception) {
      return false;
    }
  }

  static setStringPref(String key, String value) async {
    SharedPreferences mPref = await SharedPreferences.getInstance();
    mPref.setString(key, value);
  }

  static setBoolPref(String key, bool value) async {
    SharedPreferences mPref = await SharedPreferences.getInstance();
    mPref.setBool(key, value);
  }

  static Future<String> getStringPref(String key) async {
    SharedPreferences mPref = await SharedPreferences.getInstance();
    String data = mPref.getString(key) as String;
    return data;
  }

  static Future<dynamic> getBoolPref(String key) async {
    SharedPreferences mPref = await SharedPreferences.getInstance();
    bool? data = mPref.getBool(key);
    return data;
  }

  static Future getNull() async {
    return await CommonMethods.getStringPref('');
  }

  //
  static String currentDate() {
    var now = DateTime.now();
    var formatter = DateFormat('dd-MM-yyyy');
    String formattedDate = formatter.format(now);
    return formattedDate;
  }

  static String currentTime() {
    var now = DateTime.now();
    var formatter = DateFormat('HH:mm');
    String formattedDate = formatter.format(now);
    return formattedDate;
  }

  //
  static String currentDateForServer() {
    var now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd hh:mm:ss');
    String formattedDate = formatter.format(now);
    return formattedDate;
  }

  static String convertDateTimeDisplay(DateTime dateTime) {
    String formattedDate = DateFormat('dd MMM yyyy').format(dateTime);
    return formattedDate;
  }

  static int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  static Future<void> sendEmail(
      {email, String subject = "", String body = ""}) async {
    String mail = "mailto:$email?subject=$subject&body=$body}";
    if (await canLaunch(mail)) {
      await launch(mail);
    } else {
      throw Exception("Unable to open the email");
    }
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
          title: Center(
            child: Text('LOGOUT',
                textScaleFactor: 1.0,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: ThemeManager.colorBlack)),
          ),
          content: Text('Are you sure you want to log out from \nReceipt House?',
              textScaleFactor: 1.0,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: ThemeManager.colorBlack)),
          contentTextStyle: TextStyle(color: ThemeManager.primaryText),
          actions: <Widget>[
            Container(
              child: Column(
                children: [
                  Divider(
                    height: 3,
                    color: ThemeManager.colorBlack,
                  ),
                  IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                            child: Text('Cancel',
                                textScaleFactor: 1.0,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: ThemeManager.colorBlack)),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                        VerticalDivider(
                          width: 3,
                          color: ThemeManager.colorBlack,
                        ),
                        TextButton(
                          child: Text('Logout',
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: ThemeManager.colorBlack)),
                          onPressed: () {
                            PrefUtils.logout();
                            // Navigator.pushAndRemoveUntil(
                            //     context,
                            //     PageTransition(
                            //         child: LoginScreen(),
                            //         type: PageTransitionType.fade,
                            //         duration: const Duration(milliseconds: 900),
                            //         reverseDuration:
                            //         (const Duration(milliseconds: 900))),
                            //         (Route<dynamic> route) => false);
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


  static Future<dynamic> getFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      File fileToUpload = File(pickedFile.path);
      return fileToUpload;
    } else {
      return 'no_file_picked';
    }
  }

  static Future<dynamic> getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      File fileToUpload = File(pickedFile.path);
      return fileToUpload;
    } else {
      return 'no_file_picked';
    }
  }

  static Future<dynamic> getFromDocument() async {
    FilePickerResult? pickedFile = await FilePicker.platform.pickFiles();

    if (pickedFile != null) {
      File fileToUpload = File(pickedFile.files.single.path.toString());
      return fileToUpload;
    } else {
      return 'no_file_picked';
    }
  }

  static List<String> getDatesInBetween(DateTime startDate, DateTime endDate) {
    List<String> days = [];
    for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
      days.add(
          DateFormat('yyyy-MM-dd').format(startDate.add(Duration(days: i))));
    }
    return days;
  }

  static bool isEmailValid(String email) {
    bool emailValid = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
    return emailValid;
  }


  static void clearSharedPReference() async {
    SharedPreferences mPref = await SharedPreferences.getInstance();
    await mPref.clear();
  }

  static Map<int, String> getTitle() {
    var title = {
      0: '--Select--',
      1: 'Mr',
      2: 'Mrs',
      3: 'Ms',
      4: 'TBD',
    };
    return title;
  }

  static int getTitleValue(String titleStr) {
    int title = 0;
    switch (titleStr) {
      case '--Select--':
        title = 0;
        break;
      case 'Mr':
        title = 1;
        break;
      case 'Mrs':
        title = 2;
        break;
      case 'Ms':
        title = 3;
        break;
      case 'TBD':
        title = 100;
        break;
    }
    return title;
  }


}
