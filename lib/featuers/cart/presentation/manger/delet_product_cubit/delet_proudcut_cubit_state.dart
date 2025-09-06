part of 'delet_proudcut_cubit_cubit.dart';

sealed class DeletProudcutCubitState extends Equatable {
  const DeletProudcutCubitState();

  @override
  List<Object> get props => [];
}

final class DeletProudcutCubitInitial extends DeletProudcutCubitState {}

final class DeletProudcutCubitFailer extends DeletProudcutCubitState {
  final String errorMassge;
  final String productId;

  const DeletProudcutCubitFailer(this.errorMassge, this.productId);
}

final class DeletProudcutCubitLoading extends DeletProudcutCubitState {
  final String productId;

 const DeletProudcutCubitLoading(this.productId);
}

final class DeletProudcutCubitSucsess extends DeletProudcutCubitState {
  final DeletRespons deletRespons;
  final String productId;

  const DeletProudcutCubitSucsess(this.deletRespons, this.productId);
}
