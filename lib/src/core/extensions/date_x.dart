extension DateX on DateTime? {
  /// It takes a [DateTime] and returns a formatted string.
  /// Ex: 19 Dec 2024
  String get formatted {
    if (this == null) return '';
    return '${this!.day} ${this!.month.monthName}, ${this!.year}';
  }
}

extension IntToMonthName on int {
  String get monthName {
    switch (this) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return 'Unknown';
    }
  }
}
