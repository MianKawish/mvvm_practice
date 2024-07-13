import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_practice/res/components/button.dart';
import 'package:mvvm_practice/utils/utils.dart';
import 'package:mvvm_practice/view_model/controller/login/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginController = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('appbar_text'.tr),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'email_hint'.tr,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      controller: _loginController.emailController.value,
                      focusNode: _loginController.emailFocusedController.value,
                      validator: (value) {
                        if (value!.isEmpty) {
                          Utils.toastMessageCenter("Please Enter Your Email");
                        }
                        return null;
                      },
                      onFieldSubmitted: (value) {
                        Utils.fieldFocusChange(
                            context,
                            _loginController.emailFocusedController.value,
                            _loginController.passwordFocusedController.value);
                      },
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'password_hint'.tr,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      controller: _loginController.passwordController.value,
                      focusNode:
                          _loginController.passwordFocusedController.value,
                      validator: (value) {
                        if (value!.isEmpty) {
                          Utils.toastMessageCenter(
                              "Please Enter Your Password");
                        }
                        return null;
                      },
                    ),
                  ],
                )),
            SizedBox(
              height: Get.height * 0.04,
            ),
            Obx(
              () {
                return CustomButton(
                  width: 150,
                  buttonText: "login_btn_text".tr,
                  buttonColor: Colors.teal,
                  loading: _loginController.loading.value,
                  callBack: () {
                    if (_formKey.currentState!.validate()) {
                      _loginController.loginApi();
                    }
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
