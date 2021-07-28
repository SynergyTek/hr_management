import 'package:hr_management/data/models/dependent/dependent_res_model.dart';
import 'package:hr_management/data/repositories/dependent/abstract_dependent_repo.dart';
import 'package:rxdart/rxdart.dart';

class DependentAPIBloc {
  final DependentRepository _apiRepository = DependentRepository();

  // [NOTE]: Can use a Stream controller as well instead of BehaviourSubject.
  final BehaviorSubject<ReadDependnetResponse> _subjectReadDependnetResponse =
      BehaviorSubject<ReadDependnetResponse>();

  final BehaviorSubject<DependnetDocReqResponse>
      _subjectDependnetDocReqResponse =
      BehaviorSubject<DependnetDocReqResponse>();

  /// Used to fetch new entries.
  getReadDependantList() async {
    ReadDependnetResponse response =
        await _apiRepository.getReadDependantList();

    _subjectReadDependnetResponse.sink.add(response);
  }

  /// Used to fetch new entries.
  getReadDependnetDocReqResponse() async {
    DependnetDocReqResponse response =
        await _apiRepository.getReadDependantDocumentRequestList();

    _subjectDependnetDocReqResponse.sink.add(response);
  }

  dispose() {
    _subjectReadDependnetResponse.close();
    _subjectDependnetDocReqResponse.close();
  }

  BehaviorSubject<ReadDependnetResponse> get subjectReadDependnetResponse =>
      _subjectReadDependnetResponse;

  BehaviorSubject<DependnetDocReqResponse> get subjectDependnetDocReqResponse =>
      _subjectDependnetDocReqResponse;
}

final dependentBloc = DependentAPIBloc();
