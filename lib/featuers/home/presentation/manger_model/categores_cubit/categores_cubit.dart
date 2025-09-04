import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:market_e_comerc_app/featuers/home/data/models/categores_model/categores.model.dart';
import 'package:market_e_comerc_app/featuers/home/data/repos/categores_repo/categores_repo.dart';

part 'categores_state.dart';

class CategoresCubit extends Cubit<CategoresState> {
  final CategoresRepo categoresRepo;
  CategoresCubit(this.categoresRepo) : super(CategoresInitial());
  Future<void> getCtegores() async {
    emit(CategoresLoding());
    var result = await categoresRepo.futureGetBrands();
    result.fold(
      (failer) {
        emit(CategoreFailer(failer.errorMassge));
      },
      (categores) {
        emit(CategoresSucess(categores));
      },
    );
  }
}
