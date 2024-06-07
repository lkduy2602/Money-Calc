import 'dart:io';

import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class TimeHelper {
  static String now() {
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
  }

  static Future<String> convertDateToDeviceRegion(String date) async {
    final dateTime = DateTime.parse(date);

    final locale = Platform.localeName;
    await initializeDateFormatting(locale);

    return DateFormat.yMd(locale).add_Hm().format(dateTime);
  }
}
