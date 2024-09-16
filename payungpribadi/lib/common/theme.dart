import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color kPrimaryColor = Color(0xffefc444);
const Color kWhitePrimaryColor = Color(0xffFFFFFF);
const Color kCharcoalGrayColor = Color(0xff323232);
const Color kRedColor = Color(0xffCA6E64);
const Color kGrayAvatar = Color(0xff8794a8);
const Color kLightGray = Color(0xffe5eaee);
const Color kTransparent = Colors.transparent;

TextStyle mainTextStyle = GoogleFonts.poppins(
  color: kCharcoalGrayColor,
);

TextStyle homeTitleTileTextStyle = GoogleFonts.poppins(
  color: kCharcoalGrayColor,
  fontWeight: extraBold,
  fontSize: 21,
);

TextStyle logoTextStyle = GoogleFonts.poppins(
  color: kWhitePrimaryColor,
  fontSize: 33,
  fontWeight: bold,
);

const FontWeight light = FontWeight.w300;
const FontWeight regular = FontWeight.w400;
const FontWeight medium = FontWeight.w500;
const FontWeight semiBold = FontWeight.w600;
const FontWeight bold = FontWeight.w700;
const FontWeight extraBold = FontWeight.w800;
const FontWeight black = FontWeight.w900;
