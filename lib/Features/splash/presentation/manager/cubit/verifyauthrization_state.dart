part of 'verifyauthrization_cubit.dart';

@immutable
sealed class VerifyauthrizationState {}

final class VerifyauthrizationInitial extends VerifyauthrizationState {}

final class VerifyauthrizationLoading extends VerifyauthrizationState {}

final class VerifyauthrizationSucess extends VerifyauthrizationState {
  final ValidAuthtoApp validAuthtoApp;

  VerifyauthrizationSucess({required this.validAuthtoApp});
}

final class VerifyauthrizationFailure extends VerifyauthrizationState {
  final String errmessage;

  VerifyauthrizationFailure({required this.errmessage});
}
