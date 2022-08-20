part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoginSuccessState extends AuthState {

}

class AuthLoginLoadingState extends AuthState {}

class AuthLoginErrorState extends AuthState {
  final String msg;

  const AuthLoginErrorState(this.msg);
}
class AuthLoginPasswordToggleState extends AuthState {
  final bool isSecured;

  const AuthLoginPasswordToggleState(this.isSecured);
  @override
  List<Object> get props => [isSecured];
}


