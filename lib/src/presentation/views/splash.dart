import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:simple_auth/core/app_prefs.dart';
import 'package:simple_auth/core/di.dart';
import 'package:simple_auth/src/presentation/busines_logic/home/home_cubit.dart';
import 'package:simple_auth/src/presentation/resources/color_manager.dart';
import 'package:simple_auth/src/presentation/resources/font_manager.dart';
import 'package:simple_auth/src/presentation/resources/routes_manager.dart';
import 'package:simple_auth/src/presentation/resources/style_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late Timer _timer;
  final AppPreferences appPreferences = instance<AppPreferences>();
  
  _startDelay() {
    _timer = Timer(const Duration(seconds: 1), _goNext);
  }
  _goNext() async {
    await appPreferences.getToken().then((token) {
      bool isAuthenticated = (token != null && token.isNotEmpty);
      if (isAuthenticated) {
        Navigator.of(context).pushReplacementNamed(Routes.homeRoute);
      } else {
        Navigator.of(context).pushReplacementNamed(Routes.loginRoute);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.darkBackground,
        body: Center(
          child: Text('Mahmood\nMakhloof',
              textAlign: TextAlign.center,
              style: getBoldStyle(
                  color: ColorManager.white, fontSize: FontSizeManager.s40)),
        ));
  }
}
