part of 'person_profile_repository.dart';

/// API Repository defines https client object, and our network call methods
/// which will be used to fetch data from Apis will map the JSON to its model.
class PersonProfileRepository extends AbstractPersonProfileRepository {
  final Dio _dio = Dio();

  Future<PersonProfileResponse> getAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  }) async {
    if (queryparams == null) queryparams = Map();

    String userId = await getUserId();
    if (userId != null) queryparams['userid'] = userId;

    final String endpoint = APIEndpointConstants.GET_PERSON_PROFILE_DATA;

    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );

      return PersonProfileResponse.fromJson(response.data);
    } catch (err, stacktrace) {
      print("Stacktrace: $stacktrace \nError: $err");

      return PersonProfileResponse.withError("$err");
    }
  }

  @override
  Future<PersonProfileResponse> deleteAPIData({
    Map<String, dynamic> queryparams,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<PersonProfileResponse> postAPIData({
    Map<String, dynamic> queryparams,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<PersonProfileResponse> putAPIData({
    Map<String, dynamic> queryparams,
  }) {
    throw UnimplementedError();
  }
}
