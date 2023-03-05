import 'package:hr_management/data/models/roaster_scheduler_list_model/roaster_scheduler_list_model.dart';

class RoasterSchedulerListResponse {
  final List<RoasterSchedulerListModel>? data;
  String? error;

  RoasterSchedulerListResponse({
    required this.data,
  });

  RoasterSchedulerListResponse.fromJson(List response)
      : data = (response)
            .map(
              (i) => RoasterSchedulerListModel.fromJson(i),
            )
            .toList();

  RoasterSchedulerListResponse.withError(String errorValue)
      : data = null,
        error = errorValue;
}
