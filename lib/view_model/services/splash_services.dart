import 'dart:async';

import 'package:get/get.dart';
import 'package:mvvm_practice/res/routes/routes_name.dart';
import 'package:mvvm_practice/view_model/controller/user_prefrences/user_prefrences_view_model.dart';

class SplashServices {
  final _prefs = UserPrefrences();
  void isLogin() {
    _prefs.getUser().then(
      (value) {
        print(value.token);
        print(value.isLogin);
        if (value.isLogin == false || value.isLogin.toString() == 'null') {
          Timer(const Duration(seconds: 3),
              () => Get.toNamed(RouteNames.loginScreen));
        } else {
          Timer(const Duration(seconds: 3),
              () => Get.toNamed(RouteNames.homeScreen));
        }
      },
    ).onError(
      (error, stackTrace) {},
    );
  }
}
