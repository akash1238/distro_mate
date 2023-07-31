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

class RegisterScreen extends StatefulWidget {
  String user_id;

  RegisterScreen(this.user_id, {Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthController _authController = Get.put(AuthController());

  final _addressTextField = TextEditingController();
  final _companyNameTextField = TextEditingController();
  final _mobileTextField = TextEditingController();
  final _emailTextField = TextEditingController();
  final _typeofbusinessTextField = TextEditingController();
  final _passwordTextField = TextEditingController();

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
            Center(
              child: Image.asset(
                'assets/images/logo.png',
                height: MediaQuery.of(context).viewInsets.bottom == 0
                    ? size.height * 0.10
                    : size.height * 0.10,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).viewInsets.bottom == 0
                  ? size.height * 0.03
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
                            child: Text('Create New Account',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black)),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text(
                                'Set your username and password.\nYou can always change it later.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey)),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, left: 15),
                          child: CommonWidgets.commonText(
                              mText: 'Company Name',
                              mSize: 14.0,
                              mFontWeight: FontWeight.w600),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          child: TextFormField(
                              controller: _companyNameTextField,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,

                              // validator: (input) => validateEmail(input!, context).toString() == "" ? null : validateEmail(input, context),

                              style: TextStyle(color: Colors.black),
                              decoration: InputDecorE().editBoxBorderGrey(
                                  context,
                                  Icons.account_balance,
                                  '',
                                  Provider.of<DarkThemeProvider>(context)
                                          .darkTheme
                                      ? true
                                      : false)),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, left: 15),
                          child: CommonWidgets.commonText(
                              mText: 'Address',
                              mSize: 14.0,
                              mFontWeight: FontWeight.w600),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          child: TextFormField(
                              controller: _addressTextField,
                              keyboardType: TextInputType.text,
                              // validator: (input) => validateEmail(input!, context).toString() == "" ? null : validateEmail(input, context),

                              style: TextStyle(color: Colors.black),
                              textInputAction: TextInputAction.next,
                              decoration: InputDecorE().editBoxBorderGrey(
                                  context,
                                  Icons.home_filled,
                                  '',
                                  Provider.of<DarkThemeProvider>(context)
                                          .darkTheme
                                      ? true
                                      : false)),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
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
                              textInputAction: TextInputAction.next,
                              maxLength: 10,
                              style: TextStyle(color: Colors.black),
                              obscureText: false,
                              decoration: InputDecorE().editBoxBorderGrey(
                                  context,
                                  Icons.phone_android,
                                  '',
                                  Provider.of<DarkThemeProvider>(context)
                                          .darkTheme
                                      ? true
                                      : false)),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, left: 15),
                          child: CommonWidgets.commonText(
                              mText: 'Email',
                              mSize: 14.0,
                              mFontWeight: FontWeight.w600),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          child: TextFormField(
                              controller: _emailTextField,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              style: TextStyle(color: Colors.black),
                              obscureText: false,
                              decoration: InputDecorE().editBoxBorderGrey(
                                  context,
                                  Icons.mail,
                                  '',
                                  Provider.of<DarkThemeProvider>(context)
                                          .darkTheme
                                      ? true
                                      : false)),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, left: 15),
                          child: CommonWidgets.commonText(
                              mText: 'Type of Business',
                              mSize: 14.0,
                              mFontWeight: FontWeight.w600),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          child: TextFormField(
                              controller: _typeofbusinessTextField,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecorE().editBoxBorderGrey(
                                  context,
                                  Icons.groups,
                                  '',
                                  Provider.of<DarkThemeProvider>(context)
                                          .darkTheme
                                      ? true
                                      : false)),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, left: 15),
                          child: CommonWidgets.commonText(
                              mText: 'Password',
                              mSize: 14.0,
                              mFontWeight: FontWeight.w600),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          child: TextFormField(
                              controller: _passwordTextField,
                              keyboardType: TextInputType.visiblePassword,
                              textInputAction: TextInputAction.done,
                              // validator: (input) => validateEmail(input!, context).toString() == "" ? null : validateEmail(input, context),

                              style: TextStyle(color: Colors.black),
                              decoration: InputDecorE().editBoxBorderGrey(
                                  context,
                                  Icons.lock,
                                  '',
                                  Provider.of<DarkThemeProvider>(context)
                                          .darkTheme
                                      ? true
                                      : false)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             const ForgotPasswordScreen()));
                          },
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text('Forgot Password?',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context).primaryColor,
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
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
                                      _onSignUpClick();
                                    },
                                    icon: const Icon(Icons.login),
                                    label: Text('Register Now'),
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
                        const SizedBox(height: 20),
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

  void _onSignUpClick() {
    if (_companyNameTextField.text.isEmpty) {
      ToastUtils.setToast("Please enter Company Name");
    } else if (_addressTextField.text.isEmpty) {
      ToastUtils.setToast("Please enter address");
    } else if (_mobileTextField.text.toString().isEmpty) {
      ToastUtils.setToast("Please enter phone number");
    } else if (_typeofbusinessTextField.text.toString().isEmpty) {
      ToastUtils.setToast("Please enter type of business");
    } else if (_passwordTextField.text.toString().isEmpty) {
      ToastUtils.setToast("Please enter type of business");
    } else {
      var body = {
        "user_id": widget.user_id,
        "company_name": _companyNameTextField.text.toString(),
        "address": _addressTextField.text.toString(),
        "email": _emailTextField.text.toString(),
        "type_of_business": _typeofbusinessTextField.text.toString(),
        "password": _passwordTextField.text.toString(),
      };
      _authController.registration(body, callback);
    }
  }

  callback(bool status, Map data) async {
    if (status == true) {
      ToastUtils.setToast(data['message']);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
          (Route<dynamic> route) => false);
    } else {
      ToastUtils.setToast(data['message']);
    }
  }
}
