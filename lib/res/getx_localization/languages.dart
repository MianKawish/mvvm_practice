import 'package:get/get_navigation/get_navigation.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'email_hint': 'Enter your email',
          'toast_hint': "Wrong Number Enterd",
          'welcome_back': "Welcome\nBack",
          'appbar_text': "Login",
          'password_hint': "Enter your password",
          'login_btn_text': "Login"
        },
        'ur_PK': {
          'email_hint': 'ای میل درج کریں۔',
          "toast_hint": 'غلط نمبر درج کیا گیا۔'
        }
      };
}
