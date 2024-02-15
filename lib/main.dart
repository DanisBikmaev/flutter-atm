import 'package:atm/app.dart';
import 'package:atm/data/cash_data.dart';
import 'package:atm/domain/atm/repositories/atm_repository.dart';
import 'package:atm/domain/atm/services/atm_service.dart';
import 'package:atm/feature/atm/bloc/atm_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  final repository = AtmRepository(cashData);
  final service = AtmService(repository);
  runApp(
    App(
      atmBloc: AtmBloc(repository, service),
    ),
  );
}
