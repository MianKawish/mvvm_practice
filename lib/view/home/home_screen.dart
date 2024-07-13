import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_practice/data/response/status.dart';
import 'package:mvvm_practice/utils/utils.dart';
import 'package:mvvm_practice/view_model/controller/home/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _homeController = Get.put(HomeController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _homeController.userDataList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          switch (_homeController.rxRequestStatus.value) {
            case Status.LOADING:
              return Center(child: CircularProgressIndicator());
            case Status.ERROR:
              return Utils.toastMessageCenter("Some Error Occured");
            case Status.COMPLETED:
              return ListView.builder(
                itemCount: _homeController.userList.value.data!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: Get.height * 0.03),
                    child: ListTile(
                      subtitle: Text(_homeController
                          .userList.value.data![index].email
                          .toString()),
                      title: Text(_homeController
                          .userList.value.data![index].firstName
                          .toString()),
                      leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(_homeController
                              .userList.value.data![index].avatar
                              .toString())),
                    ),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
