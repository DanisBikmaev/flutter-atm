import 'package:flutter/material.dart';

class CashButton extends StatelessWidget {
  final Function() onPressed;
  const CashButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      child: const Padding(
        padding: EdgeInsets.only(top: 19, bottom: 22, left: 42, right: 42),
        child: Text(
          'Выдать сумму',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
