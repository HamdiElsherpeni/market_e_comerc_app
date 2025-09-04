part of 'categores_cubit.dart';

sealed class CategoresState extends Equatable {
  const CategoresState();

  @override
  List<Object> get props => [];
}

final class CategoresInitial extends CategoresState {}

final class CategoresLoding extends CategoresState {}

final class CategoresSucess extends CategoresState {
  final List<CategoresModel> categores;

  const CategoresSucess(this.categores);
}

final class CategoreFailer extends CategoresState {
  final String errorMassge;

  const CategoreFailer(this.errorMassge);
}
