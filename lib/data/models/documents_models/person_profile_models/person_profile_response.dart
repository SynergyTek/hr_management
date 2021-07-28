import 'package:meta/meta.dart';

import 'person_profile_model.dart';

class PersonProfileResponse {
  final List<PersonProfileModel> data;
  String error;

  PersonProfileResponse({
    @required this.data,
  });

  PersonProfileResponse.fromJson(Map<String, dynamic> response)
      : data = []..add(PersonProfileModel.fromJson(response));

  PersonProfileResponse.withError(String errorValue)
      : data = null,
        error = errorValue;
}
