import 'read_help_desk_request_closed_model.dart';

class ReadHelpDeskRequestClosedResponse {
  bool isSuccess;
  ReadHelpDeskRequestClosedModel data;
  String error;

  ReadHelpDeskRequestClosedResponse({this.data});

  ReadHelpDeskRequestClosedResponse.fromJson(Map<String, dynamic> response)
      : data = ReadHelpDeskRequestClosedModel.fromJson(response);

  ReadHelpDeskRequestClosedResponse.withError(String errorValue)
      : data = null,
        error = errorValue;
}
