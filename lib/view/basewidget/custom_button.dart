import 'package:flutter/material.dart';

import '../../../utill/color_resources.dart';
import '../../../utill/dimensions.dart';
import '../../../utill/styles.dart';

class CustomButton extends StatelessWidget {
  final Widget onTap;
  final String buttonText;
  CustomButton({required this.onTap, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.symmetric(horizontal: 70, vertical: Dimensions.PADDING_SIZE_SMALL),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: LinearGradient(
              end: Alignment.bottomLeft,
              colors: [
                ColorResources.gradient_top,
                ColorResources.gradient_bottom,
              ])),
      child: TextButton(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => onTap)),
        child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: Text(buttonText,
              style: montserratSemiBold.copyWith(fontWeight: FontWeight.w600,color: Colors.white, fontSize: Dimensions.FONT_SIZE_16)),
        ),
      ),
    );
  }
}

class CustomButtonFuction extends StatelessWidget {
  final Function onTap;
  final String buttonText;
  CustomButtonFuction({required this.onTap, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.symmetric(horizontal: 70, vertical: Dimensions.PADDING_SIZE_SMALL),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
              end: Alignment.bottomLeft,
              colors: [
                ColorResources.gradient_top,
                ColorResources.gradient_bottom,
              ])),
      child: TextButton(
        onPressed: () =>onTap(),
        child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: Text(buttonText,
              style: montserratSemiBold.copyWith(fontWeight: FontWeight.w600,color: Colors.white, fontSize: Dimensions.FONT_SIZE_16)),
        ),
      ),
    );
  }
}


class TitleButton extends StatelessWidget {
  final String? image;
  final String? title;
  final Widget navigateTo;
  TitleButton({@required this.image, @required this.title, required this.navigateTo});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset("$image", width: 25, height: 25, fit: BoxFit.fill, color: ColorResources.getHomeBg(context)),
      title: Text("$title", style: montserratRegular.copyWith(fontSize: Dimensions.FONT_SIZE_17)),
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => navigateTo),),
    );
  }
}