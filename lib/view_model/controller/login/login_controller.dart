import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_practice/model/login/login_response_model.dart';
import 'package:mvvm_practice/repository/login_repository/login_repository.dart';
import 'package:mvvm_practice/res/routes/routes_name.dart';
import 'package:mvvm_practice/utils/utils.dart';
import 'package:mvvm_practice/view_model/controller/user_prefrences/user_prefrences_view_model.dart';

class LoginController extends GetxController {
  final _userPrefrences = UserPrefrences();
  final _api = LoginRepository();
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusedController = FocusNode().obs;
  final passwordFocusedController = FocusNode().obs;

  RxBool loading = false.obs;

  void loginApi() {
    loading.value = true;
    Map<String, String> data = {
      'email': emailController.value.toString(),
      'password': passwordController.value.toString(),
    };
    _api.loginApi(data).then(
      (value) {
        print(value.toString());
        LoginResponseModel userModel =
            LoginResponseModel(token: value['token'].toString(), isLogin: true);
        _userPrefrences.saveUser(userModel).then(
          (value) {
            Get.toNamed(RouteNames.homeScreen);
          },
        ).onError(
          (error, stackTrace) {
            Utils.snackBar("User Not Created", 'Some Error is Occured');
          },
        );

        loading.value = false;
        Utils.snackBar("Login Successful",
            "Congratulations! You have successfully Logged in!");
      },
    ).onError(
      (error, stackTrace) {
        loading.value = false;
        Utils.snackBar("Login Failed", error.toString());
      },
    );
  }
}
