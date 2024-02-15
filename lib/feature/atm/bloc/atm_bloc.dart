import 'package:atm/domain/atm/models/banknotes_model.dart';
import 'package:atm/domain/atm/repositories/atm_repository.dart';
import 'package:atm/domain/atm/services/atm_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'atm_event.dart';
part 'atm_state.dart';

class AtmBloc extends Bloc<AtmEvent, AtmState> {
  final AtmRepository _atmRepository;
  final AtmService _atmService;

  AtmBloc(this._atmRepository, this._atmService)
      : super(const AtmInitialState([])) {
    on<AtmStarted>(_onStarted);
    on<AtmCalculate>(_calculate);
  }

  void _onStarted(AtmStarted event, Emitter<AtmState> emit) {
    emit(AtmInitialState(_atmRepository.balance));
  }

  void _calculate(AtmCalculate event, Emitter<AtmState> emit) {
    final List<BanknotesModel> issuedBanknotes =
        _atmService.doTransaction(event.value);

    if (event.value == 0 || issuedBanknotes.isEmpty) {
      return emit(AtmErrorState(_atmRepository.balance));
    }

    emit(AtmSuccessState(
      _atmRepository.balance,
      aviableBanknotes: issuedBanknotes,
    ));
  }
}
