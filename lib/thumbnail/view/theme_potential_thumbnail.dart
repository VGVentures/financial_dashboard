import 'package:financial_dashboard/demo/demo.dart';
import 'package:financial_dashboard/theme_button/theme_button.dart';
import 'package:financial_dashboard/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemePotentialThumbnail extends StatelessWidget {
  const ThemePotentialThumbnail({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeModeCubit(),
      child: const AppFlavorView(),
    );
  }
}

class AppFlavorView extends StatefulWidget {
  const AppFlavorView({
    super.key,
    AnimationController? animationController,
  }) : _animationController = animationController;

  final AnimationController? _animationController;

  @override
  State<AppFlavorView> createState() => _AppFlavorViewState();
}

class _AppFlavorViewState extends State<AppFlavorView>
    with SingleTickerProviderStateMixin {
  late final ScrollController _scrollController;
  late final AnimationController _controller;

  var _index = 0;

  Animation<double> get _animation => Tween<double>(
        begin: 0,
        end: _scrollController.position.maxScrollExtent,
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.2, 0.8),
        ),
      );

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _controller = widget._animationController ??
        AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 3500),
        );

    _controller
      ..forward()
      ..addListener(() {
        switch (_controller.status) {
          case AnimationStatus.forward:
          case AnimationStatus.reverse:
            _scrollController.jumpTo(_animation.value);
          case AnimationStatus.completed:
            context.read<ThemeModeCubit>().toggle();
            _controller.reverse();
          case AnimationStatus.dismissed:
            setState(() {
              if (_index == 0) {
                _index = 1;
              } else if (_index == 1) {
                _index = 2;
              } else {
                _index = 0;
              }
            });

            _controller.forward();
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: SingleChildScrollView(
        controller: _scrollController,
        child: IndexedStack(
          index: _index,
          children: [
            _AppView(
              lightTheme: const FlavorOneTheme().themeData,
              darkTheme: const FlavorOneDarkTheme().themeData,
              child: const AppOne(),
            ),
            _AppView(
              lightTheme: const FlavorTwoTheme().themeData,
              darkTheme: const FlavorTwoDarkTheme().themeData,
              child: const AppTwo(),
            ),
            _AppView(
              lightTheme: const FlavorThreeTheme().themeData,
              darkTheme: const FlavorThreeDarkTheme().themeData,
              child: const AppThree(),
            ),
          ],
        ),
      ),
    );
  }
}

class _AppView extends StatelessWidget {
  const _AppView({
    required this.lightTheme,
    required this.darkTheme,
    required this.child,
  });

  final ThemeData lightTheme;
  final ThemeData darkTheme;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DeviceFrame(
      lightTheme: lightTheme,
      darkTheme: darkTheme,
      borderRadius: 0,
      elevation: 0,
      child: child,
    );
  }
}
