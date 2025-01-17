import 'package:mvvm_practice/data/response/status.dart';

class ApiResponse<T> {
  Status? status;
  String? message;
  T? data;
  ApiResponse(this.data, this.status, this.message);
  ApiResponse.loading() : status = Status.LOADING;
  ApiResponse.completed(this.data) : status = Status.COMPLETED;
  ApiResponse.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return 'Status : $status \n $message \n Data: $data';
  }
}
