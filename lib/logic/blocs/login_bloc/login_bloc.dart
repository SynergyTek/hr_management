
import '../../../data/models/login_models/login_request_model.dart';
import '../../../data/models/login_models/login_response.dart';

import '../../../data/models/login_models/portal_response_view_model.dart';
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

    return response.data;
  }

  getPortalListByEmail({
    Map<String, dynamic>? queryparams,
    PortalViewResponse? portalResponseModel,
  }) async {
PortalViewResponse response = await _loginRepository.getPortalList(
      queryparams: queryparams,
    );

    return response.data;

  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<LoginAPIResponse> get subject => _subject;
}

final loginBloc = LoginBloc();
