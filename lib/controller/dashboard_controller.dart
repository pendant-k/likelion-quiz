import 'package:get/get.dart';
import 'package:likelion_quiz/model/m_user.dart';
import 'package:likelion_quiz/model/user_repository.dart';

class DashboardController extends GetxController {
  final users = <UserModel>[].obs;

  final _loading = true.obs;
  bool get loading => _loading.value;

  Future<void> getUsers() async {
    try {
      _loading.value = true;
      final result = await UserReopsitory().getUsers();
      result.sort((a, b) => a.time.compareTo(b.time));
      result.sort((a, b) => b.score.compareTo(a.score));
      users.value = result;
    } catch (e) {
      rethrow;
    } finally {
      _loading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration.zero, () async {
      await getUsers();
    });
  }
}
