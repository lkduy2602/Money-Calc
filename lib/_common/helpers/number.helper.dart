import 'package:intl/intl.dart';

class NumberHelper {
  static String formatPrice(int price) {
    return NumberFormat.decimalPattern('vi').format(price);
  }
}
