//

import 'package:flutter/material.dart';

class AppTheme {
  // Private Constructor
  AppTheme._();
  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.white,
      appBarTheme: const AppBarTheme(
        color: Colors.teal,
        iconTheme: IconThemeData(color: AppColors.primaryDark),
      ),
      textTheme: const TextTheme(
        bodyText2: TextStyle(
          color: Colors.black,
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
        color: AppColors.primaryDark,
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
      cardTheme: const CardTheme(color: AppColors.primaryDark)

      // ... more

      );
}

class AppColors {
  static const primaryDark = Color(0xFF000F24);

  static const white = Color(0xFFFFFFFF);

  static const filledColor = Color(0xFFF2F4F7);

  static const borders = Color(0xFFA9B8D4);
}
