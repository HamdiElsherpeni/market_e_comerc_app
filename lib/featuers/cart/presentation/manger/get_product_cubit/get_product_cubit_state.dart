part of 'get_product_cubit_cubit.dart';

sealed class GetProductCubitState extends Equatable {
  const GetProductCubitState();

  @override
  List<Object> get props => [];
}

final class GetProductCubitInitial extends GetProductCubitState {}

final class GetProductCubitFailer extends GetProductCubitState {
  final String errorMassge;

  const GetProductCubitFailer(this.errorMassge);
}

final class GetProductCubitLoading extends GetProductCubitState {}

final class GetProductCubitSucess extends GetProductCubitState {
  final List<GetCartResponse> getProducts;

  const GetProductCubitSucess(this.getProducts);
}
