import 'package:flutter/material.dart';
import 'package:predictiva/src/core/extensions/context_x.dart';
import 'package:predictiva/src/core/extensions/responsive_x.dart';
import 'package:predictiva/src/core/resources/app_colors.dart';

class AppText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? letterSpacing;
  final double? height;
  final double? wordSpacing;
  final double? decorationThickness;
  final TextDecoration? decoration;

  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool isSelectable;

  const AppText(
    this.text, {
    super.key,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.letterSpacing,
    this.height,
    this.wordSpacing,
    this.decorationThickness,
    this.decoration,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.isSelectable = false,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !isSelectable,
      replacement: SelectableText(
        text,
        style: context.textTheme.bodyMedium?.copyWith(
          color: color ?? AppColors.title,
          fontSize: (fontSize ?? 16).toFs(context),
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
          height: height,
          wordSpacing: wordSpacing,
          decorationThickness: decorationThickness,
          decoration: decoration,
        ),
        textAlign: textAlign,
        maxLines: maxLines,
      ),
      child: Text(
        text,
        style: context.textTheme.bodyMedium?.copyWith(
          color: color ?? AppColors.title,
          fontSize: (fontSize ?? 16).toFs(context),
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
          height: height,
          wordSpacing: wordSpacing,
          decorationThickness: decorationThickness,
          decoration: decoration,
        ),
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines,
      ),
    );
  }

  factory AppText.header(
    String text, {
    double fontSize = 24.0,
    Color? color,
  }) {
    return AppText(
      text,
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  factory AppText.subTitle(String text) {
    return AppText(
      text,
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      color: AppColors.subTitle,
    );
  }
}
