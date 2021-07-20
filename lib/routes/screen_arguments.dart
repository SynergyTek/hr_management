import 'package:hr_management/data/enums/enums.dart';

class ScreenArguments {
  final String arg1;
  final String arg2;
  final String arg3;
  final String arg4;
  final bool val;
  final Function func;
  final NTSType ntstype;

  ScreenArguments({
    this.ntstype,
    this.arg3,
    this.arg4,
    this.func,
    this.arg1,
    this.arg2,
    this.val,
  });
}
