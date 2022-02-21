import 'enum_tree_list_model.dart';

class EnumTreeListResponse {
  bool? isSuccess;
  List<EnumTreeListModel>? list;
  String? error;

  EnumTreeListResponse({this.list});

  EnumTreeListResponse.fromJson(List response)
      : list =
            (response).map((i) => new EnumTreeListModel.fromJson(i)).toList();

  EnumTreeListResponse.withError(String errorValue)
      : list = null,
        error = errorValue;
}
