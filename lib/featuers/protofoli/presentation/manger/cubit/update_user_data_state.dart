// part of update_user_data_cubit.dart
part of 'update_user_data_cubit.dart';

sealed class UpdateUserDataState extends Equatable {
  const UpdateUserDataState();

  @override
  List<Object?> get props => [];
}

final class UpdateUserDataInitial extends UpdateUserDataState {}

final class UpdateUserDataLoading extends UpdateUserDataState {}

final class UpdateUserDataFailure extends UpdateUserDataState {
  final String errorMessage;

  const UpdateUserDataFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

final class UpdateUserDataSuccess extends UpdateUserDataState {
  final UpdateUserResponse response;

  const UpdateUserDataSuccess(this.response);

  @override
  List<Object?> get props => [response.message.id, response.message.email];
}
