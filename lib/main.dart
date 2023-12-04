import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:watertankclening/provider/auth_provider.dart';
import 'package:watertankclening/provider/otp_provider.dart';
import 'package:watertankclening/provider/theme_provider.dart';
import 'package:watertankclening/theme/dark_theme.dart';
import 'package:watertankclening/theme/light_theme.dart';
import 'package:watertankclening/utill/app_constants.dart';
import 'package:watertankclening/utill/color_resources.dart';
import 'di_container.dart' as di;
import 'provider/splash_provider.dart';
import 'view/screen/splash/splash_screen.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => di.sl<SplashProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<ThemeProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<OTPProvider>()),
      ChangeNotifierProvider(create: (context) => di.sl<AuthProvider>()),
    ],
    child: MyApp(),
  ));
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static final navigatorKey = new GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: ColorResources.LINE_BG,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark
    ));
    return MaterialApp(
      title: AppConstants.APP_NAME,
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).darkTheme ? dark : light,
      home: SplashScreen(),
    );
  }
}
