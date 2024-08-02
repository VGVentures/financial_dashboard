import 'package:financial_dashboard/demo/demo.dart';
import 'package:financial_dashboard/financial_data/financial_data.dart';
import 'package:financial_dashboard/flavor_button/flavor_button.dart';
import 'package:financial_dashboard/l10n/l10n.dart';
import 'package:financial_dashboard/theme_button/theme_button.dart';
import 'package:financial_dashboard/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeModeCubit()),
        BlocProvider(create: (_) => FlavorCubit()),
        BlocProvider(
          create: (_) =>
              FinancialDataBloc()..add(const FinancialDataRequested()),
        ),
      ],
      child: const DemoView(),
    );
  }
}

class DemoView extends StatelessWidget {
  const DemoView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appBarTitleText),
        actions: const [
          ThemeButton(),
          SizedBox(width: AppSpacing.sm),
          FlavorButton(flavor: AppFlavor.one),
          FlavorButton(flavor: AppFlavor.two),
          FlavorButton(flavor: AppFlavor.three),
        ],
      ),
      body: BlocBuilder<FlavorCubit, AppFlavor>(
        builder: (context, state) {
          return switch (state) {
            AppFlavor.one => DeviceFrame(
                lightTheme: const FlavorOneTheme().themeData,
                darkTheme: const FlavorOneDarkTheme().themeData,
                child: const AppOne(),
              ),
            AppFlavor.two => DeviceFrame(
                lightTheme: const FlavorTwoTheme().themeData,
                darkTheme: const FlavorTwoDarkTheme().themeData,
                child: const AppTwo(),
              ),
            AppFlavor.three => DeviceFrame(
                lightTheme: const FlavorThreeTheme().themeData,
                darkTheme: const FlavorThreeDarkTheme().themeData,
                child: const AppThree(),
              ),
          };
        },
      ),
    );
  }
}
