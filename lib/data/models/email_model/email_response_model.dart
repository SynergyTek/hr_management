import 'email_model.dart';

class EmailTasksResponseModel {
  final EmailTasksModel? mapdata;
  String? error;

  EmailTasksResponseModel({
    this.mapdata,
  });

  EmailTasksResponseModel.fromJson(Map<String, dynamic> response)
      : mapdata = EmailTasksModel.fromJson(response);

  EmailTasksResponseModel.withError(String errorValue)
      : mapdata = null,
        error = errorValue;
}
