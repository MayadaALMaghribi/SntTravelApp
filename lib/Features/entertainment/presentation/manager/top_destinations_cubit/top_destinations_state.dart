part of 'top_destinations_cubit.dart';

sealed class TopDestinationsState {}

final class TopDestinationsInitial extends TopDestinationsState {}

final class TopDestinationsLoading extends TopDestinationsState {}

final class TopDestinationsFailure extends TopDestinationsState {
  final dynamic errmessage;

  TopDestinationsFailure({required this.errmessage});
}

final class TopDestinationsSucess extends TopDestinationsState {
  final List<TopDestinationModel> topDestinationModel;

  TopDestinationsSucess({required this.topDestinationModel});
}
