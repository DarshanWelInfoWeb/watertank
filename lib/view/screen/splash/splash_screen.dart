import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:water_tank_clean_service/helper/database.dart';
import 'package:water_tank_clean_service/helper/preferenceutils.dart';
import 'package:water_tank_clean_service/provider/splash_provider.dart';
import 'package:water_tank_clean_service/utill/app_constants.dart';
import 'package:water_tank_clean_service/utill/color_resources.dart';
import 'package:water_tank_clean_service/utill/images.dart';
import 'package:water_tank_clean_service/utill/styles.dart';
import 'package:water_tank_clean_service/view/basewidget/no_internet_screen.dart';
import 'package:water_tank_clean_service/view/screen/auth/login_screen.dart';
import 'package:water_tank_clean_service/view/screen/dashboard/dashboard_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late StreamSubscription<ConnectivityResult> _onConnectivityChanged;
  bool? isNotConnected=true;
  QuotationDb quotationDb = QuotationDb();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    quotationDb.deleteAll();
    AppConstants.closeKeyboard();
    _onConnectivityChanged = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      bool isNotConnected = result != ConnectivityResult.wifi && result != ConnectivityResult.mobile;
      print(isNotConnected);
      isNotConnected ? SizedBox() : ScaffoldMessenger.of(context).hideCurrentSnackBar();
      if(!isNotConnected) {
        _route();
      }else{
        showDialog<bool>(
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                content: const Text("Internet Is Not Connected Please Connect To The Internet...."),
                actions: [
                  TextButton(
                    onPressed: () {
                      SystemNavigator.pop();
                    },
                    child: Text('Ok',style: montserratRegular.copyWith(color: ColorResources.BLACK),),
                  ),
                ],
              );
            },context: context);
      }
    });
  }

  @override
    void dispose() {
      // TODO: implement dispose
      super.dispose();
      _onConnectivityChanged;
    }

  void _route() {
    Provider.of<SplashProvider>(context, listen: false).initSharedPrefData();
    Timer(const Duration(seconds: 2), () {
      if (PreferenceUtils.getlogin(AppConstants.isLoggedIn) == true) {
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => Dashboard()));
      } else {
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => Login()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    AppConstants.screenSize = MediaQuery.of(context).size;
    AppConstants.itemHeight = AppConstants.screenSize.height;
    AppConstants.itemWidth = AppConstants.screenSize.width;

    return Scaffold(
      body: Provider.of<SplashProvider>(context).hasConnection
          ?
      Container(
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(Images.logo),scale: 0.8)
        ),
        child: Container(margin: EdgeInsets.only(top: AppConstants.itemHeight*0.90),child: Text("Version 1.0.0.1",style: montserratSemiBold.copyWith(fontSize: 16))),
      )
          :
      NoInternetOrDataScreen(isNoInternet: true, child: SplashScreen()),
    );
  }
}
