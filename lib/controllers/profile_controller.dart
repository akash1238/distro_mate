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

class ProfileController extends GetxController {
  final _isLoading = false.obs;

  get isLoading => _isLoading;
  final GetXNetworkManager _networkManager = Get.find<GetXNetworkManager>();

  Future updateProfile(
      String value, String name,String address,String typeofbusiness, String email, String mobile, callback) async {
    Map<String, String> headers = {
      'id': PrefUtils.getuserID(),
      'Authorization': PrefUtils.getUserToken()
    };
    if (_networkManager.connectionType != 0) {
      _isLoading.value = true;
      update();
      var request =
          http.MultipartRequest('POST', Uri.parse(AppConstants.updateProfile));
      if(value.isNotEmpty) {
        request.files.add(await http.MultipartFile.fromPath('image', value));
      }
      request.fields.addAll({
        'user_id': PrefUtils.getuserID(),
        'company_name': name,
        'mobile': mobile,
        'email': email,
        'address': address,
        'typeofbusiness': typeofbusiness,
      });
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      var responseData = await response.stream.bytesToString();
      var jsonData = jsonDecode(responseData);
      if (response.statusCode == 200) {
        if (jsonData!['code'] == '200') {
          _isLoading.value = false;
          callback(true, jsonData);
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

  Future GetProfile(callback) async {
    if (_networkManager.connectionType != 0) {
      _isLoading.value = true;
      Map<String, String> headers = {
        'id': PrefUtils.getuserID(),
        'Authorization': PrefUtils.getUserToken()
      };
      Map<String, String> body = {
        'user_id': PrefUtils.getuserID(),
      };
      print(headers);
      http.Response response = await http.post(
          Uri.parse('${AppConstants.getProfile}'),
          headers: headers,
          body: body);

      print('request url  : ' + '${AppConstants.getProfile}');
      print('response : ' + response.body.toString());
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
}
