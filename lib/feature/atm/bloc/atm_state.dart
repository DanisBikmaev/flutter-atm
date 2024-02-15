part of 'atm_bloc.dart';

@immutable
sealed class AtmState extends Equatable {
  const AtmState();

  @override
  List<Object> get props => [];
}

final class AtmInitialState extends AtmState {
  const AtmInitialState(this.balance);

  final List<BanknotesModel> balance;

  @override
  List<Object> get props => [balance];
}

final class AtmSuccessState extends AtmInitialState {
  const AtmSuccessState(super.balance, {required this.aviableBanknotes});

  final List<BanknotesModel> aviableBanknotes;

  @override
  List<Object> get props => super.props..add(aviableBanknotes);
}

final class AtmErrorState extends AtmInitialState {
  const AtmErrorState(super.balance);
}
