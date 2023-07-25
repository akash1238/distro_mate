import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import '../../../provider/provider/theme_provider.dart';
import '../../../utils/helper/validation_utils.dart';
import '../../../utils/localization/language_constrants.dart';
import '../ui/dashboard/dashboard_screen.dart';
import '../ui/registration/create_account_screen.dart';
import '../ui/registration/register_screen.dart';
import '../utils/helper/common_widgets.dart';
import '../utils/helper/theme_manager.dart';
import '../utils/toast_util.dart';
import '../widgets/input_decor.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailTextField = TextEditingController();
  final _passwordTextField = TextEditingController();

  //final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ThemeManager.primaryColor,
      body: Container(
        margin: EdgeInsets.only(
            top: MediaQuery.of(context).viewInsets.bottom == 0
                ? size.height * 0.1
                : size.height * 0.05),
        child: Column(
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: MediaQuery.of(context).viewInsets.bottom == 0
                  ? size.height * 0.15
                  : size.height * 0.10,
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
                            child: Text('Welcome Back',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black)),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text(
                                'Login to your account using mobile\nnumber and username',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey)),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 5, left: 15),
                          child: CommonWidgets.commonText(
                              mText: 'Phone No.',
                              mSize: 14.0,
                              mFontWeight: FontWeight.w600),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 5, left: 10, right: 10),
                          child: TextFormField(
                              controller: _emailTextField,
                              keyboardType: TextInputType.number,
                              // validator: (input) => validateEmail(input!, context).toString() == "" ? null : validateEmail(input, context),

                              style: Theme.of(context).textTheme.bodyText1,
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
                          height: size.height * 0.02,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 5, left: 15),
                          child: CommonWidgets.commonText(
                              mText: 'password',
                              mSize: 14.0,
                              mFontWeight: FontWeight.w600),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          child: TextFormField(
                              obscureText: true,
                              controller: _passwordTextField,
                              keyboardType: TextInputType.visiblePassword,
                              // validator: (input) => validateEmail(input!, context).toString() == "" ? null : validateEmail(input, context),
                              style: Theme.of(context).textTheme.bodyText1,
                              decoration: InputDecorE().editBoxBorderGrey(
                                  context,
                                  Icons.lock,
                                 'XXXXXXXXXX',
                                  Provider.of<DarkThemeProvider>(context)
                                          .darkTheme
                                      ? true
                                      : false)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 15),
                          child: Row(
                            children: [
                              Expanded(
                                  child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const RegisterScreen()));
                                },
                                child: Visibility(
                                  visible: false,
                                  child: Text('Register',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color:
                                              Theme.of(context).primaryColor)),
                                ),
                              )),
                              GestureDetector(
                                onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             const ForgotPasswordScreen()));
                                },
                                child: Text('Forgot Password?',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Theme.of(context).primaryColor,
                                    )),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        Center(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 15),
                            width: double.infinity,
                            child: ElevatedButton.icon(
                                style: ThemeManager.primaryButtonStyle(
                                    context, 10, 10),
                                onPressed: () {

                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const DashboardScreen()),
                                          (Route<dynamic> route) => false);
                                 /* if (!ValidationUtils.isValidEmail(
                                      _emailTextField.text.toString())) {
                                    ToastUtils.setToast(
                                        "Please enter valid email");
                                  } else if (_passwordTextField.text.isEmpty) {
                                    ToastUtils.setToast(
                                        "Please enter password");
                                  } else {
                                    // var data = {
                                    //   "username" : _emailTextField.text.toString(),
                                    //   "password" : _passwordTextField.text.toString()};
                                    // _authController.login(context,data, callback);


                                  }*/
                                },
                                icon: const Icon(Icons.login),
                                label:
                                    Text(getTranslated('sign_in', context)!)),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an Account?',
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
                                            const CreateAccountScreen()));
                              },
                              child: Text(
                                '  Register Now',
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: ThemeManager.primaryColor),
                              ),
                            )
                          ],
                        )
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
      ToastUtils.setToast(data['message']);
      // Navigator.pushAndRemoveUntil(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) =>
      //         const HomeScreen()),
      //         (Route<dynamic> route) => false);
    } else {
      ToastUtils.setToast(data['message']);
    }
  }
}
