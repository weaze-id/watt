import 'package:intl/intl.dart';

class NumberUtil {
  static String integer(num number) {
    return NumberFormat("#,###").format(number);
  }

  static String currency(num number) {
    return NumberFormat("#,###.##").format(number);
  }
}
