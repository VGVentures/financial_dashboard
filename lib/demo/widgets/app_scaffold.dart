import 'dart:ui';

import 'package:financial_dashboard/l10n/l10n.dart';
import 'package:financial_dashboard/ui/ui.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    required this.predictionChart,
    required this.transactions,
    this.onRefresh,
    super.key,
    this.goalStats,
    this.leading = const Icon(Icons.menu_rounded),
    this.showTitleInAppBar = false,
    this.extendBodyBehindAppBar = false,
    this.titlePadding = EdgeInsets.zero,
  });

  final Future<void> Function()? onRefresh;
  final Widget predictionChart;
  final Widget transactions;
  final Widget? goalStats;
  final Widget leading;
  final bool showTitleInAppBar;
  final bool extendBodyBehindAppBar;
  final EdgeInsets titlePadding;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    final title = Text(l10n.deviceFrameAppBarTitle);

    return Scaffold(
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      appBar: AppBar(
        leading: leading,
        centerTitle: true,
        title: showTitleInAppBar ? title : null,
        titleTextStyle: textTheme.titleMedium,
      ),
      backgroundColor: colorScheme.onPrimary,
      body: RefreshIndicator(
        onRefresh: onRefresh ??
            () async => Future<void>.delayed(const Duration(seconds: 1)),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
            dragDevices: {
              PointerDeviceKind.touch,
              PointerDeviceKind.mouse,
            },
          ),
          child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: 1,
            primary: true,
            itemBuilder: (context, index) {
              return Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: Padding(
                    padding: extendBodyBehindAppBar
                        ? EdgeInsets.only(
                            top: AppBar().preferredSize.height + AppSpacing.lg,
                            bottom: AppSpacing.lg,
                          )
                        : const EdgeInsets.all(AppSpacing.lg),
                    child: Column(
                      children: [
                        if (!showTitleInAppBar) ...[
                          DefaultTextStyle(
                            style: textTheme.displayMedium!,
                            child: Padding(
                              padding: titlePadding,
                              child: title,
                            ),
                          ),
                          const SizedBox(height: AppSpacing.lg),
                        ],
                        predictionChart,
                        if (goalStats != null) ...[
                          const SizedBox(height: AppSpacing.lg),
                          goalStats!,
                          const SizedBox(height: AppSpacing.lg),
                        ],
                        transactions,
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
