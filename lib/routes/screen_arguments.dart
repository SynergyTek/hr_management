import 'package:hr_management/data/models/dms/dms_source_folder_model/dms_source_folder_model.dart';
// import 'package:hr_management/ui/widgets/custom_controls/attachment.dart';

// import '../data/enums/enums.dart';
import '../data/models/work_book_models/get_note_book_report_model.dart';
import 'package:synergy_nts/synergy_nts.dart';

class ScreenArguments {
  final String? arg1;
  final String? arg2;
  final String? arg3;
  final String? arg4;
  final int? num;
  final bool? val1;
  final bool? val2;
  final bool? showBack;
  final Function? func;
  final NTSType? ntstype;
  final PortalType? portalType;
  OnTapPressedCallBack? callBack;
  final DMSSourceFolderModel? dmsParentModel;
  final List<DMSSourceFolderModel>? dmsParentModelList;
  // final Cwd? dmsParentModel;
  // final List<Cwd>? dmsParentModelList;
  final List<String?>? list1;
  final List<String>? list2;
  final dynamic dynamicArgument;
  final List<NtsItem>? workbookReferenceList; //For moving workbooks

  ScreenArguments({
    this.arg1,
    this.arg2,
    this.arg3,
    this.arg4,
    this.num,
    this.val1,
    this.val2,
    this.showBack,
    this.func,
    this.ntstype,
    this.portalType,
    this.callBack,
    this.dmsParentModel,
    this.dmsParentModelList,
    this.list1,
    this.list2,
    this.dynamicArgument,
    this.workbookReferenceList,
  });
}
