import 'package:get/get.dart';
import 'package:mvvm_practice/data/response/status.dart';
import 'package:mvvm_practice/model/home/user_data_model.dart';

import 'package:mvvm_practice/repository/home/user_data_repositry.dart';
import 'package:mvvm_practice/utils/utils.dart';

class HomeController extends GetxController {
  final _userDataRepo = UserDataRepositry();

  final rxRequestStatus = Status.LOADING.obs;
  final userList = UserDataModel().obs;

  void serRxRequestStatus(Status statusValue) =>
      rxRequestStatus.value = statusValue;
  void setUserList(UserDataModel statusValue) => userList.value = statusValue;

  void userDataList() {
    _userDataRepo.getUserDataList().then(
      (value) {
        serRxRequestStatus(Status.COMPLETED);
        setUserList(value);
      },
    ).onError(
      (error, stackTrace) {
        Utils.snackBar("Error", error.toString());
        serRxRequestStatus(Status.ERROR);
      },
    );
  }
}
