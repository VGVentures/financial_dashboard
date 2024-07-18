import 'package:financial_dashboard/demo/demo.dart';
import 'package:financial_dashboard/l10n/l10n.dart';
import 'package:financial_dashboard/theme_button/theme_button.dart';
import 'package:financial_dashboard/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeModeCubit(),
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
        actions: const [ThemeButton()],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xlg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Wrap(
                spacing: AppSpacing.xlg,
                runSpacing: AppSpacing.xlg,
                alignment: WrapAlignment.center,
                children: [
                  DeviceFrame(
                    lightTheme: const FlavorOneTheme().themeData,
                    darkTheme: const FlavorOneDarkTheme().themeData,
                    child: const AppOne(),
                  ),
                  DeviceFrame(
                    lightTheme: const FlavorTwoTheme().themeData,
                    darkTheme: const FlavorTwoDarkTheme().themeData,
                    child: const AppTwo(),
                  ),
                  DeviceFrame(
                    lightTheme: const FlavorThreeTheme().themeData,
                    darkTheme: const FlavorThreeDarkTheme().themeData,
                    child: const AppThree(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
