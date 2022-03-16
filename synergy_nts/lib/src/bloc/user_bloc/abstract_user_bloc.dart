import 'package:rxdart/rxdart.dart';

import '../../models/user_model/user_response.dart';
import '../../repositories/user_repository/abstract_user_repository.dart';

export '../../models/user_model/user_response.dart';
export '../../repositories/user_repository/abstract_user_repository.dart';

part 'user_bloc_implementation.dart';

abstract class AbstractUserBloc {
  /// readUserData: function to get User Data from the API
  /// @Params:
  ///   queryparams: It takes a Map of queryparams to fetch the data from API.
  Future<UserListResponse?> readUserData({
    Map<String, dynamic>? queryparams,
  });

  /// readTeamData: function to get User Team Data from the API
  /// @Params:
  ///   queryparams: It takes a Map of queryparams to fetch the data from API.
  Future<ReadTeamDataResponse?> readTeamData({
    Map<String, dynamic>? queryparams,
  });

  /// readUserHierarchyData: function to get User Hierarchy Data from the API
  /// @Params:
  ///   queryparams: It takes a Map of queryparams to fetch the data from API.
  Future<ReadUserHierarchyResponse?> readUserHierarchyData({
    Map<String, dynamic>? queryparams,
  });
}
