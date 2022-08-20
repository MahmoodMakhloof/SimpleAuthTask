import 'package:flutter/material.dart';

class ColorManager {
  static Color lightBackground = HexColor.fromHex("#E0E5EA");
  static Color darkBackground = HexColor.fromHex("#18171f");

  static Color primary = HexColor.fromHex("#069AEF");
  static Color darkPrimary = HexColor.fromHex("#069AFF");
  static Color primaryOpacity70 = HexColor.fromHex("#0A069AEF");

  static Color darkGrey = HexColor.fromHex("#525252");
  static Color grey = HexColor.fromHex("#737477");
  static Color lightGrey = HexColor.fromHex("#9E9E9E");

  static Color white = HexColor.fromHex("#FFFFFF");
  static Color black = HexColor.fromHex("#000000");

  static Color green = HexColor.fromHex("#26CE32");
  static Color red = HexColor.fromHex("#CE2626");
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = 'FF$hexColorString'; //8 chars with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
