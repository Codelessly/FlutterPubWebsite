import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'components.dart';

// Step 2: Create reuseable text styles (fonts, text sizes, and colors).

const String fontFamily = 'Google Sans';

// Simple
const TextStyle titleTextStyle = TextStyle(
    fontSize: 36, color: textTitle, height: 1.6, fontFamily: fontFamily);

const TextStyle linkTitleTextStyle = TextStyle(
    fontSize: 20, color: linkTitle, height: 1, fontFamily: fontFamily);

const TextStyle bodyTextStyle = TextStyle(
    fontSize: 14, color: textPrimary, height: 1.5, fontFamily: "Roboto");
