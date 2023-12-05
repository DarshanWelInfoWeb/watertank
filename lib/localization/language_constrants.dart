import 'package:flutter/material.dart';
import 'package:water_tank_clean_service/localization/app_localization.dart';

String?  getTranslated(String key, BuildContext context) {
  return AppLocalization.of(context)?.translate(key);
}