import 'request_type_model.dart';

class RequestTypeListResponse {
  bool? isSuccess;
  List<RequestTypeModel>? list;
  String? error;

  RequestTypeListResponse({this.list});

  RequestTypeListResponse.fromJson(List response)
      : list = (response).map((i) => RequestTypeModel.fromJson(i)).toList();

  RequestTypeListResponse.withError(String errorValue)
      : list = null,
        error = errorValue;
}
