part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class GetProblemsLoadingState extends HomeState {}

class GetProblemsSuccessState extends HomeState {
  final MyDataResponse data;

  const GetProblemsSuccessState(this.data);
  @override
  List<Object> get props => [data];
}

class GetProblemsErrorState extends HomeState {
  final String msg;

  const GetProblemsErrorState(this.msg);
  @override
  List<Object> get props => [msg];
}
