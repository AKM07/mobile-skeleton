
import 'LoadApiStatus.dart';

class BaseAllResponse<T> {
  LoadApiStatus status;
  T data;
  String message;

  BaseAllResponse();

  BaseAllResponse.loading(this.message) : status = LoadApiStatus.LOADING;
  BaseAllResponse.completed(this.data) : status = LoadApiStatus.COMPLETED;
  BaseAllResponse.error(this.message) : status = LoadApiStatus.ERROR;
}
