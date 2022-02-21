import 'package:hr_management/data/models/tag_nts_models/tag_category_response_model.dart';
import 'package:hr_management/data/repositories/tag_repo/abstract_tag_repo.dart';
import 'package:rxdart/rxdart.dart';

class TagBloc {
  final TagRepository _tagRepository = TagRepository();

  // [NOTE]: Can use a Stream controller as well instead of BehaviourSubject.
  final BehaviorSubject<TagCategoryResponseModel> _subjectTagData =
      BehaviorSubject();

  getNTSTagData({
    Map<String, dynamic>? queryparams, // String userId,
  }) async {
    TagCategoryResponseModel response = await _tagRepository.getNTSTagData(
      queryparams: queryparams,
    );
    _subjectTagData.sink.add(response);
  }

  getTagCategoriesWithTag({
    Map<String, dynamic>? queryparams, // String userId,
  }) async {
    TagCategoryResponseModel response =
        await _tagRepository.getTagCategoriesWithTag(
      queryparams: queryparams,
    );
    _subjectTagData.sink.add(response);
  }

  dispose() {
    _subjectTagData.close();
  }
}
