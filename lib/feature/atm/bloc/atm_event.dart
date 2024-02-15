part of 'atm_bloc.dart';

@immutable
sealed class AtmEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class AtmStarted extends AtmEvent {}

final class AtmCalculate extends AtmEvent {
  AtmCalculate({required this.value});

  final int value;

  @override
  List<Object?> get props => [];
}
