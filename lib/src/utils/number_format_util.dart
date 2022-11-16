import 'package:intl/intl.dart';

class NumberFormatUtil {
  static String integer(num number) {
    return NumberFormat("#,###").format(number);
  }

  static String currency(num number) {
    return NumberFormat("#,###.##").format(number);
  }
}
