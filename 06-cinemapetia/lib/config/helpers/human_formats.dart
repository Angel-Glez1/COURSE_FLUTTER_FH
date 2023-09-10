

import 'package:intl/intl.dart';

class HumanFortmans {

  static String number(double number) {
    final formatterNumber = NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: '',
      locale: 'en-US'
    ).format(number);
    return formatterNumber;
  }
}