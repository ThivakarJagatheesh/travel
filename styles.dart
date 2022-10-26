import 'package:flutter/material.dart';

class CommonStyles {
  CommonStyles({required this.context});

  BuildContext context;

  // Text
  TextStyle nameText() {
    return TextStyle(
        color: Colors.black,
        fontSize: 16,
        letterSpacing: 0.2,
        fontFamily: "",
        fontWeight: FontWeight.w400);
  }

  TextStyle getHeaderText() {
    return TextStyle(
        color: Colors.black,
        fontSize: 28,
        fontFamily: "",
        fontWeight: FontWeight.w600);
  }

  TextStyle getBodyText() {
    return TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontFamily: "",
        fontWeight: FontWeight.w600);
  }

  TextStyle getLabelText() {
    return TextStyle(
        color: Colors.black54,
        fontSize: 12,
        fontFamily: "",
        fontWeight: FontWeight.normal);
  }

  TextStyle getLabelSmallText() {
    return TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontFamily: "",
        fontWeight: FontWeight.w600);
  }

  TextStyle getBlackNormalText() {
    return TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontFamily: "",
        fontWeight: FontWeight.w400);
  }
    TextStyle getPriceText() {
    return TextStyle(
        color: Colors.redAccent,
        fontSize: 16,
        fontFamily: "",
        fontWeight: FontWeight.normal);
  }
   TextStyle getImageText(double size,FontWeight? fontWeight) {
    return TextStyle(
        color: Colors.white,
        fontSize: size,
        fontFamily: "",
        fontWeight:fontWeight);
  }
}
