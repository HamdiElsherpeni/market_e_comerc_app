import 'package:bloc/bloc.dart';
import 'package:market_e_comerc_app/featuers/auth/data/models/create_new_pass_model/create_new_pass_response.dart';
import 'package:market_e_comerc_app/featuers/auth/data/repos/create_new_pass_repo/create_new_pass_repo.dart';
import 'package:meta/meta.dart';

part 'creat_new_pass_state.dart';

class CreatNewPassCubit extends Cubit<CreatNewPassState> {
  final CreateNewPassRepo createNewPassRepo;
  CreatNewPassCubit(this.createNewPassRepo) : super(CreatNewPassInitial());
  Future<void> futureCreaetNewPss({
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    emit(CreatNewPassLoadingl());
    var result = await createNewPassRepo.futureCreaetNewPss(
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );
    result.fold(
      (failer) {
        emit(CreatNewPassFalier(failer.errorMassge));
      },
      (sucsess) {
        emit(CreatNewPassISucess(sucsess));
      },
    );
  }
}
