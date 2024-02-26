extension IntegerExtension on int {
  /// Convert integer to [DateTime]
  DateTime toDateTime() => DateTime.fromMillisecondsSinceEpoch(this * 1000);
}
