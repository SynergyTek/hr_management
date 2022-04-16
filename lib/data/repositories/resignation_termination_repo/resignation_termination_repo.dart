part of 'abstract_resignation_termination_repo.dart';

/// API Repository defines https client object, and our network call methods
/// which will be used to fetch data from Apis will map the JSON to its model.
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
}
