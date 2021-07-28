import 'package:dio/dio.dart';
import '../../../../constants/api_endpoints.dart';
import '../../../models/documents_models/person_profile_models/person_profile_response.dart';

part './person_profile_repository_implementation.dart';

// Overview of the repository class.
abstract class AbstractPersonProfileRepository {
  AbstractPersonProfileRepository();

  Future<PersonProfileResponse> getAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });

  Future<PersonProfileResponse> postAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });

  Future<PersonProfileResponse> putAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });

  Future<PersonProfileResponse> deleteAPIData({
    // Optional Params to be added to the request if required.
    Map<String, dynamic> queryparams,
  });
}
