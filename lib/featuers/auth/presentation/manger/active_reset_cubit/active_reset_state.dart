part of 'active_reset_cubit.dart';

@immutable
sealed class ActiveResetState {}

final class ActiveResetInitial extends ActiveResetState {}

final class ActiveResetLoading extends ActiveResetState {}

final class ActiveResetSucess extends ActiveResetState {
  final ActiveResetModelResponse activeResetModelResponse;

  ActiveResetSucess(this.activeResetModelResponse);
}

final class ActiveResetFalier extends ActiveResetState {
  final String errorMassge;

  ActiveResetFalier(this.errorMassge);
}
