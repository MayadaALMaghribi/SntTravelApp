part of 'removefav_cubit.dart';

@immutable
sealed class RemovefavState {}

final class RemovefavInitial extends RemovefavState {}

final class RemovefavLoading extends RemovefavState {}

final class RemovefavSucess extends RemovefavState {
  final ErrorModel errorModel;

  RemovefavSucess({required this.errorModel});
}

final class RemovefavFailure extends RemovefavState {
  final String errorMessage;

  RemovefavFailure({required this.errorMessage});
}
