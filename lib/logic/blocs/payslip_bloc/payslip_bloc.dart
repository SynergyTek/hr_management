import 'package:rxdart/rxdart.dart';

import '../../../data/models/payslip/payslip_res_model.dart';
import '../../../data/repositories/payslip/abstract_payslip_repo.dart';

class PayslipBloc {
  final PayslipRepository _manageAccrualRepository = PayslipRepository();

  final BehaviorSubject<PayslipResponse> _subjectPayslip =
      BehaviorSubject<PayslipResponse>();

  getManageAccrual({
    Map<String, dynamic>? queryparams,
  }) async {
    PayslipResponse response = await _manageAccrualRepository.getPaylsipList(
      queryparams: queryparams,
    );

    _subjectPayslip.sink.add(response);
  }

  dispose() {
    _subjectPayslip.close();
  }

  BehaviorSubject<PayslipResponse> get subjectPayslip => _subjectPayslip;
}

final payslipBloc = PayslipBloc();
