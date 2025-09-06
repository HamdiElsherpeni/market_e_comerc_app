part of 'add_favi_cubit.dart';

sealed class AddFaviState extends Equatable {
  const AddFaviState();

  @override
  List<Object> get props => [];
}

final class AddFaviInitial extends AddFaviState {}

final class AddFaviLoading extends AddFaviState {
  final String productId;

const  AddFaviLoading(this.productId);

}

final class AddFaviSucess extends AddFaviState {
  final AddFaviResponse addFaviResponse;
  final String productId;

  const AddFaviSucess(this.addFaviResponse, this.productId);
}

final class AddFaviFailer extends AddFaviState {
  final String errorMassge;
  final String productId;


  const AddFaviFailer(this.errorMassge, this.productId);
}
