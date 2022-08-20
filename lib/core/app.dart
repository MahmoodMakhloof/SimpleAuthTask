import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_auth/core/di.dart';
import '../src/presentation/busines_logic/auth/auth_cubit.dart';
import '../src/presentation/busines_logic/home/home_cubit.dart';
import '../src/presentation/resources/routes_manager.dart';
import '../src/presentation/resources/theme_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => instance<AuthCubit>(),
        ),
        BlocProvider(
          create: (context) => instance<HomeCubit>(),
        ),
      ],
      child: MaterialApp(
        theme: getApplicationTheme(),
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.splashRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }

 
}
