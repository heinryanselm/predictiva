extension StringExtension on String? {
  String get trimmed => this?.trim() ?? '';
  String get orNone => this ?? '';

  bool get isStartingWithCapital {
    if (this == null || this!.isEmpty) {
      return false;
    }
    return this![0].toUpperCase() == this![0];
  }
}
