import 'open_requests_by_category_model.dart';

class OpenRequestsByCategoryResponse {
  List<OpenRequestsByCategoryModel>? data;
  String? error;

  OpenRequestsByCategoryResponse({this.data});

  OpenRequestsByCategoryResponse.fromJson(List response)
      : data = response
            .map((i) => new OpenRequestsByCategoryModel.fromJson(i))
            .toList(),
        error = "";

  OpenRequestsByCategoryResponse.withError(String errorValue)
      : data = null,
        error = errorValue;
}
