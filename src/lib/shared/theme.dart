import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double defaultMargin = 24.0;
double defaultRadius = 17.0;

// DAFTAR WARNA YANG DIPAKAI
Color kBlackColor = Color.fromARGB(255, 0, 0, 0); // warna hitam
Color kWhiteColor = Color(0xffFFFFFF); // warna putih
Color kGreyColor = Color(0xff999999); // warna abu-abu
Color kGreenColor = Color(0xff83CAC1); // warna button ijo & page subcourse ijo
Color kRedColor = Color(0xffEB70A5); // warna snackbar error
Color kTransparentColor = Colors.transparent; // warna transparan kalo butuh
Color kPinkColor =
    Color(0xffEEA899); // warna button yg pink & warna page subcourse pink
Color kLightBrown = Color(0xffF5D3B4); // warna appbar bagian atas
Color kBrownColor = Color(0xffCE7D6B); // warna font judul page di appbar
Color kLightYellowColor = Color(
    0xffFEF3E7); // warna container content di homepage, notification, hotline
Color kDarkBrownColor = Color(0xff573926); // warna font di container content
Color kOrangeColor = Color(0xffFE8235); // warna font di container content
Color kDarkGreyColor = Color(0xff707070); // warna font di quote content
Color kPurpleColor = Color(0xff6979F8); // warna font di halaman settings
Color kBlueColor = Color(0xff4691BB); // warna font di halaman settings

// TEXT STYLE FONT SESUAI WARNANYA
TextStyle blackTextStyle = GoogleFonts.poppins(color: kBlackColor);
TextStyle whiteTextStyle = GoogleFonts.poppins(color: kWhiteColor);
TextStyle greyTextStyle = GoogleFonts.poppins(color: kGreyColor);
TextStyle redTextStyle = GoogleFonts.poppins(color: kRedColor);
TextStyle greenTextStyle = GoogleFonts.poppins(color: kGreenColor);
TextStyle brownTextStyle = GoogleFonts.poppins(color: kBrownColor);
TextStyle darkBrownTextStyle = GoogleFonts.poppins(color: kDarkBrownColor);
TextStyle orangeTextStyle = GoogleFonts.poppins(color: kOrangeColor);
TextStyle darkGreyTextStyle = GoogleFonts.poppins(color: kDarkGreyColor);
TextStyle purpleTextStyle = GoogleFonts.poppins(color: kPurpleColor);
TextStyle blueTextStyle = GoogleFonts.poppins(color: kBlueColor);

// SUBCOURSE TEXT STYLE
TextStyle courseStyleTitle = GoogleFonts.comfortaa(color: kWhiteColor);
TextStyle courseStyleBlack = GoogleFonts.comfortaa(color: kBlackColor);
TextStyle courseStyleGrey = GoogleFonts.comfortaa(color: kGreyColor);
TextStyle courseStylePurple = GoogleFonts.comfortaa(color: kPurpleColor);

// FONT WEIGHT
FontWeight light = FontWeight.w300;
FontWeight reguler = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;
