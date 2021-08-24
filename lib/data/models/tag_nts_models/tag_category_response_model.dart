import 'package:flutter/material.dart';
import 'package:hr_management/data/models/tag_nts_models/tag_category_view_model.dart';


class TagCategoryResponseModel {
  final TagCategoryViewModel data;
  String error;

  TagCategoryResponseModel({
    @required this.data,
  });

  TagCategoryResponseModel.fromJson(Map<String, dynamic> response)
      : data = TagCategoryViewModel.fromJson(response);

  TagCategoryResponseModel.withError(String errorValue)
      : data = null,
        error = errorValue;
}
