import 'business_trip_model.dart';

/// APIResponse is a high-level model class which we will consist of a
/// list of APIData and error string if our API call gets failed
/// or returns an error in response.
class BusinessTripResponse {
  final List<BusinessTripModel> data;
  String? error;

  BusinessTripResponse({
    required this.data,
  });

  BusinessTripResponse.fromJson(List response)
      : data =
            (response).map((i) => new BusinessTripModel.fromJson(i)).toList();

// LeaveTempResponse.fromJson(Map<String, dynamic> json)
//       : data = (json["Data"] as List)
//             .map((i) => new LeaveTemplateModel.fromJson(i))
  // .toList();

  BusinessTripResponse.withError(String errorValue)
      : data = [],
        error = errorValue;
}
