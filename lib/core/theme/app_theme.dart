import 'package:flutter/material.dart';
import 'package:remainder_flutter/core/theme/app_colors.dart';
import 'package:remainder_flutter/core/theme/app_text_size.dart';

class AppTheme {
  static List<BoxShadow> shadow = [
    BoxShadow(
      color: AppColor.borderColor,
      blurRadius: 5,
      spreadRadius: 3,
      offset: const Offset(0, 3),
    ),
  ];

  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColor.primaryColor,
    scaffoldBackgroundColor: AppColor.scaffoldBackgroundColor,
    cardColor: AppColor.cardColor,
    dividerColor: AppColor.borderColor,
    iconTheme: IconThemeData(
        color: AppColor.iconColor, size: 25, opacity: 1, grade: 10),
    textTheme: TextTheme(
      bodySmall: TextStyle(
        color: AppColor.primaryTextColor,
        fontSize: AppTextSize.bodySmall,
      ),
      bodyMedium: TextStyle(
          color: AppColor.primaryColor, fontSize: AppTextSize.bodyMedium),
      bodyLarge: TextStyle(
        color: AppColor.primaryColor,
        fontSize: AppTextSize.bodyLarge,
      ),
      titleSmall: TextStyle(
          color: AppColor.primaryTextColor,
          fontSize: AppTextSize.titleSmall,
          fontWeight: FontWeight.w400),
      titleMedium: TextStyle(
          color: AppColor.primaryTextColor,
          fontSize: AppTextSize.titleMedium,
          fontWeight: FontWeight.w400),
      titleLarge: TextStyle(
          color: AppColor.primaryTextColor,
          fontSize: AppTextSize.titleLarge,
          fontWeight: FontWeight.w500),
    ),
  );
}
