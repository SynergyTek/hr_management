import 'package:dio/dio.dart';

import '../../constants/api_endpoints.dart';
import '../../models/tag_nts_models/tag_category_response_model.dart';

part 'tag_repo.dart';

abstract class AbstractTagRepository {
  Future<TagCategoryResponseModel> getNTSTagData(
      {Map<String, dynamic>? queryparams});

  Future<TagCategoryResponseModel> getTagCategoriesWithTag({
    Map<String, dynamic>? queryparams,
  });
}
