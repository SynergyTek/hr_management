import 'package:hr_management/data/models/business_trip_model/business_trip_response_model.dart';
import 'package:rxdart/rxdart.dart';

import '../../data/repositories/leave/abstract_leave_repo.dart';

class LeaveBloc {
  final LeaveRepository _leaveRepository = LeaveRepository();

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
