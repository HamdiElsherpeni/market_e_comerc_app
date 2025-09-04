part of 'app_cubit_cubit.dart';

class AppCubitState extends Equatable {
  final ThemeMode themeMode;
  const AppCubitState({required this.themeMode});

  AppCubitState copyWith({ThemeMode? themeMode}) =>
      AppCubitState(themeMode: themeMode ?? this.themeMode);

  @override
  List<Object> get props => [themeMode];
}
