import 'package:flutter/material.dart';

import '../../utill/color_resources.dart';
import '../../utill/dimensions.dart';
import '../../utill/images.dart';
import '../../utill/styles.dart';

class NoInternetOrDataScreen extends StatelessWidget {
  final bool isNoInternet;
  final Widget? child;
  NoInternetOrDataScreen({required this.isNoInternet, this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.025),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(isNoInternet ? Images.no_internet : Images.no_data, width: 150, height: 150),
            Text(isNoInternet ? "Opps!" : "Sorry !", style: montserratBold.copyWith(
              fontSize: 30,
              color: isNoInternet ? Theme.of(context).textTheme.bodyText1?.color : ColorResources.getColombiaBlue(context),
            )),
            SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
            Text(
              isNoInternet ? "No Internet Connection" : 'No Data Found',
              textAlign: TextAlign.center,
              style: montserratRegular,
            ),
            SizedBox(height: 40),
            isNoInternet ? Container(
              height: 45,
              margin: EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0.0), color: ColorResources.getYellow(context)),
              child: TextButton(
                onPressed: () async {
                  // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => SplashScreen()));
                },
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text("Retry", style: montserratSemiBold.copyWith(color: Theme.of(context).highlightColor, fontSize: Dimensions.FONT_SIZE_16)),
                ),
              ),
            ) : SizedBox.shrink(),

          ],
        ),
      ),
    );
  }
}

class DataNotFoundScreen extends StatelessWidget {
  String title;
  DataNotFoundScreen(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.025),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Images.no_data, width: 150, height: 150),
            Text("Sorry !", style: montserratBold.copyWith(
              fontSize: 30,
              color: ColorResources.getColombiaBlue(context),
            )),
            SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
            Text(
              title,
              textAlign: TextAlign.center,
              style: montserratRegular,
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class BannerNotFoundScreen extends StatelessWidget {
  String title;
  BannerNotFoundScreen(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.025),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text("Sorry !", style: montserratBold.copyWith(
              fontSize: 30,
              color: ColorResources.getColombiaBlue(context),
            )),
            SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
            Text(
              title,
              textAlign: TextAlign.center,
              style: montserratRegular,
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
