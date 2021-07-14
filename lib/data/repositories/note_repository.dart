import 'package:dio/dio.dart';
import '../models/api_models/api_response_model.dart';

import 'api_repository.dart';

class NoteRepository extends AbstractAPIRepository {
  final Dio _dio = Dio();
  @override
  Future<APIResponse> deleteAPIData({Map<String, dynamic> queryparams}) {
    // TODO: implement deleteAPIData
    throw UnimplementedError();
  }

  Future<APIResponse> getAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  }) async {
    String endpoint = ''; // APIEndpointConstants.GET_READSERVICETEMPLATE_URL;

    try {
      // TODO: Need to send this via UI and not hardcode here!
      // queryparams = {
      //   'api_key': APIEndpointConstants.API_KEY,
      //   'language': 'en-US',
      //   'page': 1
      // };

      Response response = await _dio.get(
        endpoint,
        queryParameters: queryparams ?? {},
      );

      print(response);

      if (response.statusCode == 200) {}

      return APIResponse.fromJson(
        response.data,
      );
    } catch (err, stacktrace) {
      // print(
      //     "[Exception]: Error occured while fetching the API Response for endpoint: ${APIEndpointConstants.GET_READSERVICETEMPLATE_URL}.");
      print("Stacktrace: $stacktrace \nError: $err");

      return APIResponse.withError("$err");
    }
  }

  @override
  Future<APIResponse> postAPIData({Map<String, dynamic> queryparams}) {
    // TODO: implement postAPIData
    throw UnimplementedError();
  }

  @override
  Future<APIResponse> putAPIData({Map<String, dynamic> queryparams}) {
    // TODO: implement putAPIData
    throw UnimplementedError();
  }
}
