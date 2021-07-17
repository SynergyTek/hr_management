part of 'abstract_nts_charts_repo.dart';

/// API Repository defines https client object, and our network call methods
/// which will be used to fetch data from Apis will map the JSON to its model.
class NTSChartRepository extends AbstractNTSChartRepository {
  final Dio _dio = Dio();

  Future<ChartResponse> getChartByStatus(
      {Map<String, dynamic> queryparams, NTSType ntsType})
  // Optional Params to be added to the request if required
  async {
    String endpoint = '';
    if (ntsType == NTSType.service) {
      endpoint = APIEndpointConstants.GET_SERVICE_CHART_BY_STATUS;
    } else if (ntsType == NTSType.note) {
      endpoint = APIEndpointConstants.GET_NOTE_CHART_BY_STATUS;
    } else if (ntsType == NTSType.task) {
      endpoint = APIEndpointConstants.GET_TASK_CHART_BY_STATUS;
    }

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );

      print(response.data);
      return ChartResponse.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return ChartResponse.withError("$err");
    }
  }

  @override
  Future<ChartResponse> getChartByUserType(
      {Map<String, dynamic> queryparams, NTSType ntsType}) async {
    String endpoint = '';
    if (ntsType == NTSType.service) {
      endpoint = APIEndpointConstants.GET_SERVICE_CHART_BY_USERTYPE;
    } else if (ntsType == NTSType.note) {
      endpoint = APIEndpointConstants.GET_NOTE_CHART_BY_USERTYPE;
    } else if (ntsType == NTSType.task) {
      endpoint = APIEndpointConstants.GET_TASK_CHART_BY_USERTYPE;
    }

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );

      print(response.data);
      return ChartResponse.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return ChartResponse.withError("$err");
    }
  }

  @override
  Future<ChartResponse> getDatewiseSLA(
      {Map<String, dynamic> queryparams, NTSType ntsType}) async {
    String endpoint = '';
    if (ntsType == NTSType.service) {
      endpoint = APIEndpointConstants.READ_DATEWISE_SERVICE_SLA;
    } else if (ntsType == NTSType.note) {
      endpoint = APIEndpointConstants.READ_DATEWISE_NOTE_SLA;
    } else if (ntsType == NTSType.task) {
      endpoint = APIEndpointConstants.READ_DATEWISE_TASK_SLA;
    }

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );

      print(response.data);
      return ChartResponse.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return ChartResponse.withError("$err");
    }
  }
}
