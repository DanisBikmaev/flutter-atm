class Deformatter {
  static int toNumber(String formattedValue) {
    String cleanValue = formattedValue.replaceAll(RegExp(r'[^0-9]'), '');
    int numericValue = int.tryParse(cleanValue) ?? 0;
    return numericValue;
  }
}
