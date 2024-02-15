import 'package:atm/domain/atm/models/banknotes_model.dart';
import 'package:atm/domain/atm/repositories/atm_repository.dart';

class AtmService {
  const AtmService(this._atmRepository);

  final AtmRepository _atmRepository;

  List<BanknotesModel> doTransaction(int value) {
    var amount = value;
    final List<BanknotesModel> banknotesCollection = [];

    final List<BanknotesModel> availableBankCash =
        _atmRepository.balance.where((e) => e.count > 0).toList();

    if (_transactionCanBeConfirm(amount, availableBankCash)) {
      for (var cash in availableBankCash.reversed) {
        if (cash.banknote <= amount && cash.count > 0) {
          int count = amount ~/ cash.banknote;
          if (count >= cash.count) {
            count = cash.count;
          }
          _collectIssuedCash(banknotesCollection, cash.banknote, count);
          _updateBankBalance(cash.banknote, banknotesCollection.last.count);
          amount -= cash.banknote * banknotesCollection.last.count;
        }
      }
      if (amount != 0) return [];
    }

    banknotesCollection.sort((a, b) => a.banknote.compareTo(b.banknote));
    return banknotesCollection;
  }

  bool _transactionCanBeConfirm(
    int amount,
    List<BanknotesModel> availableBanknotes,
  ) {
    if (amount <= 0) return false;
    // checking for banknotes in a bank
    if (availableBanknotes.isEmpty) return false;

    final int bankBalance = availableBanknotes
        .map((e) => e.count * e.banknote)
        .reduce((a, b) => a + b);

    // checking whether the entered amount is available in the bank
    if (bankBalance < amount) return false;

    // checking whether the entered amount can be divided into banknotes
    bool dividedFlag = false;
    for (var el in availableBanknotes) {
      if (amount % el.banknote == 0) {
        dividedFlag = true;
        break;
      }
    }

    if (!dividedFlag) return false;

    return true;
  }

  void _collectIssuedCash(
      List<BanknotesModel> collection, int banknote, int count) {
    collection.add(
      BanknotesModel(
        banknote: banknote,
        count: count,
      ),
    );
  }

  void _updateBankBalance(int banknote, int count) {
    _atmRepository.balance
        .where((element) => element.banknote == banknote)
        .first
        .count -= count;
  }
}
