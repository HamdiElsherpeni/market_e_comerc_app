import 'package:bloc/bloc.dart';
import 'package:market_e_comerc_app/featuers/auth/data/models/reset_password_by_email_model/reset_pass_response.dart';
import 'package:market_e_comerc_app/featuers/auth/data/repos/reset_pass_repo/reset_pass_repo.dart';
import 'package:meta/meta.dart';

part 'reset_pass_state.dart';

class ResetPassCubit extends Cubit<ResetPassState> {
  final ResetPassRepo resetPassRepo;
  ResetPassCubit(this.resetPassRepo) : super(ResetPassInitial());
  Future<void> ResetPassByEmail({required String email}) async {
    emit(ResetPassLoading());
    var result = await resetPassRepo.resetPassword(email: email);
    result.fold(
      (failer) {
        emit(ResetPassFalier(errorMassge: failer.errorMassge));
      },
      (sucsess) {
        emit(ResetPassSucsess(resetPassResponse: sucsess));
      },
    );
  }
}
