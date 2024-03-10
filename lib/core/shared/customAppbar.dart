import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

AppBar customAppbar({required String title, required double fz}) {
  return AppBar(
    centerTitle: true,
    backgroundColor: AppColors.backgroundColor,
    title: Text(
      title,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: fz),
    ),
  );
}
