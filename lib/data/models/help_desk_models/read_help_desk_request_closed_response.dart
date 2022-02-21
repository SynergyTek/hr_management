import 'read_help_desk_request_closed_model.dart';

class ReadHelpDeskRequestClosedResponse {
  List<ReadHelpDeskRequestClosedModel>? data;
  String? error;

  ReadHelpDeskRequestClosedResponse({this.data});

  ReadHelpDeskRequestClosedResponse.fromJson(List response)
      : data = response
            .map((i) => new ReadHelpDeskRequestClosedModel.fromJson(i))
            .toList(),
        error = "";

  ReadHelpDeskRequestClosedResponse.withError(String errorValue)
      : data = null,
        error = errorValue;
}
