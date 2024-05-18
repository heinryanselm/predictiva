import 'dart:developer';
import 'dart:math' hide log;

import 'package:flutter/material.dart';
import 'package:predictiva/src/app/app_sizes.dart';
import 'package:predictiva/src/core/extensions/context_x.dart';

class FigmaDimensionConverter {
  FigmaDimensionConverter._();

  static final double _figmaDesignHeight = AppSizes.screenSize.height;
  static final double _figmaDesignWidth = AppSizes.screenSize.width;

  static double responsiveHeight(num? originalHeight, BuildContext context) {
    if (originalHeight == null) {
      return 0;
    }
    double screenHeight = context.height;
    double heightPercentage = originalHeight / _figmaDesignHeight;
    log('height. $originalHeight -> ${screenHeight * heightPercentage}');
    return screenHeight * heightPercentage;
  }

  static double responsiveWidth(num? originalWidth, BuildContext context) {
    if (originalWidth == null) {
      return 0;
    }
    double screenWidth = MediaQuery.of(context).size.width;
    double widthPercentage = originalWidth / _figmaDesignWidth;
    log('width. $originalWidth -> ${screenWidth * widthPercentage}');
    return screenWidth * widthPercentage;
  }

  static double responsiveFontSize(
      num? originalFontSize, BuildContext context) {
    if (originalFontSize == null) {
      return 0;
    }
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double designWidth = _figmaDesignWidth;
    double designHeight = _figmaDesignHeight;

    double widthRatio = screenWidth / designWidth;
    double heightRatio = screenHeight / designHeight;

    double geometricMean = sqrt(widthRatio * heightRatio);
    log('fontSize from $originalFontSize to -> ${originalFontSize * geometricMean}');
    return originalFontSize * geometricMean;
  }
}
