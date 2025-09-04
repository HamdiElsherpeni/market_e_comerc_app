part of 'brands_cubit.dart';

sealed class BrandsState extends Equatable {
  const BrandsState();

  @override
  List<Object> get props => [];
}

final class BrandsInitial extends BrandsState {}

final class BrandsLoading extends BrandsState {}

final class BrandsSucesss extends BrandsState {
  final List<BrandsModel> brands;

  const BrandsSucesss(this.brands);
}

final class BrandsFailer extends BrandsState {
  final String erorrMassage;

  const BrandsFailer(this.erorrMassage);
}
