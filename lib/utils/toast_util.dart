import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'helper/theme_manager.dart';

class ToastUtils {
 static setToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: ThemeManager.primaryText,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
