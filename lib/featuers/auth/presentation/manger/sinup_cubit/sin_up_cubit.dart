
import 'package:bloc/bloc.dart';
import 'package:market_e_comerc_app/featuers/auth/data/models/sinup_models/sin_uo_response.dart';
import 'package:market_e_comerc_app/featuers/auth/data/repos/sinup_repo/sinup_repo.dart';
import 'package:meta/meta.dart';

part 'sin_up_state.dart';

class SinUpCubit extends Cubit<SinUpState> {
  final SinupRepo sinupRepo;
  SinUpCubit(this.sinupRepo) : super(SinUpInitial());

  Future<void> sinupFuture({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    emit(SinUpILoading());
    var result = await sinupRepo.sinUpUser(
      name: name,
      phone: phone,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );
    result.fold(
      (failer) {
        emit(SinUpIFailer(errorMassge: failer.errorMassge));
      },
      (response) {
        emit(SinUpISucsess(massge: response));
      },
    );
  }
}
