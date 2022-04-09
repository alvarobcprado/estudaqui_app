extension DateTimeFormat on DateTime {
  String toLocalFormatString() {
    final localDay = _twoDigits(day);
    final localMonth = _twoDigits(month);
    final localYear = _fourDigits(year);

    return '$localDay/$localMonth/$localYear';
  }
}

String _twoDigits(int digit) {
  if (digit >= 10) {
    return '$digit';
  }
  return '0$digit';
}

//TODO: update this to verify number of digits
String _fourDigits(int digit) {
  return '$digit';
}
