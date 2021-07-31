import '../../../data/models/user/user_response.dart';
import '../../../data/repositories/user_repository/abstract_user_repo.dart';
import 'package:rxdart/rxdart.dart';

class UserBloc {
  final UserRepository _userRepository = UserRepository();

  final BehaviorSubject<UserListResponse> _subjectUserDataList =
      BehaviorSubject<UserListResponse>();

  final BehaviorSubject<ReadTeamDataResponse> _subjectReadTeamData =
      BehaviorSubject<ReadTeamDataResponse>();

  readUserData({
    Map<String, dynamic> queryparams,
  }) async {
    UserListResponse response =
        await _userRepository.readUserData(queryparams: queryparams);
    _subjectUserDataList.sink.add(response);
  }

  readTeamData({
    Map<String, dynamic> queryparams,
  }) async {
    ReadTeamDataResponse response =
        await _userRepository.readTeamData(queryparams: queryparams);
    _subjectReadTeamData.sink.add(response);
  }

  BehaviorSubject<UserListResponse> get subjectUserDataList =>
      _subjectUserDataList;

  BehaviorSubject<ReadTeamDataResponse> get subjectReadTeamData =>
      _subjectReadTeamData;

  dispose() {
    _subjectUserDataList.close();
    _subjectReadTeamData.close();
  }
}

final userBLoc = UserBloc();
