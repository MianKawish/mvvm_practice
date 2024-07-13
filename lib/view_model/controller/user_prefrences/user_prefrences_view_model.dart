import 'package:mvvm_practice/model/login/login_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPrefrences {
  Future<bool> saveUser(LoginResponseModel loginResponseModel) async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    sp.setString('token', loginResponseModel.token.toString());
    sp.setBool('isLogin', loginResponseModel.isLogin!);

    return true;
  }

  Future<LoginResponseModel> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    String? token = sp.getString('token');
    bool? isLogin = sp.getBool('isLogin');

    return LoginResponseModel(token: token, isLogin: isLogin);
  }

  Future<bool> removeUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();

    return true;
  }
}
