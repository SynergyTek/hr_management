import 'common_list_model.dart';

class CommonListResponse {
  List<CommonListModel>? list;
  String? error;

  CommonListResponse({this.list});

  CommonListResponse.fromJson(List response)
      : list = (response).map((i) =>  CommonListModel.fromJson(i)).toList();

  CommonListResponse.withError(String errorValue)
      : list = null,
        error = errorValue;
}
