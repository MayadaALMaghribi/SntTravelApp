part of 'fovurite_cubit.dart';

@immutable
sealed class AddfovuriteState {}

final class AddfovuriteInitial extends AddfovuriteState {}

final class AddfovuriteLoading extends AddfovuriteState {}

final class AddfovuriteSucess extends AddfovuriteState {
  final String sucessmessage;

  AddfovuriteSucess({required this.sucessmessage});
}

final class AddfovuriteFailure extends AddfovuriteState {
  final String errmessage;

  AddfovuriteFailure({required this.errmessage});
}

final class RemovefavLoading extends AddfovuriteState {}

final class RemovefavSucess extends AddfovuriteState {
  final ErrorModel errorModel;

  RemovefavSucess({required this.errorModel});
}

final class RemovefavFailure extends AddfovuriteState {
  final ErrorModel errorModel;

  RemovefavFailure({required this.errorModel});
}
