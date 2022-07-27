import 'package:intl/intl.dart';

class DateHelper {
  DateHelper._();

  static bool isValidDate(String input, {String format = 'yyyy/MM/dd', bool isPass = true}) {
    try {
      var now = DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day);
      var dateFormat = DateFormat(format).parseStrict(input);
      if (!isPass) {
        if (dateFormat.compareTo(now) < 0) {
          return false;
        }
      }
      return true;
    } catch (e) {
      return false;
    }
  }
}
