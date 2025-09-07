import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:market_e_comerc_app/featuers/favorite/data/models/add_favi/add_favi_response.dart';
import 'package:market_e_comerc_app/featuers/favorite/data/repos/favi_repo.dart';

part 'add_favi_state.dart';

class AddFaviCubit extends Cubit<AddFaviState> {
  final FaviRepo faviRepo;
  AddFaviCubit(this.faviRepo) : super(AddFaviInitial());
  Future<void> addFaviProduct({required String productId}) async {
    emit(AddFaviLoading(productId));
    var result = await faviRepo.futureAddProduct(productId: productId);
    result.fold(
      (failer) {
        emit(AddFaviFailer(failer.errorMassge,productId));
      },
      (sucsess) {
        emit(AddFaviSucess(sucsess, productId));
      },
    );
  }
}
