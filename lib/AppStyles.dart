import 'package:flutter/material.dart';
import 'package:trytulu/AppColors.dart';

class AppStyles {
  static const appbar_title = TextStyle(
    fontFamily: 'Montserrat',
    color: AppColors.black,
    fontSize: 20,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
  );

  static const card_view_body = TextStyle(
    fontFamily: 'Montserrat',
    color: AppColors.gray,
    fontSize: 14,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
  );

  static const checklist_item_title = TextStyle(
    fontFamily: 'Montserrat',
    color: AppColors.main,
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
  );
}
