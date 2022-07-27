import 'package:intl/intl.dart';

extension DoubleExtension on double {
  String convertToNumberFormat() {
    var f = NumberFormat("###,###,###,###", "ja_JP");
    return f.format(this);
  }
}
