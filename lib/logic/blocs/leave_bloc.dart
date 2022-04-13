import 'package:hr_management/data/models/leave_models/business_trip_response_model.dart';
import 'package:rxdart/rxdart.dart';

import '../../data/repositories/leave_temp_repo/leave_temp_repo.dart';

class LeaveBloc {
  final LeaveTempRepository _leaveRepository = LeaveTempRepository();

  final BehaviorSubject<BusinessTripResponse> _subjectBusinessTripList =
      BehaviorSubject<BusinessTripResponse>();

  getBusinessTripDetails({
    Map<String, dynamic>? queryparams,
  }) async {
    BusinessTripResponse response =
        await _leaveRepository.getBusinessTripDetails(
      queryparams: queryparams,
    );

    _subjectBusinessTripList.sink.add(response);
  }

  dispose() {
    _subjectBusinessTripList.close();
  }

  BehaviorSubject<BusinessTripResponse> get subjectBusinessTripList =>
      _subjectBusinessTripList;
}

final leaveBloc = LeaveBloc();
