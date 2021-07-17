import 'package:hr_management/data/enums/enums.dart';
import 'package:hr_management/data/models/api_models/post_response_model.dart';
import 'package:hr_management/data/models/nts_charts/nts_charts_response.dart';
import 'package:hr_management/data/repositories/nts_Charts/abstract_nts_Charts_repo.dart';
import 'package:rxdart/rxdart.dart';

class NtsChartBloc {
  final NTSChartRepository _ntsRepository = NTSChartRepository();

  // [NOTE]: Can use a Stream controller as well instead of BehaviourSubject.
  final BehaviorSubject<ChartResponse> _subject =
      BehaviorSubject<ChartResponse>();

  getChartByStatus({NTSType ntsType}) async {
    ChartResponse response =
        await _ntsRepository.getChartByStatus(ntsType: ntsType);

    _subject.sink.add(response);
  }

  
  getChartByUserType({NTSType ntsType}) async {
    ChartResponse response =await _ntsRepository.getChartByUserType(ntsType: ntsType);

    _subject.sink.add(response);
  }

  
  getDatewiseSLA({NTSType ntsType}) async {
    ChartResponse response =
        await _ntsRepository.getDatewiseSLA(ntsType: ntsType);

    _subject.sink.add(response);
  }

  /// Used to update an existing entry.
  putData() async {
    // Update here
    // ...

    // Update the list (in UI) with the getChart call.
    // getData();
  }

  /// Used to delete a particular entry.
  deleteData() async {
    // Delete here
    // ...

    // Update the list (in UI) with the getChart call.
    // getData();
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<ChartResponse> get subject => _subject;
}

final ntsChartBloc = NtsChartBloc();
