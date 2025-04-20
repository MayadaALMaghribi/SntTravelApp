part of 'addfovurite_cubit.dart';

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
