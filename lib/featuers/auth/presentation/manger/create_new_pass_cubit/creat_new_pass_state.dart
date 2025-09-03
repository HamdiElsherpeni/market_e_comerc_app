part of 'creat_new_pass_cubit.dart';

@immutable
sealed class CreatNewPassState {}

final class CreatNewPassInitial extends CreatNewPassState {}

final class CreatNewPassLoadingl extends CreatNewPassState {}

final class CreatNewPassISucess extends CreatNewPassState {
  final CreateNewPassResponse createNewPassResponse;

  CreatNewPassISucess(this.createNewPassResponse);
}

final class CreatNewPassFalier extends CreatNewPassState {
  final String errorMassge;

  CreatNewPassFalier(this.errorMassge);
}
