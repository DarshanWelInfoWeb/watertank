import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:water_tank_clean_service/localization/language_constrants.dart';
import 'package:water_tank_clean_service/utill/color_resources.dart';
import 'package:water_tank_clean_service/utill/dimensions.dart';
import 'package:water_tank_clean_service/utill/images.dart';
import 'package:water_tank_clean_service/utill/styles.dart';
import 'package:water_tank_clean_service/view/basewidget/animated_custom_dialog.dart';
import 'package:water_tank_clean_service/view/basewidget/custom_button.dart';
import 'package:water_tank_clean_service/view/screen/setting/widget/language_dialog.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorResources.LINE_BG,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back, color: ColorResources.WHITE),
        ),
        title: Text("${getTranslated('SETTING', context)}",style: montserratSemiBold.copyWith(color: ColorResources.WHITE,fontSize: Dimensions.FONT_SIZE_20),),
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "${getTranslated('COMMON', context)}",
                  style: montserratSemiBold.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: CupertinoColors.inactiveGray,
                  ),
                ),
              ],
            ),
            Divider(
              color: ColorResources.GREY.withOpacity(0.20),
            ),
            ListTile(
              leading: Icon(Icons.language),
              title: Text("${getTranslated('LANGUAGE', context)}"),
              subtitle: Text("English"),
              onTap: () {
                showAnimatedDialog(context, LanguageDialog());
              },
            ),
          ],
        ),
      ),
    );
  }
}
