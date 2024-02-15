import 'package:atm/domain/atm/models/banknotes_model.dart';

class AtmRepository {
  final List<BanknotesModel> _balance;

  AtmRepository(this._balance) {
    _balance.sort((a, b) => a.banknote.compareTo(b.banknote));
  }

  List<BanknotesModel> get balance => _balance;
}
