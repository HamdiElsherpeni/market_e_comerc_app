import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:market_e_comerc_app/featuers/cart/data/models/get_cart/get_cart_response.dart';

import '../../../data/repos/cart_repo.dart';

part 'get_product_cubit_state.dart';

class GetProductCubitCubit extends Cubit<GetProductCubitState> {
  final CartRepo cartRepo;

  GetProductCubitCubit(this.cartRepo) : super(GetProductCubitInitial());
  Future<void> GetProduct({required String productId}) async {
    emit(GetProductCubitLoading());
    var result = await cartRepo.futureGetCartProduct();
    result.fold(
      (failer) {
        emit(GetProductCubitFailer(failer.errorMassge));
      },
      (sucsess) {
        emit(GetProductCubitSucess(sucsess));
      },
    );
  }
}
