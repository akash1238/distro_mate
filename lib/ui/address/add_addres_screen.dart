
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import '../../../provider/provider/theme_provider.dart';
import '../../../utils/helper/validation_utils.dart';
import '../../../utils/localization/language_constrants.dart';
import '../../login/login_screen.dart';
import '../../utils/helper/common_widgets.dart';
import '../../utils/helper/theme_manager.dart';
import '../../utils/toast_util.dart';
import '../../widgets/input_decor.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({Key? key}) : super(key: key);

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
//  final AuthController _authController = Get.put(AuthController());

  var selectedValue = 'Cars';

  final _firstNameTextField = TextEditingController();
  final _lastNameTextField = TextEditingController();
  final _abnTextField = TextEditingController();
  final _companyNameTextField = TextEditingController();
  final _mobileTextField = TextEditingController();
  final _emailTextField = TextEditingController();
  final _vehicleFleetTextField = TextEditingController();
  final _driverFleetTextField = TextEditingController();

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
                    ? size.height * 0.08
                    : size.height * 0.08,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).viewInsets.bottom == 0
                  ? size.height * 0.02
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
                            padding: const EdgeInsets.only(left: 15.0, top: 15,bottom: 5),
                            child: Text('Add Address',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black)),
                          ),
                        ),

                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 5, left: 15),
                          child: CommonWidgets.commonText(
                              mText: 'Office/Building Name*',
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

                              style: Theme.of(context).textTheme.bodyText1,
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
                          padding: const EdgeInsets.only(
                              top: 5, left: 15),
                          child: CommonWidgets.commonText(
                              mText: 'Floor',
                              mSize: 14.0,
                              mFontWeight: FontWeight.w600),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          child: TextFormField(
                              controller: _firstNameTextField,
                              keyboardType: TextInputType.text,
                              // validator: (input) => validateEmail(input!, context).toString() == "" ? null : validateEmail(input, context),

                              style: Theme.of(context).textTheme.bodyText1,
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
                          padding: const EdgeInsets.only(
                              top: 5, left: 15),
                          child: CommonWidgets.commonText(
                              mText: 'Landmark',
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
                              style: Theme.of(context).textTheme.bodyText1,
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
                          padding: const EdgeInsets.only(
                              top: 5, left: 15),
                          child: CommonWidgets.commonText(
                              mText: 'Receiver Name',
                              mSize: 14.0,
                              mFontWeight: FontWeight.w600),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          child: TextFormField(
                              controller: _lastNameTextField,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              // validator: (input) => validateEmail(input!, context).toString() == "" ? null : validateEmail(input, context),

                              style: Theme.of(context).textTheme.bodyText1,
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
                          padding: const EdgeInsets.only(
                              top: 5, left: 15),
                          child: CommonWidgets.commonText(
                              mText: 'Receiver Phone No.',
                              mSize: 14.0,
                              mFontWeight: FontWeight.w600),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          child: TextFormField(
                              controller: _lastNameTextField,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.done,
                              // validator: (input) => validateEmail(input!, context).toString() == "" ? null : validateEmail(input, context),

                              style: Theme.of(context).textTheme.bodyText1,
                              decoration: InputDecorE().editBoxBorderGrey(
                                  context,
                                  Icons.groups,
                                  '',
                                  Provider.of<DarkThemeProvider>(context)
                                      .darkTheme
                                      ? true
                                      : false)),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            width: double.infinity,
                            child: ElevatedButton.icon(
                                style: ThemeManager.primaryButtonStyle(
                                    context, 10, 10),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.login),
                                label:
                                    Text('Submit'),
                          ),
                        )),
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

  void _onSignInClick() {
    if (_firstNameTextField.text.isEmpty) {
      ToastUtils.setToast("Please enter First Name");
    } else if (_lastNameTextField.text.isEmpty) {
      ToastUtils.setToast("Please enter Last Name");
    } else if (_companyNameTextField.text.toString().isEmpty) {
      ToastUtils.setToast("Please enter Company Name");
    } else if (_abnTextField.text.toString().isEmpty) {
      ToastUtils.setToast("Please enter ABN/ACN");
    } else if (_emailTextField.text.toString().isEmpty) {
      ToastUtils.setToast("Please enter email");
    } else if (!ValidationUtils.isValidEmail(_emailTextField.text.toString())) {
      ToastUtils.setToast("Please enter valid email");
    } else if (_mobileTextField.text.isEmpty) {
      ToastUtils.setToast("Please enter mobile number");
    } else if (_mobileTextField.text.length < 10) {
      ToastUtils.setToast("Please enter valid mobile number");
    }/* else if (selectedValue.isEmpty) {
      ToastUtils.setToast("Please select vehicle type");
    } */else if (_vehicleFleetTextField.text.isEmpty) {
      ToastUtils.setToast("Please enter vehicle fleet");
    } else if (_driverFleetTextField.text.isEmpty) {
      ToastUtils.setToast("Please enter driver fleet");
    }  else {
      var body = {
        "username" : _emailTextField.text.toString(),
        "first_name" : _firstNameTextField.text.toString(),
        "last_name": _lastNameTextField.text.toString(),
        "phone": _mobileTextField.text.toString(),
        "dob" : "2010-11-3",
        "company" : _companyNameTextField.text.toString(),
        "abn" :_abnTextField.text.toString(),
        "vehicles" : _vehicleFleetTextField.text.toString(),
        "drivers" : _driverFleetTextField.text.toString(),
        "fleetType" : selectedValue};
     // _authController.registration(body, callback);
    }
  }

  callback(bool status,Map data) async{
    if (status == true) {
      ToastUtils.setToast(data['message']);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) =>
              const LoginScreen()),
              (Route<dynamic> route) => false);
    }else{
      ToastUtils.setToast(data['message']);
    }
  }
}
