import 'package:atm/feature/atm/bloc/atm_bloc.dart';
import 'package:atm/feature/atm/presentation/pages/atm_page.dart';
import 'package:atm/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key, required this.atmBloc});

  final AtmBloc atmBloc;

  @override
  Widget build(BuildContext context) {
    final CustomTheme theme = CustomTheme();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ATM',
      theme: theme.getTheme(),
      home: BlocProvider<AtmBloc>(
        create: (context) => atmBloc..add(AtmStarted()),
        child: AtmPage(),
      ),
    );
  }
}
