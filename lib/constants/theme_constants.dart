import 'package:flutter/material.dart';

import 'constants.dart';

class ThemeConstants {
  ThemeConstants._();

  static final inputBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: ColorConstants.grey),
    borderRadius: BorderRadius.circular(8.0),
  );

  static ThemeData get(BuildContext context) {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: ColorConstants.white,
        foregroundColor: ColorConstants.primary,
      ),
      primarySwatch: ColorConstants.primaryColorSwatch,
      primaryColor: ColorConstants.primary,
      hintColor: ColorConstants.grey,
      inputDecorationTheme: InputDecorationTheme(
        contentPadding:
        const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        hintStyle: StyleConstants.mediumText.copyWith(
          color: ColorConstants.grey,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
          const BorderSide(color: ColorConstants.primary, width: 1.5),
          borderRadius: BorderRadius.circular(5),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
          const BorderSide(color: ColorConstants.borderGrey, width: 1.5),
          borderRadius: BorderRadius.circular(5),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide:
          const BorderSide(color: ColorConstants.borderGrey, width: 1.5),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 0,
          ),
          onPrimary: ColorConstants.white,
          primary: ColorConstants.primary,
          splashFactory: InkRipple.splashFactory,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
            side: BorderSide(
              color: Colors.transparent,
              width: 1,
            ),
          ),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.all(ColorConstants.white),
        side: const BorderSide(
          color: ColorConstants.primary,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
        ),
        fillColor: MaterialStateProperty.all(ColorConstants.primary),
      ),
    );
  }
}

