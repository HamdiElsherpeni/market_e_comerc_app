part of 'top_search_cubit.dart';

sealed class TopSearchState extends Equatable {
  const TopSearchState();

  @override
  List<Object> get props => [];
}

final class TopSearchInitial extends TopSearchState {}

final class TopSearchLoading extends TopSearchState {}

final class TopSearchSucess extends TopSearchState {
  final List<TopSearch> topSearch;

  const TopSearchSucess(this.topSearch);
}

final class TopSearchFailer extends TopSearchState {
  final String erorrMassage;

  const TopSearchFailer(this.erorrMassage);
}
