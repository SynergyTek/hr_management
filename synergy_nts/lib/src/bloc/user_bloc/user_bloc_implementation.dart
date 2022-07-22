part of 'abstract_user_bloc.dart';

class UserBloc extends AbstractUserBloc {
  final UserRepository? _userRepository = UserRepository();

  final BehaviorSubject<UserListResponse>? _subjectUserDataList =
      BehaviorSubject<UserListResponse>();

  final BehaviorSubject<ReadTeamDataResponse>? _subjectReadTeamData =
      BehaviorSubject<ReadTeamDataResponse>();

  final BehaviorSubject<ReadUserHierarchyResponse>?
      _subjectUserHierarchyDataList =
      BehaviorSubject<ReadUserHierarchyResponse>();

  @override
  Future<UserListResponse?> readUserData({
    Map<String, dynamic>? queryparams,
  }) async {
    UserListResponse? response =
        await _userRepository!.readUserData(queryparams: queryparams);
    _subjectUserDataList?.sink.add(response);
    return response;
  }

  @override
  Future<ReadTeamDataResponse?> readTeamData({
    Map<String, dynamic>? queryparams,
  }) async {
    ReadTeamDataResponse? response =
        await _userRepository!.readTeamData(queryparams: queryparams);
    _subjectReadTeamData?.sink.add(response);
    return response;
  }

  @override
  Future<ReadUserHierarchyResponse?> readUserHierarchyData({
    Map<String, dynamic>? queryparams,
  }) async {
    ReadUserHierarchyResponse? response =
        await _userRepository!.readUserHierarchyData(queryparams: queryparams);
    _subjectUserHierarchyDataList?.sink.add(response);
    return response;
  }

  Future<UserListResponse?> readTeamUserData({
    Map<String, dynamic>? queryparams,
  }) async {
    UserListResponse? response =
        await _userRepository!.readTeamUserData(queryparams: queryparams);
    _subjectUserDataList?.sink.add(response);
    return response;
  }

  BehaviorSubject<UserListResponse?> get subjectUserDataList =>
      _subjectUserDataList!;

  BehaviorSubject<ReadTeamDataResponse?> get subjectReadTeamData =>
      _subjectReadTeamData!;

  BehaviorSubject<ReadUserHierarchyResponse?>
      get subjectUserHierarchyDataList => _subjectUserHierarchyDataList!;

  dispose() {
    _subjectUserDataList?.close();
    _subjectReadTeamData?.close();
    _subjectUserHierarchyDataList?.close();
  }
}

final userBLoc = UserBloc();
