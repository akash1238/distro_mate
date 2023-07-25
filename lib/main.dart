import 'package:distro_mate/provider/provider/theme_provider.dart';
import 'package:distro_mate/store_binding.dart';
import 'package:distro_mate/ui/splash_screen.dart';
import 'package:distro_mate/utils/constants/app_constants.dart';
import 'package:distro_mate/utils/helper/shared_preferences.dart';
import 'package:distro_mate/utils/helper/theme_manager.dart';
import 'package:distro_mate/utils/localization/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controllers/GetxNetworkManager.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  WidgetsFlutterBinding.ensureInitialized();
  runApp(DistroMate());
}

Locale? globalLocale;

class DistroMate extends StatefulWidget {
  DistroMate({Key? key}) : super(key: key);
  final GetXNetworkManager _networkManager = Get.put(GetXNetworkManager());

  @override
  State<DistroMate> createState() => _DistroMateState();
}

class _DistroMateState extends State<DistroMate> {
  @override
  void initState() {
    super.initState();
    _loadCurrentLanguage();
    init();
  }

  Future<void> init() async {
    await Prefs.init();
  }

  _loadCurrentLanguage() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      globalLocale = Locale(
          sharedPreferences.getString(LanguageConstants.languageCode) ??
              LanguageConstants.languages[0].languageCode!,
          sharedPreferences.getString(LanguageConstants.countryCode) ??
              LanguageConstants.languages[0].countryCode);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Locale> _locals = [];
    for (var language in LanguageConstants.languages) {
      _locals.add(Locale(language.languageCode!, language.countryCode));
    }
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DarkThemeProvider()),
      ],
      child: Builder(builder: (context) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeManager.lightTheme,
          darkTheme: ThemeManager.darkTheme,
          initialBinding: StoreBinding(),
          themeMode: Provider.of<DarkThemeProvider>(context).darkTheme
              ? ThemeMode.dark
              : ThemeMode.light,
          locale: globalLocale,
          localizationsDelegates: const [
            AppLocalization.delegate,
          ],
          supportedLocales: _locals,
          home: const SplashScreen(),
        );
      }),
    );
  }
}
