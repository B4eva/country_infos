//

import 'package:flutter/material.dart';

class AppTheme {
  // Private Constructor
  AppTheme._();
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: const AppBarTheme(
      color: Colors.teal,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    textTheme: const TextTheme(
      bodyText2: TextStyle(
        color: Colors.black,
      ),
    ),
    // ... more
  );

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.primaryDark,
    appBarTheme: const AppBarTheme(
      color: Colors.black,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    textTheme: const TextTheme(
      bodyText2: TextStyle(
        color: Colors.white,
      ),
    ),
    // ... more
  );
}

class AppColors {
  static const primaryDark = Color(0xFF000F24);

  static const white = Color(0xFFFFFFFF);
}
