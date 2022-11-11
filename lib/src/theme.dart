//

import 'package:flutter/material.dart';

class AppTheme {
  // Private Constructor
  AppTheme._();
  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.white,
      appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            color: AppColors.graywarm,
          ),
          backgroundColor: AppColors.white,
          iconTheme: IconThemeData(color: AppColors.primaryDark),
          toolbarTextStyle: TextStyle(color: AppColors.primaryDark)),
      textTheme: const TextTheme(
        bodyText2: TextStyle(
          color: AppColors.graywarm,
        ),
        bodyText1: TextStyle(
          color: Colors.white,
        ),
      ),
      bottomSheetTheme:
          const BottomSheetThemeData(backgroundColor: AppColors.white)
      // ... more
      );

  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.primaryDark,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primaryDark,
        //color: AppColors.white,
        iconTheme: IconThemeData(
          color: AppColors.white,
        ),
      ),
      textTheme: const TextTheme(
        bodyText2: TextStyle(
          color: Colors.white,
        ),
        bodyText1: TextStyle(
          color: Colors.white,
        ),
      ),
      bottomSheetTheme:
          const BottomSheetThemeData(backgroundColor: AppColors.primaryDark),
      cardTheme: const CardTheme(color: AppColors.primaryDark),
      expansionTileTheme:
          const ExpansionTileThemeData(backgroundColor: AppColors.primaryDark)

      // ... more

      );
}

class AppColors {
  static const primaryDark = Color(0xFF000F24);

  static const white = Color(0xFFFFFFFF);

  static const filledColor = Color(0xFFF2F4F7);

  static const borders = Color(0xFFA9B8D4);

  static const subTextColor = Color(0xFF98A2B3);

  static const gray = Color(0xFFEAECF0);

  static const graywarm = Color(0xFF1C1917);
}
