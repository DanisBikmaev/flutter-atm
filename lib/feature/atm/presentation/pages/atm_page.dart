import 'package:atm/feature/atm/bloc/atm_bloc.dart';
import 'package:atm/feature/atm/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class AtmPage extends StatelessWidget {
  AtmPage({super.key});
  final resultAreaKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset('assets/images/atm_logo.svg', width: 69),
        flexibleSpace: const CustomGradient(),
      ),
      bottomNavigationBar: const BottomBar(),
      body: SingleChildScrollView(
        child: BlocConsumer<AtmBloc, AtmState>(
          builder: (context, state) {
            if (state is AtmInitialState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CashFormCard(action: (value) {
                    context.read<AtmBloc>().add((AtmCalculate(value: value)));
                  }),
                  SizedBox(key: resultAreaKey),
                  if (state is AtmSuccessState)
                    BanknoteListCard(
                      cardTitle: 'Банкомат выдал следующие купюры',
                      cashList: state.aviableBanknotes,
                    )
                  else if (state is AtmErrorState)
                    const ErrorCard(),
                  BanknoteListCard(
                    cardTitle: 'Баланс банкомата',
                    cashList: state.balance,
                  ),
                ],
              );
            }
            return const SizedBox();
          },
          listener: (BuildContext context, AtmState state) {
            if (state is AtmSuccessState || state is AtmErrorState) {
              final scrollTarget = resultAreaKey.currentContext;
              if (scrollTarget != null) {
                Scrollable.ensureVisible(
                  scrollTarget,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              }
            }
          },
        ),
      ),
    );
  }
}
