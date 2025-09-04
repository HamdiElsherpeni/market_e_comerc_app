part of 'delet_proudcut_cubit_cubit.dart';

sealed class DeletProudcutCubitState extends Equatable {
  const DeletProudcutCubitState();

  @override
  List<Object> get props => [];
}

final class DeletProudcutCubitInitial extends DeletProudcutCubitState {}

final class DeletProudcutCubitFailer extends DeletProudcutCubitState {
  final String errorMassge;

  const DeletProudcutCubitFailer(this.errorMassge);
}

final class DeletProudcutCubitLoading extends DeletProudcutCubitState {}

final class DeletProudcutCubitSucsess extends DeletProudcutCubitState {
  final DeletRespons deletRespons;

  const DeletProudcutCubitSucsess(this.deletRespons);
}
