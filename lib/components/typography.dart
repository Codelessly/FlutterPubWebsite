import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'components.dart';

//Create reuseable text styles (fonts, text sizes, and colors).

const String fontFamily = 'Google Sans';

// Simple
const TextStyle titleTextStyle = TextStyle(
    fontSize: 36, color: textTitleColor, height: 1.6, fontFamily: fontFamily);

const TextStyle linkTitleTextStyle = TextStyle(
    fontSize: 20, color: linkTitleColor, height: 1.6, fontFamily: fontFamily);

const TextStyle bodyTextStyle = TextStyle(
    fontSize: 14, color: textPrimaryColor, height: 1.5, fontFamily: 'Roboto');

const TextStyle footerLinkTextStyle = TextStyle(
    fontSize: 14,
    color: textWhiteDarkBackgroundColor,
    height: 1.6,
    fontFamily: 'Roboto');
