part of 'delete_fvie_cubit.dart';

sealed class DeleteFvieState extends Equatable {
  const DeleteFvieState();

  @override
  List<Object> get props => [];
}

final class DeleteFvieInitial extends DeleteFvieState {}

final class DeleteFvieLoading extends DeleteFvieState {
  final String productId;

const  DeleteFvieLoading(this.productId);

}

final class DeleteFvieSucess extends DeleteFvieState {
  final DeletFaviResponse deletFaviResponse;
  final String productId;

  const DeleteFvieSucess(this.deletFaviResponse, this.productId);
}

final class DeleteFvieFailer extends DeleteFvieState {
  final String errorMassge;
  final String productId;


  const DeleteFvieFailer(this.errorMassge, this.productId);
}
