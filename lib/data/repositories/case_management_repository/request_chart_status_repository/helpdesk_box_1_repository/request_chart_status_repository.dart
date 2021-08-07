import 'package:dio/dio.dart';
import 'package:hr_management/data/models/help_desk_models/open_requests_by_category_response.dart';
import '../../../../../constants/api_endpoints.dart';

part 'request_chart_status_repository_implementation.dart';

// Overview of the repository class.
abstract class AbstractRequestChartStatusRepository {
  AbstractRequestChartStatusRepository();

  Future<OpenRequestsByCategoryResponse> getAPIData({
    Map<String, dynamic> queryparams,
  });

  Future<OpenRequestsByCategoryResponse> postAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });

  Future<OpenRequestsByCategoryResponse> putAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });

  Future<bool> deleteAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });
}
