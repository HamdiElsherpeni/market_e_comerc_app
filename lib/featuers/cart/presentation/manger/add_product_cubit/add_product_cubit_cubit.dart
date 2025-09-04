import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:market_e_comerc_app/featuers/cart/data/models/add/addprudut_cart_respons.dart';
import 'package:market_e_comerc_app/featuers/cart/data/repos/cart_repo.dart';

part 'add_product_cubit_state.dart';

class AddProductCubitCubit extends Cubit<AddProductCubitState> {
  final CartRepo cartRepo;
  AddProductCubitCubit(this.cartRepo) : super(AddProductCubitInitial());
  Future<void> addProduct({required String productId}) async {
    emit(AddProductCubitLoading());
    var result = await cartRepo.futureAddProduct(productId: productId);
    result.fold(
      (failer) {
        emit(AddProductCubitFailer(failer.errorMassge));
      },
      (sucsess) {
        emit(AddProductCubitSucsess(sucsess, productId));
      },
    );
  }
}
