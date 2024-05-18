import 'package:flutter/material.dart';

import '../utils/figma_dimension_converter.dart';

extension ResponsiveDimensionX on num? {
  /// Converts the given height to responsive height
  double toH(BuildContext context) {
    return this?.toDouble() ?? 0.0;
    return FigmaDimensionConverter.responsiveHeight(this, context);
  }

  /// Converts the given width to responsive width
  double toW(BuildContext context) {
    return this?.toDouble() ?? 0.0;

    return FigmaDimensionConverter.responsiveWidth(this, context);
  }

  /// Converts the given font size to responsive font size
  double toFs(BuildContext context) {
    return this?.toDouble() ?? 0.0;
    return FigmaDimensionConverter.responsiveFontSize(this, context);
  }
}
