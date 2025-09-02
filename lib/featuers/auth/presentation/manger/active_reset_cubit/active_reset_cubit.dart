import 'package:bloc/bloc.dart';
import 'package:market_e_comerc_app/featuers/auth/data/models/active_reset_password/active_reset_password_request.dart';
import 'package:market_e_comerc_app/featuers/auth/data/repos/active_reset_repo/active_reset_repo.dart';
import 'package:meta/meta.dart';

part 'active_reset_state.dart';

class ActiveResetCubit extends Cubit<ActiveResetState> {
  final ActiveResetRepo activeResetRepo;
  ActiveResetCubit(this.activeResetRepo) : super(ActiveResetInitial());
  Future<void> futureActiveReset({
    required final String email,
    required final String code,
  }) async {
    emit(ActiveResetLoading());
    var respopns = await activeResetRepo.resetPassword(
      email: email,
      code: code,
    );
    respopns.fold(
      (failer) {
        emit(ActiveResetFalier(failer.errorMassge));
      },
      (sucess) {
        emit(ActiveResetSucess(sucess));
      },
    );
  }
}
