import 'package:sntegpito/Features/profile/data/models/get_user_model.dart';

class GetState {}
class GetStateIntial extends GetState{}
final class GetuserprofileLoading extends GetState{}
final class GetuserprofileSuccess extends GetState{
  final GetuserprofileModel getuserprofileModel;

  GetuserprofileSuccess({required this.getuserprofileModel});
}
final class GetuserprofileFailure extends GetState{
  final String errmessage;

  GetuserprofileFailure({required this.errmessage});

}