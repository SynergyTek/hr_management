import 'package:hr_management/ui/widgets/custom_controls/attachment.dart';

import '../data/enums/enums.dart';

class ScreenArguments {
  final String arg1;
  final String arg2;
  final String arg3;
  final String arg4;
  final bool val1;
  final bool val2;
  final bool showBack;
  final Function func;
  final NTSType ntstype;
  OnTapPressedCallBack callBack;

  ScreenArguments(
      {this.ntstype,
      this.arg3,
      this.arg4,
      this.func,
      this.arg1,
      this.arg2,
      this.val1,
      this.val2,
      this.showBack,
      this.callBack});
}
