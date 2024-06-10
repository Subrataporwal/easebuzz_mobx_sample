import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_easebuzz/core/color_palette.dart';
import 'package:flutter_easebuzz/core/loading_animation.dart';
import 'package:flutter_easebuzz/core/spacing.dart';

class AppTheme {
  static const Color primaryColor = Color(0xff1878f3);
  static const String fontName = "Rubik";
  static const EdgeInsets scaffoldPadding = EdgeInsets.fromLTRB(24, 24, 24, 0);
  static const double buttonRadius = 14;
  static BorderRadius containerRadius = BorderRadius.circular(14);

  static ColorScheme colorScheme(Brightness brightness) => ColorScheme.fromSeed(
        brightness: brightness,
        seedColor: primaryColor,
        primary: primaryColor,
        onPrimary: Colors.white,
      );

  static Widget loadingIndicator({Color? loadingColor}) => LoadingAnimation(
        animationType: "horizontalRotatingDots",
        loadingColor: loadingColor ?? primaryColor,
        loadingSize: 50,
      );
  // * LIGHT THEME ***********************
  static final ThemeData light = ThemeData(
      useMaterial3: true,
      // * Color Scheme -----------------------------
      colorScheme: colorScheme(Brightness.light),
      // * SCAFOLD -----------------------------
      scaffoldBackgroundColor: ColorPalette.white400,
      fontFamily: GoogleFonts.getFont(fontName).fontFamily,
      appBarTheme: const AppBarTheme(
        backgroundColor: ColorPalette.white300,
        elevation: 0,
      ),
      // * ELEVEATED Button -----------------------------
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: primaryColor,
          elevation: 0,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(buttonRadius))),
          minimumSize: const Size(
            double.minPositive,
            56,
          ),
          // maximumSize: const Size(double.infinity, 56),
          textStyle: const TextStyle(
            fontSize: 16,
            color: ColorPalette.white500,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          // foregroundColor: Colors.white,
          // backgroundColor: primaryColor,
          elevation: 0,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(buttonRadius))),
          minimumSize: const Size(
            double.minPositive,
            56,
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            color: ColorPalette.white500,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          // foregroundColor: Colors.white,
          // backgroundColor: primaryColor,
          elevation: 0,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(buttonRadius))),
          minimumSize: const Size(
            double.minPositive,
            56,
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            color: ColorPalette.white500,
          ),
        ),
      ),
      // * TEXT Button -----------------------------
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(buttonRadius))),
          minimumSize: const Size(
            double.minPositive,
            56,
          ),
          foregroundColor: primaryColor,
        ),
      ),

      // * TEXT INPUT DECORATION -----------------------------
      inputDecorationTheme: InputDecorationTheme(
        prefixIconColor: ColorPalette.black500,
        suffixIconColor: ColorPalette.black500,
        isDense: true,
        filled: true,
        alignLabelWithHint: true,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        fillColor: ColorPalette.white500,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(buttonRadius),
            borderSide: BorderSide.none),
        focusColor: primaryColor,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(buttonRadius),
          borderSide: const BorderSide(
            color: primaryColor,
            width: 1.5,
            strokeAlign: BorderSide.strokeAlignInside,
          ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        errorStyle: const TextStyle(
          color: ColorPalette.error500,
          fontWeight: FontWeight.w700,
          fontSize: 10,
        ),
        labelStyle: const TextStyle(
          fontSize: 14,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(buttonRadius),
          borderSide: const BorderSide(
              color: ColorPalette.error500,
              width: 1.5,
              strokeAlign: BorderSide.strokeAlignInside),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(buttonRadius),
          borderSide: const BorderSide(
              color: ColorPalette.error500,
              width: 1.5,
              strokeAlign: BorderSide.strokeAlignInside),
        ),
      ),
      // * DIVIDER -----------------------------
      dividerColor: ColorPalette.black400,
      // * DATE PICKER -----------------------------
      datePickerTheme: DatePickerThemeData(
        headerBackgroundColor: ColorPalette.white300,
        backgroundColor: ColorPalette.white400,
        surfaceTintColor: ColorPalette.white400,
        shape: RoundedRectangleBorder(
          borderRadius: containerRadius,
        ),
      ),
      // * Modal -----------------------
      bottomSheetTheme:
          const BottomSheetThemeData(surfaceTintColor: Colors.transparent));

  // * DARK THEME ***********************
  static final ThemeData dark = ThemeData(
    useMaterial3: true,
    // * Color Scheme -----------------------------
    colorScheme: colorScheme(Brightness.dark),
    // * SCAFOLD  -----------------------------
    scaffoldBackgroundColor: ColorPalette.black400,
    fontFamily: GoogleFonts.getFont(fontName).fontFamily,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorPalette.black300,
      elevation: 0,
    ),
    // * ELEVEATEDBTN -----------------------------
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: primaryColor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(buttonRadius))),
        minimumSize: const Size(
          double.minPositive,
          56,
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          color: ColorPalette.white500,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        // foregroundColor: Colors.white,
        // backgroundColor: primaryColor,
        elevation: 0,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(buttonRadius))),
        minimumSize: const Size(
          double.minPositive,
          56,
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          color: ColorPalette.white500,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        // foregroundColor: Colors.white,
        // backgroundColor: primaryColor,
        elevation: 0,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(buttonRadius))),
        minimumSize: const Size(
          double.minPositive,
          56,
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          color: ColorPalette.white500,
        ),
      ),
    ),

    // * TEXTBTN -----------------------------
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(buttonRadius))),
        minimumSize: const Size(
          double.minPositive,
          56,
        ),
        foregroundColor: primaryColor,
      ),
    ),

    // * TEXT INPUT DECORATION -----------------------------
    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: ColorPalette.white500,
      suffixIconColor: ColorPalette.white500,
      isDense: true,
      filled: true,
      alignLabelWithHint: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      fillColor: ColorPalette.black500,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(buttonRadius),
          borderSide: BorderSide.none),
      focusColor: primaryColor,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(buttonRadius),
        borderSide: const BorderSide(
          color: primaryColor,
          width: 1.5,
          strokeAlign: BorderSide.strokeAlignInside,
        ),
      ),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      errorStyle: const TextStyle(
        color: ColorPalette.error500,
        fontWeight: FontWeight.w700,
        fontSize: 10,
      ),
      labelStyle: const TextStyle(
        fontSize: 14,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(buttonRadius),
        borderSide: const BorderSide(
            color: ColorPalette.error500,
            width: 1.5,
            strokeAlign: BorderSide.strokeAlignInside),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(buttonRadius),
        borderSide: const BorderSide(
            color: ColorPalette.error500,
            width: 1.5,
            strokeAlign: BorderSide.strokeAlignInside),
      ),
    ),
    // * DIVIDER -----------------------------
    dividerColor: ColorPalette.white400,
    // * DATE PICKER -----------------------------
    datePickerTheme: DatePickerThemeData(
      headerBackgroundColor: ColorPalette.black300,
      backgroundColor: ColorPalette.black400,
      surfaceTintColor: ColorPalette.black400,
      shape: RoundedRectangleBorder(
        borderRadius: containerRadius,
      ),
    ),
    // * Modal -----------------------
    bottomSheetTheme:
        const BottomSheetThemeData(surfaceTintColor: Colors.transparent),
  );
}

Widget textFieldWithHeading({
  required String heading,
  required String hintText,
  IconData? icon,
  required TextInputType keyboardType,
  required Function(String) onChanged,
  TextEditingController? controller,
  required Function(String?) validator,
  Widget? suffix,
  String? suffixText,
  int? maxLines,
  int? maxwordHint,
  int? maxLength,
  bool obscureText = false,
  bool readOnly = false,
  bool showDivider = true,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        heading,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
      ),
      Spacing.h8px,
      TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        obscureText: obscureText,
        readOnly: readOnly,
        maxLines: maxLines,
        maxLength: maxLength,
        validator: (v) => validator(v),
        decoration: InputDecoration(
          prefixIcon: icon != null ? Icon(icon) : null,
          hintText: hintText,
          suffixIcon: suffix,
          suffixText: suffixText,
        ),
        onChanged: (value) => onChanged(value),
      ),
      Spacing.h12px,
    ],
  );
}
