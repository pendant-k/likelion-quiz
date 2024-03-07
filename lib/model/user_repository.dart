import 'package:get/get.dart';
import 'package:likelion_quiz/model/m_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// abstract class for user repository
abstract class AbstractUserRepository {
  /// create user
  Future<void> createUser({
    required String name,
    required String phoneNumber,
    required int remainTime,
    required int point,
  });

  /// get all users
  Future<List<UserModel>?> getUsers();
}

class UserReopsitory extends GetxService implements AbstractUserRepository {
  final db = FirebaseFirestore.instance;

  @override
  Future<void> createUser({
    required String name,
    required String phoneNumber,
    required int remainTime,
    required int point,
  }) async {
    try {
      db.collection('users').add({
        'name': name,
        'phoneNumber': phoneNumber,
        'remainTime': remainTime,
        'point': point,
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<UserModel>> getUsers() async {
    try {
      final result = await db.collection('users').get();
      final users = result.docs
          .map((e) => UserModel(
                id: e.id,
                name: e['name'],
                phoneNumber: e['phoneNumber'],
                point: e['point'],
                remainTime: e['remainTime'],
              ))
          .toList();
      return users;
    } catch (e) {
      throw e;
    }
  }
}
