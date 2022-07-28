import 'tag_category_view_model.dart';

class TagCategoryResponseModel {
  List<TagCategoryViewModel>? data;
  String? error;

  TagCategoryResponseModel({
    required this.data,
  });

  TagCategoryResponseModel.fromJson(List response)
      : data = (response).map((i) => TagCategoryViewModel.fromJson(i)).toList(),
        error = null;

  TagCategoryResponseModel.withError(String errorValue)
      : data = null,
        error = errorValue;
}
