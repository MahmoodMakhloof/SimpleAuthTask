import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/scheduler.dart';
import 'package:simple_auth/core/app_prefs.dart';
import 'package:simple_auth/src/data/repository/auth_repository.dart';

import '../../../../core/di.dart';
import '../home/home_cubit.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;
  final AppPreferences _appPreferences;
 

  AuthCubit(
    this._authRepository,
    this._appPreferences,
    
  ) : super(AuthInitial());

  login(String email, String password) async {
    emit(AuthLoginLoadingState());
    (await _authRepository.login(email, password)).fold((failure) {
      emit(AuthLoginErrorState(failure.message));
    }, (data)  {
      emit(AuthLoginSuccessState());

       // Set Token and user name
       _appPreferences.setToken(data.accessToken!);
       _appPreferences.setUserName(data.user!.username!);
        resetModules();
        
    });
  }

  bool isLoginPasswordSecured = true;

  Future<void> loginPasswordToggleShow() async {
    isLoginPasswordSecured = !isLoginPasswordSecured;
    emit(AuthLoginPasswordToggleState(isLoginPasswordSecured));
  }

  void logout() {
    _appPreferences.clearToken();
    _appPreferences.clearUserName();
    resetModules();
  }
}
