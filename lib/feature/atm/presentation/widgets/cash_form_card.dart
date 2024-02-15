import 'package:atm/feature/atm/presentation/widgets/widgets.dart';
import 'package:atm/shared/utils/text_deformatter.dart';
import 'package:flutter/material.dart';

class CashFormCard extends StatefulWidget {
  const CashFormCard({
    super.key,
    required this.action,
  });

  final void Function(int) action;

  @override
  State<CashFormCard> createState() => _CashFormCardState();
}

class _CashFormCardState extends State<CashFormCard> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return Card(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Wave(
                  waveHeight: orientation == Orientation.portrait ? 250 : 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 26),
                  child: CashTextField(
                    controller: _controller,
                    onSubmitted: (value) {
                      widget.action(Deformatter.toNumber(value));
                    },
                  ),
                ),
              ],
            ),
            CashButton(
              onPressed: () {
                widget.action.call(Deformatter.toNumber(_controller.text));
              },
            ),
            const SizedBox(height: 26),
          ],
        ),
      );
    });
  }
}
