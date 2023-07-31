import 'dart:convert';
import 'dart:developer';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../utils/constants/app_constants.dart';
import '../utils/helper/pref_utils.dart';
import 'GetxNetworkManager.dart';

class AuthController extends GetxController {
  final _isLoading = false.obs;

  get isLoading => _isLoading;
  final GetXNetworkManager _networkManager = Get.find<GetXNetworkManager>();

  Future registrationVerifyMobileNumber(data, callback) async {
    Map<String, String> headers = {
      "Accept": "application/json",
      "content-type": "application/json",
    };

    if (_networkManager.connectionType != 0) {
      _isLoading.value = true;
      update();
      print(data);
      http.Response response = await http.post(
          Uri.parse(AppConstants.registration_verify_mobile_number),
          body: jsonEncode(data),
          headers: headers);
      print(response.body.toString());
      Map? map;
      if (response.statusCode == 200) {
        map = jsonDecode(response.body);
        print(response.body);
        if (map!['code'] == '200') {
          _isLoading.value = false;
          callback(true, map);
          update();
        } else {
          callback(false, '');
          _isLoading.value = false;
          update();
        }
      } else {
        print(_networkManager.connectionType);
        Get.snackbar(AppConstants.title, AppConstants.message,
            backgroundColor: Colors.white);
      }
    }
  }


  Future registrationVerifyMobileNumberOTP(data, callback) async {
    Map<String, String> headers = {
      "Accept": "application/json",
      "content-type": "application/json",
    };

    if (_networkManager.connectionType != 0) {
      _isLoading.value = true;
      update();
      print(data);
      http.Response response = await http.post(
          Uri.parse(AppConstants.registration_verify_mobile_number_otp),
          body: jsonEncode(data),
          headers: headers);
      print(response.body.toString());
      Map? map;
      if (response.statusCode == 200) {
        map = jsonDecode(response.body);
        print(response.body);
        if (map!['code'] == '200') {
          _isLoading.value = false;
          callback(true, map);
          update();
        } else {
          callback(false, '');
          _isLoading.value = false;
          update();
        }
      } else {
        print(_networkManager.connectionType);
        Get.snackbar(AppConstants.title, AppConstants.message,
            backgroundColor: Colors.white);
      }
    }
  }


  Future registration(data, callback) async {
    Map<String, String> headers = {
      "Accept": "application/json",
      "content-type": "application/json",
    };

    if (_networkManager.connectionType != 0) {
      _isLoading.value = true;
      update();
      print(data);
      http.Response response = await http.post(
          Uri.parse(AppConstants.create_account),
          body: jsonEncode(data),
          headers: headers);
      print(response.body.toString());
      Map? map;
      if (response.statusCode == 200) {
        map = jsonDecode(response.body);
        print(response.body);
        if (map!['code'] == '200') {
          _isLoading.value = false;
          callback(true, map);
          update();
        } else {
          callback(false, map);
          _isLoading.value = false;
          update();
        }
      } else {
        print(_networkManager.connectionType);
        Get.snackbar(AppConstants.title, AppConstants.message,
            backgroundColor: Colors.white);
      }
    }
  }

  Future login(data, callback) async {
    Map<String, String> headers = {
      "Accept": "application/json",
      "content-type": "application/json",
    };

    if (_networkManager.connectionType != 0) {
      _isLoading.value = true;
      update();
      print(data);
      http.Response response = await http.post(
          Uri.parse(AppConstants.login),
          body: jsonEncode(data),
          headers: headers);
      print(response.body.toString());
      Map? map;
      if (response.statusCode == 200) {
        map = jsonDecode(response.body);
        print(response.body);
        if (map!['code'] == '200') {
          _isLoading.value = false;
          try {
            PrefUtils.setUserToken(map['data']['api_token']);
            PrefUtils.setUserID(map['data']['user_id']);
            PrefUtils.setCompanyName(map['data']['company_name']);
            PrefUtils.setEmergencyMobile(map['data']['phone']);
            PrefUtils.setEmail(map['data']['email']);
            PrefUtils.setAddress(map['data']['address']);
            PrefUtils.setTypeofBusiness(map['data']['type_of_business']);
          } catch (e) {}
          callback(true, map);
          update();
        } else {
          _isLoading.value = false;
          callback(
            false,
            map,
          );
          update();
        }
      } else {
        callback(false, map);
        _isLoading.value = false;
        update();
      }
    } else {
      Get.snackbar(AppConstants.title, AppConstants.message);
    }
  }


  Future forgotPassword(data, callback) async {
    Map<String, String> headers = {
      "Accept": "application/json",
      "content-type": "application/json",
    };

    if (_networkManager.connectionType != 0) {
      _isLoading.value = true;
      update();
      print(data);
      http.Response response = await http.post(
          Uri.parse(AppConstants.forgot_password),
          body: jsonEncode(data),
          headers: headers);
      print(response.body.toString());
      Map? map;
      if (response.statusCode == 200) {
        map = jsonDecode(response.body);
        print(response.body);
        if (map!['code'] == '200') {
          _isLoading.value = false;
          callback(true, map);
          update();
        } else {
          _isLoading.value = false;
          callback(
            false,
            map,
          );
          update();
        }
      } else {
        callback(false, '');
        _isLoading.value = false;
        update();
      }
    } else {
      Get.snackbar(AppConstants.title, AppConstants.message);
    }
  }


  Future forgotPasswordOTPVerify (data, callback) async {
    Map<String, String> headers = {
      "Accept": "application/json",
      "content-type": "application/json",
    };

    if (_networkManager.connectionType != 0) {
      _isLoading.value = true;
      update();
      print(data);
      http.Response response = await http.post(
          Uri.parse(AppConstants.forgot_password_otp_verify),
          body: jsonEncode(data),
          headers: headers);
      print(response.body.toString());
      Map? map;
      if (response.statusCode == 200) {
        map = jsonDecode(response.body);
        print(response.body);
        if (map!['code'] == '200') {
          _isLoading.value = false;
          callback(true, map);
          update();
        } else {
          _isLoading.value = false;
          callback(
            false,
            map,
          );
          update();
        }
      } else {
        callback(false, '');
        _isLoading.value = false;
        update();
      }
    } else {
      Get.snackbar(AppConstants.title, AppConstants.message);
    }
  }
  Future registratinOTPVerify (data, callback) async {
    Map<String, String> headers = {
      "Accept": "application/json",
      "content-type": "application/json",
    };

    if (_networkManager.connectionType != 0) {
      _isLoading.value = true;
      update();
      print(data);
      http.Response response = await http.post(
          Uri.parse(AppConstants.registration_otp_verify),
          body: jsonEncode(data),
          headers: headers);
      print(response.body.toString());
      Map? map;
      if (response.statusCode == 200) {
        map = jsonDecode(response.body);
        print(response.body);
        if (map!['code'] == '200') {
          _isLoading.value = false;
          callback(true, map);
          update();
        } else {
          _isLoading.value = false;
          callback(
            false,
            map,
          );
          update();
        }
      } else {
        callback(false, '');
        _isLoading.value = false;
        update();
      }
    } else {
      Get.snackbar(AppConstants.title, AppConstants.message);
    }
  }


  Future forgotPasswordUpdate (data, callback) async {
    Map<String, String> headers = {
      "Accept": "application/json",
      "content-type": "application/json",
    };

    if (_networkManager.connectionType != 0) {
      _isLoading.value = true;
      update();
      print(data);
      http.Response response = await http.post(
          Uri.parse(AppConstants.forgot_password_update),
          body: jsonEncode(data),
          headers: headers);
      print(response.body.toString());
      Map? map;
      if (response.statusCode == 200) {
        map = jsonDecode(response.body);
        print(response.body);
        if (map!['code'] == '200') {
          _isLoading.value = false;
          callback(true, map);
          update();
        } else {
          _isLoading.value = false;
          callback(
            false,
            map,
          );
          update();
        }
      } else {
        callback(false, '');
        _isLoading.value = false;
        update();
      }
    } else {
      Get.snackbar(AppConstants.title, AppConstants.message);
    }
  }


  Future registration_resend_otp (data, callback) async {
    Map<String, String> headers = {
      "Accept": "application/json",
      "content-type": "application/json",
    };

    if (_networkManager.connectionType != 0) {
      _isLoading.value = true;
      update();
      print(data);
      http.Response response = await http.post(
          Uri.parse(AppConstants.registration_resend_otp),
          body: jsonEncode(data),
          headers: headers);
      print(response.body.toString());
      Map? map;
      if (response.statusCode == 200) {
        map = jsonDecode(response.body);
        print(response.body);
        if (map!['code'] == '200') {
          _isLoading.value = false;
          callback(true, map);
          update();
        } else {
          _isLoading.value = false;
          callback(
            false,
            map,
          );
          update();
        }
      } else {
        callback(false, '');
        _isLoading.value = false;
        update();
      }
    } else {
      Get.snackbar(AppConstants.title, AppConstants.message);
    }
  }
/*
  Future changepassword(data, callback) async {
    if (_networkManager.connectionType != 0) {
      _isLoading.value = true;

      Map<String, String> headers = {
        "Authorization": 'Bearer ${PrefUtils.getUserToken()}',
        "content-type": "application/json",
      };
      http.Response response = await http.post(
          Uri.parse(AppConstants.change_password),
          body: data,
          headers: headers);
      if (response != null && response.statusCode == 200) {
        _isLoading.value = false;
        update();
        return jsonDecode(response.body)['status'];
      } else {
        _isLoading.value = false;
        update();
      }
    } else {
      Get.snackbar(AppConstants.title, AppConstants.message);
    }
  }*/
}
