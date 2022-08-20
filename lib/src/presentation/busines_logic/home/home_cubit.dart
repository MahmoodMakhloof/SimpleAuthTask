import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simple_auth/src/data/repository/problems_repository.dart';

import '../../../data/responses/response.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final ProblemsRepository _problemsRepository;

  HomeCubit(
    this._problemsRepository,
  ) : super(HomeInitial()) {
    getProblems();
  }

  getProblems() async {
    emit(GetProblemsLoadingState());
    (await _problemsRepository.getProblems()).fold((failure) {
      emit(GetProblemsErrorState(failure.message));
    }, (data) {
      emit(GetProblemsSuccessState(data));
    });
  }
}
