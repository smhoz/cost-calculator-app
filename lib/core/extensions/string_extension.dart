extension AsFixedExtension on String {
  String get doubleAsFixed => double.parse(this).toStringAsFixed(2);
  String get doubleAsFixedPercentage => (double.parse(this) * 100).toStringAsFixed(2);
}
