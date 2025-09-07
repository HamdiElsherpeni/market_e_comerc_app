// lib/featuers/protofoli/presentation/manger/update_user_data_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:market_e_comerc_app/featuers/protofoli/data/models/update_user_data/update_user_response.dart';
import 'package:market_e_comerc_app/featuers/protofoli/data/repos/proto_repo_implement.dart';

part 'update_user_data_state.dart';

class UpdateUserDataCubit extends Cubit<UpdateUserDataState> {
  final ProtoRepoImplement protoRepoImplement;
  UpdateUserDataCubit(this.protoRepoImplement) : super(UpdateUserDataInitial());

  Future<void> updateDataUser({
    required String name,
    required String email,
    required String gender,
    required String type,
    required String address,
    required String phone,
  }) async {
    emit(UpdateUserDataLoading());

    final result = await protoRepoImplement.ftchUpDateDta(
      name: name,
      email: email,
      gender: gender,
      type: type,
      address: address,
      phone: phone,
    );

    result.fold(
      (failer) => emit(UpdateUserDataFailure(failer.errorMassge)),
      (response) => emit(UpdateUserDataSuccess(response)),
    );
  }
}
