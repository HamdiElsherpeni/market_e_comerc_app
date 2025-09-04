part of 'populer_product_cubit.dart';

sealed class PopulerProductState extends Equatable {
  const PopulerProductState();

  @override
  List<Object> get props => [];
}

final class PopulerProductInitial extends PopulerProductState {}

final class PopulerProductLoading extends PopulerProductState {}

final class PopulerProducSucsess extends PopulerProductState {
  final List<PopulerModel> prodducts;

  const PopulerProducSucsess(this.prodducts);
}

final class PopulerProductFailer extends PopulerProductState {
  final String erorrMassage;

  const PopulerProductFailer(this.erorrMassage);
}
