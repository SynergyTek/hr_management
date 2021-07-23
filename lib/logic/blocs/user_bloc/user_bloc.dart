import 'package:hr_management/data/models/user/user_response.dart';
import 'package:hr_management/data/repositories/user_repository/abstract_user_repo.dart';
import 'package:rxdart/rxdart.dart';

class UserBloc {
  final UserRepository _userRepository = UserRepository();

  final BehaviorSubject<UserListResponse> _subjectUserDataList =
      BehaviorSubject<UserListResponse>();

  readUserData({
    Map<String, dynamic> queryparams,
  }) async {
    UserListResponse response =
        await _userRepository.readUserData(queryparams: queryparams);
    _subjectUserDataList.sink.add(response);
  }

  BehaviorSubject<UserListResponse> get subjectUserDataList =>
      _subjectUserDataList;

  dispose() {
    _subjectUserDataList.close();
  }
}

final userBLoc = UserBloc();
