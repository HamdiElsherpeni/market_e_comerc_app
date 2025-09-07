// lib/featuers/favorite/presentation/manger/get_favi_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:market_e_comerc_app/featuers/favorite/data/models/get_favi_product/get_favi_response.dart';
import 'package:market_e_comerc_app/featuers/favorite/data/repos/favi_repo.dart';

part 'get_favi_state.dart';

class GetFaviCubit extends Cubit<GetFaviState> {
  final FaviRepo faviRepo;
  GetFaviCubit(this.faviRepo) : super(GetFaviInitial());

  Future<void> GetFaviProduct() async {
    emit(GetFaviLoading());
    var result = await faviRepo.futureGetFavitProduct();
    result.fold(
      (failer) {
        emit(GetFaviFailer(failer.errorMassge));
      },
      (sucsess) {
        emit(GetFaviSucsess(sucsess));
      },
    );
  }
}
