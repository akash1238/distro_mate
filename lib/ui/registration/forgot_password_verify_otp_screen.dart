import 'package:distro_mate/ui/registration/password_update_screen.dart';
import 'package:distro_mate/ui/registration/register_screen.dart';
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

class ForgotPasswordVerifyOTPScreen extends StatefulWidget {
  String otp;
  String user_id;

  ForgotPasswordVerifyOTPScreen(this.otp, this.user_id, {Key? key}) : super(key: key);

  @override
  State<ForgotPasswordVerifyOTPScreen> createState() => _ForgotPasswordVerifyOTPScreenState();
}

class _ForgotPasswordVerifyOTPScreenState extends State<ForgotPasswordVerifyOTPScreen> {
  final AuthController _authController = Get.put(AuthController());

  var selectedValue = 'Cars';

  final _otpTextField = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _otpTextField.text = widget.otp;
  }

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
                            child: Text('Enter OTP',
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
                                'A Verification code has been sent to\n(+91XXXXXXXXXXX)',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey)),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, left: 15),
                          child: CommonWidgets.commonText(
                              mText: 'OTP',
                              mSize: 14.0,
                              mFontWeight: FontWeight.w600),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          child: TextFormField(
                              controller: _otpTextField,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              maxLength: 4,
                              style: TextStyle(color: Colors.black),
                              obscureText: false,
                              decoration: InputDecorE().editBoxBorderGrey(
                                  context,
                                  Icons.phone_android,
                                  'XXXX',
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
                                      if (_otpTextField.text.isEmpty) {
                                        Get.snackbar(
                                            'Alert', 'Please Enter OTP',
                                            backgroundColor: Colors.white);
                                      } else if (_otpTextField.text.length <
                                          4) {
                                        Get.snackbar(
                                            'Alert', 'Please Enter Valid OTP',
                                            backgroundColor: Colors.white);
                                      } else {
                                        var data = {
                                          "user_id": widget.user_id,
                                          "otp": _otpTextField.text.toString(),
                                        };
                                        _authController
                                            .forgotPasswordOTPVerify(
                                                data, callback);
                                      }
                                    },
                                    icon: const Icon(Icons.login),
                                    label: Text('Verify'),
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
                              'Didn\'t receive the code?',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: ThemeManager.darkLineColor),
                            ),
                            GestureDetector(
                              onTap: () {
                                /*  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen()));*/
                              },
                              child: Text(
                                '  Resend (30s)',
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
      ToastUtils.setToast(data['message']);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => PasswordUpdateScreen(data['data']['user_id'])),
          (Route<dynamic> route) => false);
    } else {
      ToastUtils.setToast(data['message']);
    }
  }
}
