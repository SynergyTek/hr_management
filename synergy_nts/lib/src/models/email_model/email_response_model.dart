import 'email_model.dart';

class EmailResponseModel {
  final EmailTasksModel? mapdata;
  String? error;

  EmailResponseModel({
    this.mapdata,
  });

  EmailResponseModel.fromJson(Map<String, dynamic> response)
      : mapdata = EmailTasksModel.fromJson(response);

  EmailResponseModel.withError(String errorValue)
      : mapdata = null,
        error = errorValue;
}

