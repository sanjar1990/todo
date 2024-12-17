import 'package:al_fatiha/view/pages/todo/model/todo_model.dart';

abstract class AuthHolder {
  late String authToken;
  late String role;
  late String username;
  late String userId;
  late String firstName;
  late String lastName;
  late String phone;
  late String fcmToken;

  Future<void> clearAuth();
}
