import 'dependent_doc_req_model.dart';
import 'dependent_list_model.dart';

/// APIResponse is a high-level model class which we will consist of a
/// list of APIData and error string if our API call gets failed
/// or returns an error in response.
class ReadDependnetResponse {
  final List<DependentListModel> data;
  String? error;

  ReadDependnetResponse({
    required this.data,
  });

  ReadDependnetResponse.fromJson(List response)
      : data =
            (response).map((i) => new DependentListModel.fromJson(i)).toList();

  ReadDependnetResponse.withError(String errorValue)
      : data = [],
        error = errorValue;
}

class DependnetDocReqResponse {
  final List<DependentDocReqListModel> data;
  String? error;

  DependnetDocReqResponse({
    required this.data,
  });

  DependnetDocReqResponse.fromJson(List response)
      : data = (response)
            .map((i) => new DependentDocReqListModel.fromJson(i))
            .toList();

  DependnetDocReqResponse.withError(String errorValue)
      : data = [],
        error = errorValue;
}
