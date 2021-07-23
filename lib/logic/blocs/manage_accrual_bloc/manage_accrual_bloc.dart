import '../../../data/models/manage_accural/manage_accrual_res_model.dart';
import '../../../data/repositories/manage_accrual_repo/abstract_manage_accrual_repo.dart';
import 'package:rxdart/rxdart.dart';

class ManageAccrualBloc {
  final ManageAccrualRepository _manageAccrualRepository =
      ManageAccrualRepository();

  final BehaviorSubject<ManageAccrualResponse> _subjectManageAccrual =
      BehaviorSubject<ManageAccrualResponse>();

  getManageAccrual({legalEntityId}) async {
    Map<String, dynamic> queryparams = Map();
    queryparams["legalEntityId"] = legalEntityId ?? '';
    ManageAccrualResponse response = await _manageAccrualRepository
        .getManageAccrual(queryparams: queryparams);
    _subjectManageAccrual.sink.add(response);
  }

  dispose() {
    _subjectManageAccrual.close();
  }

  BehaviorSubject<ManageAccrualResponse> get subjectManageAccrual =>
      _subjectManageAccrual;
}

final manageAccrualBloc = ManageAccrualBloc();
