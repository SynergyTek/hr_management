import 'package:dio/dio.dart';
import 'package:hr_management/constants/api_endpoints.dart';
import 'package:hr_management/data/models/share_models/note_shared_models/note_shared_data_response.dart';
import 'package:hr_management/data/models/share_models/sevice_shared_models/service_shared_data_response.dart';
import 'package:hr_management/data/models/share_models/task_shared_models/task_shared_data_response.dart';

part 'share_repo.dart';

abstract class AbstractShareRepository {
  AbstractShareRepository();

  Future<ServiceSharedDataResponse> getServiceSharedData({
    Map<String, dynamic> queryparams,
  });

  Future<TaskSharedDataResponse> getTaskSharedData({
    Map<String, dynamic> queryparams,
  });

  Future<NoteSharedDataResponse> getNoteSharedData({
    Map<String, dynamic> queryparams,
  });

  Future deleteServiceShared({
    Map<String, dynamic> queryparams,
  });

  Future deleteTaskShared({
    Map<String, dynamic> queryparams,
  });

  Future deleteNoteShared({
    Map<String, dynamic> queryparams,
  });

  Future postShareService({
    Map<String, dynamic> queryparams,
  });

  Future postShareTask({
    Map<String, dynamic> queryparams,
  });

  Future postShareNote({
    Map<String, dynamic> queryparams,
  });
}
