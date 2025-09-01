part of 'sin_in_cubit.dart';

@immutable
sealed class SinInState {}

final class SinInInitial extends SinInState {}

final class SinInILiading extends SinInState {}

final class SinInSucsess extends SinInState {
  final SignInResponse signInResponse;

  SinInSucsess({required this.signInResponse});
}

final class SinInFailer extends SinInState {
  final String errorMassge;

  SinInFailer({required this.errorMassge});
}
