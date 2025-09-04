import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:market_e_comerc_app/featuers/home/data/models/top_search_model/top_search.model.dart';
import 'package:market_e_comerc_app/featuers/home/data/repos/top_search_repo/top_saerch_repo.dart';

part 'top_search_state.dart';

class TopSearchCubit extends Cubit<TopSearchState> {
  final TopSaerchRepo topSaerchRepo;
  TopSearchCubit(this.topSaerchRepo) : super(TopSearchInitial());
  Future<void> getTopSearch() async {
    emit(TopSearchLoading());
    var result = await topSaerchRepo.futureTopSearch();
    result.fold(
      (failer) {
        emit(TopSearchFailer(failer.errorMassge));
      },
      (products) {
        emit(TopSearchSucess(products));
      },
    );
  }
}
