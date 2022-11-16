import 'package:intl/intl.dart';

class DateFormatUtil {
  static String standard(DateTime value) {
    return DateFormat("dd MMM, yyyy").format(value);
  }

  static String standardWithHour(DateTime value) {
    return DateFormat("dd MMM, yyyy hh:mm a").format(value);
  }

  static String full(DateTime value) {
    return DateFormat("E dd MMM, yyyy").format(value);
  }

  static String fullWithHour(DateTime value) {
    return DateFormat("E dd MMM, yyyy hh:mm a").format(value);
  }

  static String compact(DateTime value) {
    return DateFormat("dd/MM/yyyy").format(value);
  }

  static String compactWithHour(DateTime value) {
    return DateFormat("dd/MM/yyyy hh:mm a").format(value);
  }
}
