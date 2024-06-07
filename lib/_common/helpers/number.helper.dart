import 'dart:io';

import 'package:intl/intl.dart';

class NumberHelper {
  static String formatPrice(int price) {
    final locale = Platform.localeName;
    return NumberFormat.decimalPattern(locale).format(price);
  }
}
