import 'package:atm/shared/utils/currency_formatter.dart';
import 'package:atm/theme/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CashTextField extends StatefulWidget {
  const CashTextField({
    super.key,
    required this.onSubmitted,
    required this.controller,
  });

  final void Function(String)? onSubmitted;
  final TextEditingController controller;

  @override
  State<CashTextField> createState() => _CashTextFieldState();
}

class _CashTextFieldState extends State<CashTextField> {
  double _sizedBoxWidth = 200;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Введите сумму',
          style: TextStyle(fontSize: 15, color: ThemeColors.white),
        ),
        SizedBox(
          width: _sizedBoxWidth,
          child: TextField(
            controller: widget.controller,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: <TextInputFormatter>[
              MoneyInputFormatter(),
              // FilteringTextInputFormatter.digitsOnly
            ],
            decoration: InputDecoration(
              hintText: '0',
              suffixText: 'руб',
              hintStyle: const TextStyle(color: ThemeColors.gray),
              suffixStyle: _textFieldStyle,
            ),
            textAlign: TextAlign.start,
            style: _textFieldStyle,
            onSubmitted: widget.onSubmitted,
            onChanged: (text) {
              setState(() {
                _sizedBoxWidth = text.isEmpty || text.length <= 8 ? 200 : 300;
              });
            },
          ),
        ),
      ],
    );
  }
}

TextStyle _textFieldStyle = const TextStyle(
  color: ThemeColors.white,
  fontSize: 30,
  fontWeight: FontWeight.w500,
);
