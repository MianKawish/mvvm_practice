import 'package:mvvm_practice/data/network/network_api_services.dart';
import 'package:mvvm_practice/model/home/user_data_model.dart';
import 'package:mvvm_practice/res/app_urls/app_url.dart';

class UserDataRepositry {
  final _apiServices = NetworkApiServices();
  Future<UserDataModel> getUserDataList() async {
    final userDataList = await _apiServices.getApi(AppUrl.userData);

    return UserDataModel.fromJson(userDataList);
  }
}
