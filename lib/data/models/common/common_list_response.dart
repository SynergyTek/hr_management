import 'common_list_model.dart';

class CommonListResponse {
  bool? isSuccess;
  List<CommonListModel>? list;
  String? error;

  CommonListResponse({this.list});

  CommonListResponse.fromJson(List response)
      : list = (response).map((i) => new CommonListModel.fromJson(i)).toList();

  CommonListResponse.withError(String errorValue)
      : list = null,
        error = errorValue;
}
