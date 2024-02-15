import 'package:atm/feature/atm/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    return Card(
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Wave(
            waveType: WaveType.bottom,
            waveHeight: orientation == Orientation.portrait ? 105 : 15,
          ),
        ));
  }
}
