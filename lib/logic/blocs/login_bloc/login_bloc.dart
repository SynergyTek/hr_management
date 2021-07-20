import 'package:flutter/cupertino.dart';
import '../../../data/models/login_models/login_request_model.dart';
import '../../../data/models/login_models/login_response.dart';

import '../../../data/repositories/login_repository/login_repository.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc {
  final LoginRepository _loginRepository = LoginRepository();

  // [NOTE]: Can use a Stream controller as well instead of BehaviourSubject.
  final BehaviorSubject<LoginResponse> _subject =
      BehaviorSubject<LoginResponse>();

  /// Used to create new entries.
  postData({
    @required LoginRequestModel loginResponseModel,
  }) async {
    LoginResponse response = await _loginRepository.postAPIData(
      loginResponseModel: loginResponseModel,
    );

    print("Hulululu: ${response.token} ${response.error}");
    return response.token;
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<LoginResponse> get subject => _subject;
}

final loginBloc = LoginBloc();
