part of 'indicator_mode.dart';

extension IndicatorModeX on IndicatorMode {
  IconData get icon {
    switch (this) {
      case IndicatorMode.down:
        return CupertinoIcons.arrow_down_left;
      case IndicatorMode.up:
        return CupertinoIcons.arrow_up_right;
      case IndicatorMode.stable:
        return CupertinoIcons.arrow_left_right;
    }
  }

  Color get color {
    switch (this) {
      case IndicatorMode.down:
        return AppColors.red;
      case IndicatorMode.up:
        return AppColors.green;
      case IndicatorMode.stable:
        return AppColors.title;
    }
  }
}
