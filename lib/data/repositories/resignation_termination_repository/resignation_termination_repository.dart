part of 'abstract_resignation_termination_repository.dart';

class ResignationTerminationRepository
    extends AbstractResignationTerminationRepository {
  final Dio _dio = Dio();

  Future<HrDirectContractResponseModel> getHrDirectContractList({
    Map<String, dynamic>? queryparams,
  }) async {
    final String endpoint = APIEndpointConstants.GET_HRDIRECT_CONTRACT;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );
      return HrDirectContractResponseModel.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print(
          "[Exception]: Error occured while fetching the API Response for endpoint: $endpoint.");
      print("Stacktrace: $stacktrace \nError: $err");

      return HrDirectContractResponseModel.withError("$err");
    }
  }

  @override
  Future<ResignationTerminationResponse?> getResignationTerminationData({
    Map<String, dynamic>? queryparams,
  }) async {
    try {
      Response response = await _dio.get(
        APIEndpointConstants.GET_RESIGNATION_TERMINATION_DATA_ENDPOINT,
        queryParameters: queryparams ?? {},
      );

      return ResignationTerminationResponse.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");
      return ResignationTerminationResponse.withError("$err");
    }
  }

  @override
  Future<TerminationResponse?> getTerminationData({
    Map<String, dynamic>? queryparams,
  }) async {
    try {
      Response response = await _dio.get(
        APIEndpointConstants.GET_TERMINATION_DATA_ENDPOINT,
        queryParameters: queryparams ?? {},
      );

      return TerminationResponse.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");
      return TerminationResponse.withError("$err");
    }
  }

  @override
  Future<MisconductResponse?> getMisconductData({
    Map<String, dynamic>? queryparams,
  }) async {
    try {
      Response response = await _dio.get(
        APIEndpointConstants.GET_MISCONDUCT_DATA_ENDPOINT,
        queryParameters: queryparams ?? {},
      );

      return MisconductResponse.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");
      return MisconductResponse.withError("$err");
    }
  }
}
