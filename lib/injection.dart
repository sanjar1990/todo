import 'package:al_fatiha/view/pages/todo/controller/todo_controller.dart';
import 'package:get/get.dart';
import 'data/server/api/api_service.dart';
import 'data/server/auth_interceptor.dart';

import 'data/storage/app/locals/lang_prefs/language_prefs.dart';
import 'data/storage/auth/auth_holder.dart';
import 'data/storage/auth/auth_prefs.dart';
import 'domain/use_case/login/login_use_case.dart';

class DIService {
  static Future<void> init() async {
    // data

    Get.lazyPut<LangPrefs>(() => LangPrefs(), fenix: true);
    Get.lazyPut<AuthHolder>(() => AuthPrefs(), fenix: true);
    // Get.lazyPut<AppHolder>(() => AppHolderImp(), fenix: true);

    Get.lazyPut<ApiService>(() => ApiService(Get.find<AuthInterceptor>()));
    Get.lazyPut<AuthInterceptor>(() => AuthInterceptor(Get.find<AuthHolder>()));

    Get.lazyPut<LoginUseCase>(() => LoginUseCase(Get.find()), fenix: true);
    //controller
    Get.lazyPut<TodoController>(() => TodoController(), fenix: true);
  }


}


