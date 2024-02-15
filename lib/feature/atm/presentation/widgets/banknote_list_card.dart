import 'package:atm/domain/atm/models/banknotes_model.dart';
import 'package:atm/theme/theme_colors.dart';
import 'package:flutter/material.dart';

class BanknoteListCard extends StatelessWidget {
  final String cardTitle;
  final List<BanknotesModel> cashList;
  const BanknoteListCard({
    super.key,
    required this.cardTitle,
    required this.cashList,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 15, right: 20, left: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cardTitle,
              style: const TextStyle(
                fontSize: 13,
                color: ThemeColors.gray,
              ),
            ),
            const SizedBox(height: 15),
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              childAspectRatio: 10,
              children: List.generate(
                  cashList.length,
                  (index) => Text(
                        '${cashList[index].count} X ${cashList[index].banknote} рублей',
                        style: const TextStyle(
                            fontSize: 14,
                            color: ThemeColors.primary,
                            fontWeight: FontWeight.w500),
                      )),
            )
          ],
        ),
      ),
    );
  }
}
