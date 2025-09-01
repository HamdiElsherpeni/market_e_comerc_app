part of 'sin_up_cubit.dart';

@immutable
sealed class SinUpState {}

final class SinUpInitial extends SinUpState {}

final class SinUpILoading extends SinUpState {}

final class SinUpISucsess extends SinUpState {
  final SinUPResponse massge;

  SinUpISucsess({required this.massge});
}

final class SinUpIFailer extends SinUpState {
  final String errorMassge;

  SinUpIFailer({required this.errorMassge});
}
