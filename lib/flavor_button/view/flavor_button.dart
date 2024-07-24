import 'package:financial_dashboard/flavor_button/flavor_button.dart';
import 'package:financial_dashboard/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlavorButton extends StatelessWidget {
  const FlavorButton({required this.flavor, super.key});

  final AppFlavor flavor;

  @override
  Widget build(BuildContext context) {
    final currentFlavor = context.watch<FlavorCubit>().state;

    final outlinedIcon = switch (flavor) {
      AppFlavor.one => Icons.looks_one_outlined,
      AppFlavor.two => Icons.looks_two_outlined,
      AppFlavor.three => Icons.looks_3_outlined,
    };

    final solidIcon = switch (flavor) {
      AppFlavor.one => Icons.looks_one,
      AppFlavor.two => Icons.looks_two,
      AppFlavor.three => Icons.looks_3,
    };

    final icon = currentFlavor == flavor ? solidIcon : outlinedIcon;

    return Align(
      child: InkWell(
        onTap: () => context.read<FlavorCubit>().select(flavor),
        customBorder: const CircleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.sm),
          child: Icon(icon),
        ),
      ),
    );
  }
}
