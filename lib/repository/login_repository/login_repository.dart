import 'package:mvvm_practice/data/network/network_api_services.dart';
import 'package:mvvm_practice/res/app_urls/app_url.dart';

class LoginRepository {
  final _apiServices = NetworkApiServices();
  Future<dynamic> loginApi(var data) async {
    final response = _apiServices.postApi(AppUrl.loginApi, data);
    return response;
  }
}
