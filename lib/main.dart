import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_auth/bloc_observer.dart';
import 'package:simple_auth/core/app.dart';
import 'package:simple_auth/core/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //* dependency injection
  await initAppModule();

  // * transparent status bar
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light));

  //! Decrepted
  // BlocOverrides.runZoned(
  //   () => runApp(const MyApp()),
  //   blocObserver: MyBlocObserver(),
  // );

  //* bloc observer
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}
