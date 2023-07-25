import 'package:flutter/material.dart';

import '../localization/language_model.dart';

class AppConstants {
  static String base_url = 'http://codegenit.work/distro_mate/public/api/';
  static String bank_base_url = 'https://au-api.basiq.io/';
  static String image_base_url = 'http://codegenit.work/distro_mate/public/';
  static String registration_verify_mobile_number = base_url + 'receipts_house/public/api/v1/register';
  static String login = base_url + 'receipts_house/public/api/v1/login';
  static String forgot_password = base_url + 'receipts_house/public/api/v1/forgot-password';
  static String forgot_password_otp_verify = base_url + 'receipts_house/public/api/v1/forgot-otp-verify';
  static String forgot_password_update = base_url + 'receipts_house/public/api/v1/forgot-password-update';
  static String registration_otp_verify = base_url + 'receipts_house/public/api/v1/otpVerify';
  static String registration_resend_otp = base_url + 'receipts_house/public/api/v1/resendOtp';
  static String add_receipt = base_url + 'receipts_house/public/api/v1/store-receipt';
  static String receipt_list = base_url + 'receipts_house/public/api/v1/get-receipt';
  static String getProfile = base_url + 'receipts_house/public/api/v1/get-profile';
  static String updateProfile = base_url + 'receipts_house/public/api/v1/update-profile';

  // Bank api
  static String generate_token = bank_base_url + 'token';
  static String institutions_list = bank_base_url + 'institutions';
  static String create_user = bank_base_url + 'users';
  static String connection_list = bank_base_url+'users/';
  static String transaction_list = bank_base_url+'users/';








  //Pref Constant
  static String fcmToken = '';
  static String totalBalance = '';
  static String api_key = 'N2I5ZTBjYzUtNzI1Zi00ZDhmLThlZmUtZDcwMzZmMzc4MWJhOjdkZDJmOWRhLWU3ZTgtNGIxYi05ZWU1LTVhOGIyODM3ODU1Yw==';

  //Internet connection
  static String title = 'Connectivity';
  static String message = 'No Internet Available';

}

class LanguageConstants {
  static const String countryCode = 'country_code';
  static const String languageCode = 'language_code';
  static const String index = 'index';
  static List<LanguageModel> languages = [
    LanguageModel(
        imageUrl: '',
        languageName: 'English',
        countryCode: 'US',
        languageCode: 'en'),
    LanguageModel(
        imageUrl: '',
        languageName: 'Hindi',
        countryCode: 'IN',
        languageCode: 'hi'),
  ];
}

class SharedPrefsKeys {
  static const TOKEN = 'TOKEN';
  static const USER_LOGGED_IN = 'USER_LOGGED_IN';
  static const USER_TOKEN = 'USER_TOKEN';
  static const BANK_USER_TOKEN = 'BANK_USER_TOKEN';
  static const BANK_USER_ID = 'BANK_USER_ID';
  static const role = 'role';
  static const firebasetoken = 'firebasetoken';
  static const firstname = 'firstname';
  static const lastname = 'lastname';
  static const userId = 'userId';
  static const email = 'email';
  static const phone = 'phone';
  static const birthday = 'birthday';
  static const gender = 'gender';
  static const employeeNo = 'employeeNo';
  static const jobTitle = 'jobTitle';
  static const profileimage = 'profileimage';
  static const FIRST_TIME_LAUNCH = 'first_time_launch';
  static const USER_DATA = "user_data";
  static const USER_LANGUAGE = 'user_language';
  static const password_remember = 'password_remember';
  static const password = 'password';
}
