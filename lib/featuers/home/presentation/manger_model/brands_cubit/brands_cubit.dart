import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:market_e_comerc_app/featuers/home/data/models/prands_model/brands.model.dart';
import 'package:market_e_comerc_app/featuers/home/data/repos/brands_repo/brands_repo.dart';

part 'brands_state.dart';

class BrandsCubit extends Cubit<BrandsState> {
  final BrandsRepo brandsRepo;
  BrandsCubit(this.brandsRepo) : super(BrandsInitial());
  Future<void> getBrands() async {
    emit(BrandsLoading());
    var result = await brandsRepo.futureGetBrands();
    result.fold(
      (failer) {
        emit(BrandsFailer(failer.errorMassge));
      },
      (brands) {
        emit(BrandsSucesss(brands));
      },
    );
  }
}
