import '../../../data/models/login_models/login_request_model.dart';
import '../../../data/models/login_models/login_response.dart';

import '../../../data/repositories/login_repository/login_repository.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc {
  final LoginRepository _loginRepository = LoginRepository();

  // [NOTE]: Can use a Stream controller as well instead of BehaviourSubject.
  final BehaviorSubject<LoginAPIResponse> _subject =
      BehaviorSubject<LoginAPIResponse>();

  /// Used to create new entries.
  postData({
    Map<String, dynamic>? queryparams,
    LoginRequestModel? loginResponseModel,
  }) async {
    LoginAPIResponse response = await _loginRepository.postAPIData(
      queryparams: queryparams,
      loginResponseModel: loginResponseModel,
    );

    // print("Hulululu: ${response.token} ${response.error}");
    return response.data;
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<LoginAPIResponse> get subject => _subject;
}

final loginBloc = LoginBloc();
