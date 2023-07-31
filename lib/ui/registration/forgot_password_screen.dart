import 'package:distro_mate/ui/registration/verify_otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';

import '../../../provider/provider/theme_provider.dart';
import '../../../utils/helper/validation_utils.dart';
import '../../../utils/localization/language_constrants.dart';
import '../../controllers/auth_controller.dart';
import '../../login/login_screen.dart';
import '../../utils/helper/common_widgets.dart';
import '../../utils/helper/theme_manager.dart';
import '../../utils/toast_util.dart';
import '../../widgets/input_decor.dart';
import 'forgot_password_verify_otp_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _mobileTextField = TextEditingController();
  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ThemeManager.primaryColor,
      body: Container(
        margin: EdgeInsets.only(top: size.height * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back_ios, color: Colors.white)),
            ),
            SizedBox(
              height: MediaQuery.of(context).viewInsets.bottom == 0
                  ? size.height * 0.10
                  : 10,
            ),
            Center(
              child: Image.asset(
                'assets/images/logo.png',
                height: MediaQuery.of(context).viewInsets.bottom == 0
                    ? size.height * 0.15
                    : size.height * 0.10,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).viewInsets.bottom == 0
                  ? size.height * 0.10
                  : 10,
            ),
            Expanded(
              child: Card(
                margin: const EdgeInsets.all(0),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, top: 25, bottom: 5),
                            child: Text('Forgot Password'.toUpperCase(),
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black)),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, left: 15),
                          child: CommonWidgets.commonText(
                              mText: 'Phone No.',
                              mSize: 14.0,
                              mFontWeight: FontWeight.w600),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          child: TextFormField(
                              controller: _mobileTextField,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.done,
                              maxLength: 10,
                              style: TextStyle(color: Colors.black),
                              obscureText: false,
                              decoration: InputDecorE().editBoxBorderGrey(
                                  context,
                                  Icons.phone_android,
                                  'XXXXXXXXXX',
                                  Provider.of<DarkThemeProvider>(context)
                                          .darkTheme
                                      ? true
                                      : false)),
                        ),
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        Obx(
                          () => !_authController.isLoading.value
                              ? Center(
                                  child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 15),
                                  width: double.infinity,
                                  child: ElevatedButton.icon(
                                    style: ThemeManager.primaryButtonStyle(
                                        context, 10, 10),
                                    onPressed: () {
                                      if (_mobileTextField.text.isEmpty) {
                                        Get.snackbar('Alert',
                                            'Please Enter Mobile Number',
                                            backgroundColor: Colors.white);
                                      } else if (_mobileTextField.text.length <
                                          10) {
                                        Get.snackbar('Alert',
                                            'Please Enter Valid Mobile Number',
                                            backgroundColor: Colors.white);
                                      } else {
                                        var data = {
                                          "phone":
                                              _mobileTextField.text.toString(),
                                        };
                                        _authController
                                            .forgotPassword(
                                                data, callback);
                                      }
                                    },
                                    icon: const Icon(Icons.login),
                                    label: Text('Next'),
                                  ),
                                ))
                              : Center(
                                  child: SizedBox(
                                  height: 60,
                                  child: LoadingIndicator(
                                      indicatorType: Indicator.ballRotateChase,
                                      colors: [ThemeManager.primaryColor],
                                      strokeWidth: 2,
                                      backgroundColor: Colors.white,
                                      pathBackgroundColor:
                                          ThemeManager.primaryColor),
                                )),
                        ),
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an Account?',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: ThemeManager.darkLineColor),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen()));
                              },
                              child: Text(
                                '  Sign In',
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: ThemeManager.primaryColor),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  callback(bool status, Map data) async {
    if (status == true) {
      Get.snackbar('Alert',data['message'],backgroundColor: Colors.white);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => ForgotPasswordVerifyOTPScreen(
                  data['data']['otp'], data['data']['user_id'])),
          (Route<dynamic> route) => false);
    } else {
      Get.snackbar('Alert',data['message'],backgroundColor: Colors.white);
    }
  }
}
