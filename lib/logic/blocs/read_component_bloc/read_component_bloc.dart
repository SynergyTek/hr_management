import 'package:hr_management/data/models/read_component_data_model/read_component_resp.dart';
import 'package:hr_management/data/repositories/read_component_repo/abstract_read_component_repo.dart';
import 'package:rxdart/rxdart.dart';

class ReadComponentBloc {
  final ReadComponentRepository _userRepository = ReadComponentRepository();

  final BehaviorSubject<ReadComponentResponse> _subjectReadComponent =
      BehaviorSubject<ReadComponentResponse>();

  readComponentData({
    Map<String, dynamic> queryparams,
  }) async {
    ReadComponentResponse response =
        await _userRepository.readComponentData(queryparams: queryparams);
    _subjectReadComponent.sink.add(response);
  }

  BehaviorSubject<ReadComponentResponse> get subjectUserDataList =>
      _subjectReadComponent;

  dispose() {
    _subjectReadComponent.close();
  }
}

final readComponentBLoc = ReadComponentBloc();
