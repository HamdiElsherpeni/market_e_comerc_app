import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:market_e_comerc_app/featuers/cart/data/models/delet_product_model/delet_respons.dart';

import '../../../data/repos/cart_repo.dart';

part 'delet_proudcut_cubit_state.dart';

class DeletProudcutCubitCubit extends Cubit<DeletProudcutCubitState> {
  final CartRepo cartRepo;

  DeletProudcutCubitCubit(this.cartRepo) : super(DeletProudcutCubitInitial());
  Future<void> deletProduct({required String productId}) async {
    emit(DeletProudcutCubitLoading());
    var result = await cartRepo.futureDeletProduct(productId: productId);
    result.fold(
      (failer) {
        emit(DeletProudcutCubitFailer(failer.errorMassge));
      },
      (sucsess) {
        emit(DeletProudcutCubitSucsess(sucsess));
      },
    );
  }
}
