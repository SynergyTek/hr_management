import 'package:rxdart/rxdart.dart';

import '../../models/common_model/common_list_response.dart';
import '../../models/common_model/request_type_response.dart';
import '../../repositories/common_repository/abstract_common_repository.dart';

part 'common_bloc_implementation.dart';

abstract class AbstractCommonBloc {
  /// getLOVIdNameList: function to get List of Status from the API
  /// @Params:
  ///  queryparams: It takes a Map of queryparams to fetch the data from API.
  Future<CommonListResponse>? getLOVIdNameList({
    Map<String, dynamic>? queryparams,
  });

  /// getRequestTypeList: function to get List of Request Type from the API
  /// @Params:
  ///  queryparams: It takes a Map of queryparams to fetch the data from API.
  Future<RequestTypeListResponse>? getRequestTypeList({
    Map<String, dynamic>? queryparams,
  });
}
