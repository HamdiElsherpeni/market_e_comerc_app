import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:market_e_comerc_app/featuers/home/data/models/populer_model/populer_product.dart';
import 'package:market_e_comerc_app/featuers/home/data/repos/populer_repo/populer_repo.dart';

part 'populer_product_state.dart';

class PopulerProductCubit extends Cubit<PopulerProductState> {
  final PopulerRepo populerRepo;
  PopulerProductCubit(this.populerRepo) : super(PopulerProductInitial());
  Future<void> getPopulerProducts() async {
    emit(PopulerProductLoading());
    var result = await populerRepo.futurePopuler();
    result.fold(
      (failer) {
        emit(PopulerProductFailer(failer.errorMassge));
      },
      (products) {
        emit(PopulerProducSucsess(products));
      },
    );
  }
}
