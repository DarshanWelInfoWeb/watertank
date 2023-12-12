import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_tank_clean_service/localization/language_constrants.dart';
import 'package:water_tank_clean_service/provider/localization_provider.dart';
import 'package:water_tank_clean_service/provider/splash_provider.dart';
import 'package:water_tank_clean_service/utill/app_constants.dart';
import 'package:water_tank_clean_service/utill/color_resources.dart';
import 'package:water_tank_clean_service/utill/dimensions.dart';
import 'package:water_tank_clean_service/utill/styles.dart';

class LanguageDialog extends StatelessWidget {
  const LanguageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    int index;

    index = Provider.of<LocalizationProvider>(context, listen: false).languageIndex!;

    return Dialog(
      backgroundColor: Theme.of(context).highlightColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [

        Padding(
          padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
          child: Text("${getTranslated('choose_language', context)}", style: montserratSemiBold.copyWith(fontSize: Dimensions.FONT_SIZE_17)),
        ),

        SizedBox(height: 150, child: Consumer<SplashProvider>(
          builder: (context, splash, child) {
            List<String> valueList = [];
            for (var language in AppConstants.languages) {
              valueList.add(language.languageName!);
            }
            return CupertinoPicker(
              itemExtent: 40,
              useMagnifier: true,
              magnification: 1.2,
              scrollController: FixedExtentScrollController(initialItem: index),
              onSelectedItemChanged: (int i) {
                index = i;
              },
              children: valueList.map((value) {
                return Center(child: Text(value, style: TextStyle(color: Theme.of(context).textTheme.bodyText1!.color)));
              }).toList(),
            );
          },
        )),

        const Divider(height: Dimensions.PADDING_SIZE_EXTRA_SMALL, color: ColorResources.HINT_TEXT_COLOR),
        Row(children: [
          Expanded(child: TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("${getTranslated('CANCEL', context)}", style: montserratRegular.copyWith(color: ColorResources.getYellow(context))),
          )),
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_EXTRA_SMALL),
            child: VerticalDivider(width: Dimensions.PADDING_SIZE_EXTRA_SMALL, color: Theme.of(context).hintColor),
          ),
          Expanded(child: TextButton(
            onPressed: () {
                Provider.of<LocalizationProvider>(context, listen: false).setLanguage(Locale(
                  AppConstants.languages[index].languageCode!,
                  AppConstants.languages[index].countryCode,
                ));
              Navigator.pop(context);
            },
            child: Text("${getTranslated('OK', context)}", style: montserratRegular.copyWith(color: ColorResources.GREEN)),
          )),
        ]),

      ]),
    );
  }
}