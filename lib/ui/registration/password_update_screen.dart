import 'package:distro_mate/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';

import '../../../provider/provider/theme_provider.dart';
import '../../../utils/helper/validation_utils.dart';
import '../../../utils/localization/language_constrants.dart';
import '../../controllers/auth_controller.dart';
import '../../utils/helper/common_widgets.dart';
import '../../utils/helper/theme_manager.dart';
import '../../widgets/input_decor.dart';

class PasswordUpdateScreen extends StatefulWidget {
  String user_id;

  PasswordUpdateScreen(this.user_id, {Key? key}) : super(key: key);

  @override
  State<PasswordUpdateScreen> createState() => _PasswordUpdateScreenState();
}

class _PasswordUpdateScreenState extends State<PasswordUpdateScreen> {
  final _phoneTextField = TextEditingController();
  final _passwordTextField = TextEditingController();

  final AuthController _authController = Get.put(AuthController());

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
                            child: Text('UPDATE PASSWORD',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black)),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text('Please set you new password',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey)),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, left: 15),
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
                              style: TextStyle(color: Colors.black),
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
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        Obx(
                          () => !_authController.isLoading.value
                              ? Center(
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    width: double.infinity,
                                    child: ElevatedButton.icon(
                                        style: ThemeManager.primaryButtonStyle(
                                            context, 10, 10),
                                        onPressed: () {
                                          onLoginSubmit();
                                        },
                                        icon: const Icon(Icons.login),
                                        label: Text('Submit')),
                                  ),
                                )
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

  void onLoginSubmit() {
    if (_passwordTextField.text.isEmpty) {
      Get.snackbar('Alert', 'Please Enter Paasword');
    } else {
      var data = {
        "user_id": widget.user_id,
        "password": _passwordTextField.text.toString()
      };
      _authController.forgotPasswordUpdate(data, callback);
    }
  }

  callback(bool status, Map data) async {
    if (status == true) {
      Get.snackbar('Alert', data['message'], backgroundColor: Colors.white);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
          (Route<dynamic> route) => false);
    } else {
      print('test');
      Get.snackbar('Alert', data['message'], backgroundColor: Colors.white);
      //ToastUtils.setToast(data['message']);
    }
  }
}
