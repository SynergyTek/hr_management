import 'package:dio/dio.dart';

import '../../models/business_trip_model/business_trip_response_model.dart';
import '../../../constants/api_endpoints.dart';

part 'leave_repo.dart';

// Overview of the repository class.
abstract class AbstractLeaveRepository {
  AbstractLeaveRepository();

  Future<BusinessTripResponse> getBusinessTripDetails({
    // Optional Params to be added to the request if required.
    Map<String, dynamic>? queryparams,
  });
}
