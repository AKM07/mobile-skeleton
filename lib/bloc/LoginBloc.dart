import 'dart:math';

import 'package:mobile_skeleton/model/response/BaseResponse.dart';
import 'package:mobile_skeleton/model/response/LoginResponse.dart';
import 'package:mobile_skeleton/model/sqliteModel.dart';
import 'package:mobile_skeleton/repository/LoginRepository.dart';
import 'package:mobile_skeleton/utils/PreferencesUtil.dart';
import 'package:mobile_skeleton/utils/injector.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc {
  final LoginRepository repository = LoginRepository();
  final BehaviorSubject<BaseResponse<LoginResponse>> subject =
      BehaviorSubject<BaseResponse<LoginResponse>>();

  final PreferencesUtil util = locator<PreferencesUtil>();

  doLogin(String email, String password) async {
    if (isDisposed) {
      return;
    }

    subject.add(BaseResponse.loading('Please Wait'));
    try {
      BaseResponse<LoginResponse> response =
          await repository.login(email, password);
      util.putString(PreferencesUtil.userId, response.data[0].userId);
      var randomId = new Random();
      await Account(
              id: randomId.nextInt(5000),
              userId: response.data[0].userId,
              email: response.data[0].email,
              fullName: response.data[0].fullName,
              gender: response.data[0].gender,
              address: response.data[0].address,
              phone: response.data[0].phone,
              birthDate: response.data[0].birthDate,
              city: response.data[0].city,
              zipCode: response.data[0].zipCode,
              isActive: response.data[0].isActive,
              idDoku: response.data[0].idDoku,
              whatsAppNumber: response.data[0].whatsAppNumber,
              loginCheck: response.data[0].loginCheck,
              deviceLoyalty: response.data[0].deviceLoyalty,
              createDate: response.data[0].createDate)
          .save();
      subject.sink.add(BaseResponse.completed(response.data));
    } catch (e) {
      subject.sink.add(BaseResponse.error(e.toString()));
    }
  }

  bool isDisposed = false;
  dispose() {
    subject.close();
    isDisposed = true;
  }

  BehaviorSubject<BaseResponse<LoginResponse>> get responseSubject => subject;
}

final bloc = LoginBloc();
