import 'package:flutter/foundation.dart';
import 'service.dart';

/// APIResponse is a high-level model class which we will consist of a
/// list of APIData and error string if our API call gets failed
/// or returns an error in response.
class ServiceResponse {
  bool isSuccess;
  final Service data;
  List<Service> list;
  String error;

  ServiceResponse({
    @required this.data,
  });

  ServiceResponse.fromJson(Map<String, dynamic> response)
      : data = Service.fromJson(response);

  ServiceResponse.withError(String errorValue)
      : data = null,
        error = errorValue;
}


