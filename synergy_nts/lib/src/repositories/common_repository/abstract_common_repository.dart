import 'package:dio/dio.dart';

import '../../constants/api_endpoints.dart';
import '../../models/common_model/common_list_response.dart';
import '../../models/common_model/request_type_response.dart';

part 'common_repository_implementation.dart';

// Overview of the repository class.
abstract class AbstractCommonRepository {
  AbstractCommonRepository();

  Future<CommonListResponse> getLOVIdNameList();

  Future<RequestTypeListResponse> getRequestTypeList(
      {Map<String, dynamic>? queryparams});
}
