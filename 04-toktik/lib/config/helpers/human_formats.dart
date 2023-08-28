import 'package:intl/intl.dart';

class HumanFormats {
  static String humanReableNumber(double number) {
    final formatterNumber = NumberFormat.currency(
      decimalDigits: 0,
      symbol: '',
    ).format(number);
    return formatterNumber;
  }
}
