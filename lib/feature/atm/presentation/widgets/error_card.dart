import 'package:atm/theme/theme_colors.dart';
import 'package:flutter/material.dart';

class ErrorCard extends StatelessWidget {
  const ErrorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 60, vertical: 40),
        child: Text(
          'Банкомат не может выдать запрашиваемую сумму',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: ThemeColors.accent),
        ),
      ),
    );
  }
}
