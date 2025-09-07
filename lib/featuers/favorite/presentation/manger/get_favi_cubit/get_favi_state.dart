// part of 'get_favi_cubit.dart';
part of 'get_favi_cubit.dart';

sealed class GetFaviState extends Equatable {
  const GetFaviState();

  @override
  List<Object> get props => [];
}

final class GetFaviInitial extends GetFaviState {}
final class GetFaviLoading extends GetFaviState {}
final class GetFaviFailer extends GetFaviState {
  final String errorMassge;

  const GetFaviFailer(this.errorMassge);

  @override
  List<Object> get props => [errorMassge];
}
final class GetFaviSucsess extends GetFaviState {
  final List<GetFaviResponse> getFavi;

  const GetFaviSucsess(this.getFavi);

  @override
  List<Object> get props => [getFavi];
}
