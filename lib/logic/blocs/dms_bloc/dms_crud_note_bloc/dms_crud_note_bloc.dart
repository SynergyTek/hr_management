import 'package:flutter/cupertino.dart';
import 'package:hr_management/data/models/dms/dms_post_model.dart';
import 'package:hr_management/data/models/dms/file_operation_model/file_operation_model.dart';
import 'package:hr_management/data/repositories/dms_repository/dms_crud_note_repository/dms_crud_note_repository.dart';
import 'package:rxdart/rxdart.dart';

class DMSCrudNoteBloc {
  final DMSCRUDNoteRepository _apiRepository = DMSCRUDNoteRepository();

  final BehaviorSubject _archiveNoteSubject = BehaviorSubject();
  final BehaviorSubject _copyNoteSubject = BehaviorSubject();
  final BehaviorSubject _createNoteSubject = BehaviorSubject();
  final BehaviorSubject _deleteNoteSubject = BehaviorSubject();
  final BehaviorSubject _moveNoteSubject = BehaviorSubject();
  final BehaviorSubject _renameNoteSubject = BehaviorSubject();

  final BehaviorSubject _searchFileSubject = BehaviorSubject();

  getArchiveNoteAPIData({
    required String? id,
  }) async {
    dynamic response = await _apiRepository.getArchiveNoteAPIData(
      id: id,
    );

    _archiveNoteSubject.sink.add(response);
  }

  getCopyNoteAPIData({
    required String? sourceId,
    required String? targetId,
    required String userId,
  }) async {
    dynamic response = await _apiRepository.getCopyNoteAPIData(
      sourceId: sourceId,
      targetId: targetId,
      userId: userId,
    );

    _copyNoteSubject.sink.add(response);
  }

  getCreateNoteAPIData({
    required String sourceId,
    required String targetId,
    required String userId,
  }) async {
    dynamic response = await _apiRepository.getCreateNoteAPIData(
      sourceId: sourceId,
      targetId: targetId,
      userId: userId,
    );

    _createNoteSubject.sink.add(response);
  }

  getDeleteNoteAPIData({
    required String? id,
  }) async {
    dynamic response = await _apiRepository.getDeleteNoteAPIData(
      id: id,
    );

    _deleteNoteSubject.sink.add(response);
  }

  getMoveNoteAPIData({
    required String? sourceId,
    required String? targetId,
  }) async {
    dynamic response = await _apiRepository.getMoveNoteAPIData(
      sourceId: sourceId,
      targetId: targetId,
    );

    _moveNoteSubject.sink.add(response);
  }

  getRenameFilesAPIData({
    required DmsPostModel model,
  }) async {
    dynamic response = await _apiRepository.getRenameFilesAPIData(
      model: model,
    );

    _renameNoteSubject.sink.add(response);
  }

  postSearchFilesAPIData({
    required DmsPostModel model,
  }) async {
    dynamic response = await _apiRepository.postSearchFilesAPIData(
      model: model,
    );

    _searchFileSubject.sink.add(response);
  }

  dispose() {
    _archiveNoteSubject.close();
    _copyNoteSubject.close();
    _createNoteSubject.close();
    _deleteNoteSubject.close();
    _moveNoteSubject.close();
    _renameNoteSubject.close();

    _searchFileSubject.close();
  }

  BehaviorSubject get archiveNoteSubject => _archiveNoteSubject;
  BehaviorSubject get copyNoteSubject => _copyNoteSubject;
  BehaviorSubject get createNoteSubject => _createNoteSubject;
  BehaviorSubject get deleteNoteSubject => _deleteNoteSubject;
  BehaviorSubject get moveNoteSubject => _moveNoteSubject;
  BehaviorSubject get renameNoteSubject => _renameNoteSubject;

  BehaviorSubject get searchFileSubject => _searchFileSubject;
}

final dmsCrudNoteBloc = DMSCrudNoteBloc();
