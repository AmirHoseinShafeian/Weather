import 'package:flutter/material.dart';
import 'package:weather_app/configs/color_palette.dart';
import 'package:weather_app/configs/gen/fonts.gen.dart';

ThemeData myTheme() {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorPalette.primary,
    ),
    useMaterial3: true,
    scaffoldBackgroundColor: ColorPalette.background,
    fontFamily: FontFamily.estedad,
    appBarTheme: const AppBarTheme(backgroundColor: ColorPalette.background),
    dropdownMenuTheme: DropdownMenuThemeData(
      inputDecorationTheme: InputDecorationTheme(
          isDense: true,
          labelStyle: const TextStyle(
              letterSpacing: 0,
              wordSpacing: 1,
              color: ColorPalette.fontColor1,
              fontFamily: FontFamily.estedad),
          hintStyle: TextStyle(
              letterSpacing: 0,
              wordSpacing: 1,
              fontSize: 14,
              fontFamily: FontFamily.estedad,
              color: ColorPalette.secondry),
          focusedBorder: _border(),
          border: _border(),
          enabledBorder: _border(),
          errorBorder: _border(),
          disabledBorder: _border(),
          focusedErrorBorder: _border(),
          errorStyle: const TextStyle(fontSize: 10, height: .5),
          contentPadding: const EdgeInsets.fromLTRB(10, 16, 10, 16)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            textStyle: const WidgetStatePropertyAll(TextStyle(
                color: ColorPalette.background,
                fontFamily: FontFamily.estedad,
                fontWeight: FontWeight.bold)),
            backgroundColor: WidgetStatePropertyAll(ColorPalette.primary))),
    inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        labelStyle: const TextStyle(
            letterSpacing: 0,
            wordSpacing: 1,
            color: ColorPalette.fontColor1,
            fontFamily: FontFamily.estedad),
        hintStyle: TextStyle(
            letterSpacing: 0,
            wordSpacing: 1,
            fontSize: 14,
            fontFamily: FontFamily.estedad,
            color: Colors.grey.shade400),
        focusedBorder: _border(),
        border: _border(),
        enabledBorder: _border(),
        disabledBorder: _border(),
        focusedErrorBorder: _border(),
        contentPadding: const EdgeInsets.fromLTRB(10, 16, 10, 16)),
  );
}

OutlineInputBorder _border() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: ColorPalette.fontColor1));
}
