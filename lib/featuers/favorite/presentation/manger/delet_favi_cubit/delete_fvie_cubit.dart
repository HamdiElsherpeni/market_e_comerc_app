import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:market_e_comerc_app/featuers/favorite/data/models/delet_favi/delet_favi_response.dart';

import '../../../data/repos/favi_repo.dart';

part 'delete_fvie_state.dart';

class DeleteFvieCubit extends Cubit<DeleteFvieState> {
  final FaviRepo faviRepo;

  DeleteFvieCubit(this.faviRepo) : super(DeleteFvieInitial());
  Future<void> deletFaviProduct({required String productId}) async {
    emit(DeleteFvieLoading(productId));
    var result = await faviRepo.futureDeletProduct(productId: productId);
    result.fold(
      (failer) {
        emit(DeleteFvieFailer(failer.errorMassge,productId));
      },
      (sucsess) {
        emit(DeleteFvieSucess(sucsess, productId));
      },
    );
  }
}
