part of 'reset_pass_cubit.dart';

@immutable
sealed class ResetPassState {}

final class ResetPassInitial extends ResetPassState {}

final class ResetPassLoading extends ResetPassState {}

final class ResetPassSucsess extends ResetPassState {
  final ResetPassResponse resetPassResponse;

  ResetPassSucsess({required this.resetPassResponse});
}

final class ResetPassFalier extends ResetPassState {
  final String errorMassge;

  ResetPassFalier({required this.errorMassge});
}
