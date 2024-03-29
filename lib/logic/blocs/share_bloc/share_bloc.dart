// import '../../../data/enums/enums.dart';
import '../../../data/models/api_models/post_response_model.dart'
    as postResponseModel;
import '../../../data/models/share_models/note_shared_models/note_shared_data_response.dart';
import '../../../data/models/share_models/sevice_shared_models/service_shared_data_response.dart';
import '../../../data/models/share_models/task_shared_models/task_shared_data_response.dart';
import '../../../data/models/share_post_model/note_share_post_model/note_share_post_model.dart';
import '../../../data/models/share_post_model/service_share_post_model/service_share_post_model.dart';
import '../../../data/models/share_post_model/task_share_post_model/task_share_post_model.dart';
import '../../../data/repositories/share_repo/abstract_share_repo.dart';
import 'package:rxdart/rxdart.dart';
import 'package:synergy_nts/synergy_nts.dart';

class ShareBloc {
  final ShareRepository _shareRepository = ShareRepository();

  final BehaviorSubject<ServiceSharedDataResponse> _subjectServiceSharedData =
      BehaviorSubject<ServiceSharedDataResponse>();

  final BehaviorSubject<TaskSharedDataResponse> _subjectTaskSharedData =
      BehaviorSubject<TaskSharedDataResponse>();

  final BehaviorSubject<NoteSharedDataResponse> _subjectNoteSharedData =
      BehaviorSubject<NoteSharedDataResponse>();

  getNTSSharedData({
    Map<String, dynamic>? queryparams,
    NTSType? ntsType,
  }) async {
    if (ntsType == NTSType.service) {
      ServiceSharedDataResponse response =
          await _shareRepository.getServiceSharedData(queryparams: queryparams);
      _subjectServiceSharedData.sink.add(response);
    } else if (ntsType == NTSType.task) {
      TaskSharedDataResponse response =
          await _shareRepository.getTaskSharedData(queryparams: queryparams);
      _subjectTaskSharedData.sink.add(response);
    } else if (ntsType == NTSType.note) {
      NoteSharedDataResponse response =
          await _shareRepository.getNoteSharedData(queryparams: queryparams);
      _subjectNoteSharedData.sink.add(response);
    }
  }

  deleteNTSSharedData({
    Map<String, dynamic>? queryparams,
    NTSType? ntsType,
  }) async {
    if (ntsType == NTSType.service) {
      // ServiceSharedDataResponse response =
      await _shareRepository.deleteServiceShared(queryparams: queryparams);
      // _subjectServiceSharedData.sink.add(response);
    } else if (ntsType == NTSType.task) {
      // TaskSharedDataResponse response =
      await _shareRepository.deleteTaskShared(queryparams: queryparams);
      // _subjectTaskSharedData.sink.add(response);
    } else if (ntsType == NTSType.note) {
      // NoteSharedDataResponse response =
      await _shareRepository.deleteNoteShared(queryparams: queryparams);
      // _subjectNoteSharedData.sink.add(response);
    }
  }

  Future<postResponseModel.PostResponse?> postNTSSharedData({
    Map<String, dynamic>? queryparams,
    NTSType? ntsType,
    NoteSharePostModel? noteData,
    TaskSharePostModel? taskData,
    ServiceSharePostModel? serviceData,
  }) async {
    postResponseModel.PostResponse? response;
    if (ntsType == NTSType.service) {
      response = await _shareRepository.postShareService(
          queryparams: queryparams, data: serviceData!);
    } else if (ntsType == NTSType.task) {
      response = await _shareRepository.postShareTask(
          queryparams: queryparams, data: taskData!);
    } else if (ntsType == NTSType.note) {
      response = await _shareRepository.postShareNote(
          queryparams: queryparams, data: noteData!);
    }
    return response;
  }

  dispose() {
    _subjectServiceSharedData.close();
    _subjectTaskSharedData.close();
    _subjectNoteSharedData.close();
  }
}

final shareBloc = ShareBloc();
