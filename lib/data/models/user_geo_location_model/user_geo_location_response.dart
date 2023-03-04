import 'package:hr_management/data/models/user_geo_location_model/user_geo_location_model.dart';

class UserGeolocationResponse {
  final List<UserGeolocationModel>? data;
  String? error;

  UserGeolocationResponse({
    required this.data,
  });

  UserGeolocationResponse.fromJson(List response)
      : data = (response)
            .map(
              (i) => UserGeolocationModel.fromJson(i),
            )
            .toList();

  UserGeolocationResponse.withError(String errorValue)
      : data = null,
        error = errorValue;
}
