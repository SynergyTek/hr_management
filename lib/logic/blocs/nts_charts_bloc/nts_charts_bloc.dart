import 'package:hr_management/data/enums/enums.dart';
import 'package:hr_management/data/models/nts_charts/nts_charts_response.dart';
import 'package:hr_management/data/repositories/nts_charts/abstract_nts_charts_repo.dart';
import 'package:rxdart/rxdart.dart';

class NtsChartBloc {
  final NTSChartRepository _ntsRepository = NTSChartRepository();

  // [NOTE]: Can use a Stream controller as well instead of BehaviourSubject.
  final BehaviorSubject<ChartResponse> _subjectChartByStatus =
      BehaviorSubject<ChartResponse>();

  final BehaviorSubject<ChartResponse> _subjectChartByUserType =
      BehaviorSubject<ChartResponse>();

  final BehaviorSubject<ChartResponse> _subjectDatewiseSLA =
      BehaviorSubject<ChartResponse>();

  getChartByStatus({NTSType ntsType}) async {
    ChartResponse response =
        await _ntsRepository.getChartByStatus(ntsType: ntsType);

    _subjectChartByStatus.sink.add(response);
  }

  getChartByUserType({NTSType ntsType}) async {
    ChartResponse response =
        await _ntsRepository.getChartByUserType(ntsType: ntsType);

    _subjectChartByUserType.sink.add(response);
  }

  getDatewiseSLA({NTSType ntsType, Map<String, dynamic> queryparams}) async {
    ChartResponse response = await _ntsRepository.getDatewiseSLA(
        queryparams: queryparams, ntsType: ntsType);

    _subjectDatewiseSLA.sink.add(response);
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
    _subjectChartByStatus.close();
    _subjectChartByUserType.close();
    _subjectDatewiseSLA.close();
  }

  BehaviorSubject<ChartResponse> get subjectChartByStatus =>
      _subjectChartByStatus;
  BehaviorSubject<ChartResponse> get subjectChartByUserType =>
      _subjectChartByUserType;
  BehaviorSubject<ChartResponse> get subjectDatewiseSLA => _subjectDatewiseSLA;
}

final ntsChartBloc = NtsChartBloc();
