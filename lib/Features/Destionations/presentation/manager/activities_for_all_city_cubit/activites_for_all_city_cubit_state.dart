part of 'activites_for_all_city_cubit.dart';

@immutable
sealed class ActivitesForAllCityCubitState {}

final class ActivitesForAllCityCubitInitial
    extends ActivitesForAllCityCubitState {}

final class ActivitesForAllCityCubitLoading
    extends ActivitesForAllCityCubitState {}

final class ActivitesForAllCityCubitFailure
    extends ActivitesForAllCityCubitState {
  final dynamic errmessage;

  ActivitesForAllCityCubitFailure({required this.errmessage});
}

final class ActivitesForAllCityCubitSucess
    extends ActivitesForAllCityCubitState {
  final List<ActivitesforcitiesModel> activitesforcitiesModel;

  ActivitesForAllCityCubitSucess({required this.activitesforcitiesModel});
}
