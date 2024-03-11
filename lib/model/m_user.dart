/// [UserModel] is a model for user
class UserModel {
  /// [id] is the id of the user
  String id;

  /// [name] is the name of the user
  String name;

  /// [phoneNumber] is the phone number of the user
  String phoneNumber;

  /// [score] is the point of the user
  int score;

  /// [time] is consumed time of the user
  int time;

  UserModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.score,
    required this.time,
  });
}
