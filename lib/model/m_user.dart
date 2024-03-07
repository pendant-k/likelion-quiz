/// [UserModel] is a model for user
class UserModel {
  /// [id] is the id of the user
  String id;

  /// [name] is the name of the user
  String name;

  /// [phoneNumber] is the phone number of the user
  String phoneNumber;

  /// [point] is the point of the user
  int point;

  /// [remainTime] is the remain time of the user
  int remainTime;

  UserModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.point,
    required this.remainTime,
  });
}
