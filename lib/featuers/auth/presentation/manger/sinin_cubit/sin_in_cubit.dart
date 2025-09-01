import 'package:bloc/bloc.dart';
import 'package:market_e_comerc_app/featuers/auth/data/models/sinin_model/sin_in_response.dart';
import 'package:market_e_comerc_app/featuers/auth/data/repos/sinin_repo/sinin_repo.dart';
import 'package:meta/meta.dart';

part 'sin_in_state.dart';

class SinInCubit extends Cubit<SinInState> {
  final SininRepo sininRepo;
  SinInCubit(this.sininRepo) : super(SinInInitial());
  Future<void> sinInFeatureCu({
    required String password,
    required String email,
  }) async {
    emit(SinInILiading());
    var result = await sininRepo.featuresinInUser(
      email: email,
      password: password,
    );
    result.fold(
      (failer) {
        emit(SinInFailer(errorMassge: failer.errorMassge));
      },
      (data) {
        emit(SinInSucsess(signInResponse: data));
      },
    );
  }
}
