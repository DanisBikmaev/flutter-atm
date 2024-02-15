import 'dart:math';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

// Money formatter as 1234.56 to 1 234.56 format
class MoneyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Remove all symbols except digits and dot
    String newText = newValue.text.replaceAll(RegExp(r'[^0-9.]'), '');

    // Split int and decimal part
    List<String> parts = newText.split('.');

    // Format int part if it's not empty
    String formattedIntPart = '';
    if (parts[0].isNotEmpty) {
      int intValue = int.parse(parts[0]);
      formattedIntPart = NumberFormat('#,###', 'ru_RU').format(intValue);
    }
    String result = formattedIntPart;

    // Format decimal part if it's not empty
    if (parts.length > 1) {
      String decimalPart = parts.length > 1
          ? parts[1].substring(0, min(2, parts[1].length))
          : '';

      result += '.$decimalPart';
    }

    return TextEditingValue(text: result);
  }
}
