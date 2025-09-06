part of 'add_product_cubit_cubit.dart';

sealed class AddProductCubitState extends Equatable {
  const AddProductCubitState();

  @override
  List<Object> get props => [];
}

final class AddProductCubitInitial extends AddProductCubitState {}

final class AddProductCubitLoading extends AddProductCubitState {
  final String productId;

const  AddProductCubitLoading(this.productId);
}

final class AddProductCubitSucsess extends AddProductCubitState {
  final AddToCartResponse addToCartResponse;
  final String productId;

  const AddProductCubitSucsess(this.addToCartResponse, this.productId);
}

final class AddProductCubitFailer extends AddProductCubitState {
  final String errorMassge;
  final String productId;


  const AddProductCubitFailer(this.errorMassge, this.productId);
}
