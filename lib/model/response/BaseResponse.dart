import '../LoadApiStatus.dart';

class BaseResponse<T> {
  String status;
  String message;
  String error;
  List<T> data;
  LoadApiStatus loadStatus;

  BaseResponse({this.status, this.message, this.data, this.error});

  BaseResponse.loading(this.message) : loadStatus = LoadApiStatus.LOADING;
  BaseResponse.completed(this.data) : loadStatus = LoadApiStatus.COMPLETED;
  BaseResponse.error(this.message) : loadStatus = LoadApiStatus.ERROR;

  factory BaseResponse.fromJson(
      Map<String, dynamic> jsonData, Function fromJson) {
    final items = jsonData['data'];

    List<T> output = List();

    if (items is Iterable) {
      for (Map<String, dynamic> json in items) {
        output.add(fromJson(json));
      }
    } else {
      output.add(fromJson(items));
    }

    return BaseResponse<T>(
      status: jsonData["status"],
      message: jsonData["message"],
      data: output,
    );
  }

  BaseResponse.withError(String errorValue)
      : status = "",
        message = "",
        data = List(),
        error = errorValue;
}
