import 'package:hr_management/data/enums/enums.dart';
import 'package:hr_management/data/models/login_models/portal_view_model.dart';

class PortalViewResponse {
  String? error;
  List<PortalViewModel> data;

  PortalViewResponse({
    required this.data,
  });

  PortalViewResponse.fromJson(List response)
      : data = response.map((i) => new PortalViewModel.fromJson(i)).toList(),
        error = "";

  PortalViewResponse.withError(String errorValue)
      : data = [],
        error = errorValue;
}
