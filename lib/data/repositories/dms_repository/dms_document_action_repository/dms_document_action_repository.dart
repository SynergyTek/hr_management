import 'package:dio/dio.dart';
import 'package:hr_management/data/models/dms/dms_document_action_model/dms_document_action_response.dart';
import '../../../../../constants/api_endpoints.dart';
part 'dms_document_action_repository_implementation.dart';

// Overview of the repository class.
abstract class AbstractDMSDocumentActionRepository {
  AbstractDMSDocumentActionRepository();

  Future<DMSDocumentActionResponse> getArchiveDocumentData();

  Future<DMSDocumentActionResponse> getBinDocumentData();

  Future<DMSDocumentActionResponse> getDocumentHistoryData();

  Future<DMSDocumentActionResponse> getSearchDocumentData();
}
