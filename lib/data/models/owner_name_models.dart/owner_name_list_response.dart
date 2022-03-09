import 'owner_name_list_model.dart';

class OwnerNameListResponse {
  bool? isSuccess;
  List<OwnerNameListModel>? list;
  String? error;

  OwnerNameListResponse({this.list});

  OwnerNameListResponse.fromJson(List response)
      : list = (response).map((i) => new OwnerNameListModel.fromJson(i)).toList();

  OwnerNameListResponse.withError(String errorValue)
      : list = null,
        error = errorValue;
}
