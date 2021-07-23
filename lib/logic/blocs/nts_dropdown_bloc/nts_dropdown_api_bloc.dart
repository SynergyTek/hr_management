import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../../../data/models/nts_dropdown/nts_dd_res_model.dart';
import '../../../data/repositories/nts_dropdown_repo/nts_dropdown_repo.dart';

class NTSDdAPIBloc {
  final NTSDdRepository _apiRepository = NTSDdRepository();

  // [NOTE]: Can use a Stream controller as well instead of BehaviourSubject.
  final BehaviorSubject<NTSDdResponse> _subject =
      BehaviorSubject<NTSDdResponse>();

  /// Used to fetch new entries.
  getData({
    @required String url,
    @required String idKey,
    @required String nameKey,
  }) async {
    NTSDdResponse response = await _apiRepository.getdynamicUrlData(
      url: url,
      idKey: idKey,
      nameKey: nameKey,
    );
    _subject.sink.add(response);
  }

  /// Used to create new entries.
  postData() async {}

  /// Used to update an existing entry.
  putData() async {
    // Update here
    // ...

    // Update the list (in UI) with the getAPI call.
    // getData();
  }

  /// Used to delete a particular entry.
  deleteData() async {
    // Delete here
    // ...

    // Update the list (in UI) with the getAPI call.
    // getData();
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<NTSDdResponse> get subject => _subject;
}

final ntsDdBloc = NTSDdAPIBloc();
