import 'package:rxdart/rxdart.dart';

// import '../../../data/enums/enums.dart';
import '../../../data/models/nts_template_models/nts_template_response.dart';
import '../../../data/repositories/nts_template_repository/nts_template_repository.dart';
import 'package:synergy_nts/synergy_nts.dart';

class NTSTemplateBloc {
  final NTSTemplateRepository _apiRepository = NTSTemplateRepository();

  // [NOTE]: Can use a Stream controller as well instead of BehaviourSubject.
  final BehaviorSubject<NTSTemplateResponse?> _subject =
      BehaviorSubject<NTSTemplateResponse?>();

  /// Used to fetch new entries.
  getData({
    String? userid,
    String? categoryCode,
    NTSType? ntsType,
  }) async {
    Map<String, dynamic> queryparams = Map();

    if (ntsType == NTSType.service) {
      _subject.sink.add(null);
      queryparams = {
        "templateType": "Service",
        "categoryCode":
            "Employee_Service,Leave,CHR,HR_DOCUMENTS,CMS_SEBI_INT,TMSUSERMGMT,Dependent Documents,PersonDocuments,Separation,TimePermission"
      };
    } else if (ntsType == NTSType.task) {
      _subject.sink.add(null);
      queryparams = {
        "categoryCode": "", //categoryCode,
        "templateType": "Task",
        "taskType": "StandardTask"
      };
    } else if (ntsType == NTSType.note) {
      // } else if (ntsType == NTSType.note && categoryCode == 'Document') {
      _subject.sink.add(null);
      queryparams = {
        "templateType": "Note",
        // "categoryCode": "", //categoryCode,
        "categoryCode": categoryCode ?? "", //categoryCode,
      };
    }

    queryparams['userid'] = userid;

    NTSTemplateResponse response = await _apiRepository.getAPIData(
      queryparams: queryparams,
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
    getData();
  }

  /// Used to delete a particular entry.
  deleteData() async {
    // Delete here
    // ...

    // Update the list (in UI) with the getAPI call.
    getData();
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<NTSTemplateResponse?> get subject => _subject;
}

final ntsTemplateBloc = NTSTemplateBloc();
