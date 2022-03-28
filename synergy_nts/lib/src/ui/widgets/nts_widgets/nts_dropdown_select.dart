import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:synergy_nts/src/bloc/user_bloc/abstract_user_bloc.dart';
import 'package:synergy_nts/src/ui/widgets/form_widgets/team_dropdown_list.dart';

import '../../../bloc/common_bloc/abstract_common_bloc.dart';
import '../../../bloc/nts_dropdown_bloc/abstract_nts_dropdown_bloc.dart';
import '../../../models/common_model/common_list_model.dart';
import '../../../models/user_model/read_hierarchy_model.dart';
import '../../../models/user_model/team_model.dart';
import '../default_dropdown_list.dart';
import '../form_widgets/user_dropdown_list.dart';
import '../../../models/nts_dropdown_model/nts_dropdown_model.dart';
import '../../../theme/app_colors.dart';
import '../multiselect_dropdown_list.dart';

typedef ListTapPressedCallBack = void Function(dynamic key);

class NTSDropDownSelect extends StatelessWidget {
  final String? title;
  final bool? isShowArrow;
  final bool? isUserList;
  final bool? isTeamList;
  final bool? isReadonly;
  final bool? isRequired;
  final String? hint;
  final String? validationMessage;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final FormFieldValidator<String>? validator;
  final String? url;
  final String? idKey;
  final String? typeKey;
  final String? nameKey;
  final ListTapPressedCallBack? onListTap;
  final bool? multiple;
  final List<NTSDropdownModel>? dropdownValues;
  final List<CommonListModel>? commonListValues;
  final List<ReadTeamDataModel>? teamListValues;
  final List<User>? userListValues;
  final List<ReadUserHierarchyModel>? userHierarchyListValues;
  final List<String>? multiSelectDropdownValues;

  const NTSDropDownSelect({
    Key? key,
    this.title = "",
    this.isShowArrow,
    this.isUserList,
    this.isTeamList,
    this.isReadonly,
    this.isRequired,
    this.hint,
    this.validationMessage,
    this.controller,
    this.prefixIcon,
    this.validator,
    this.onListTap,
    this.url,
    this.idKey,
    this.typeKey,
    this.nameKey,
    this.dropdownValues,
    this.commonListValues,
    this.teamListValues,
    this.userListValues,
    this.userHierarchyListValues,
    this.multiSelectDropdownValues,
    this.multiple = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 2.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: title!.length > 30
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 2.w,
            ),
            (prefixIcon != null)
                ? prefixIcon!
                : const Icon(
                    Icons.select_all,
                    color: AppThemeColor.iconColor,
                  ),
            SizedBox(
              width: 3.w,
            ),
            (isRequired != null && isRequired == true)
                ? Text(
                    '*',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 25,
                    ),
                  )
                : const SizedBox(
                    // width: 2.w,
                    ),
            SizedBox(
              width: 1.w,
            ),
            Expanded(
              child: Text(
                title ?? '',
                style: TextStyle(
                  fontSize: 11.sp,
                ),
              ),
            ),
          ],
        ),
        Container(
          alignment: Alignment.bottomLeft,
          height: multiple! ? 11.h : 6.h,
          color: isReadonly.toString() == 'true' ? Colors.grey.shade200 : null,
          child: Stack(
            children: <Widget>[
              TextFormField(
                maxLines: multiple! ? 3 : 1,
                minLines: 1,
                style: const TextStyle(
                  fontSize: 16.0,
                  overflow: TextOverflow.ellipsis,
                ),
                controller: controller,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(
                    top: 15,
                    bottom: 10,
                    left: 54,
                  ),
                  labelStyle: const TextStyle(fontSize: 16.0),
                  suffixIcon: isShowArrow!
                      ? const Icon(Icons.keyboard_arrow_right)
                      : null,
                  errorStyle: const TextStyle(fontSize: 11.0),
                ),
                validator: validator ??
                    (val) =>
                        (val == null || val.isEmpty) ? validationMessage : null,
                onSaved: (String? value) {
                  controller!.text = value!;
                },
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: isReadonly.toString() == 'true'
                    ? () {}
                    : () {
                        ntsDdBloc.subject.sink.add(null);
                        if (isUserList != null && isUserList!) {
                          // Navigator.pushNamed(
                          //   context,
                          //   NTS_USER_DROPDOWN,
                          //   arguments: ScreenArguments(
                          //     func1: onListTap,
                          //   ),
                          // );

                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => UserDropDownList(
                                onListTap: onListTap,
                              ),
                            ),
                          );
                        }
                        if (isTeamList != null && isTeamList!) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => TeamDropdownList(
                                onListTap: onListTap,
                              ),
                            ),
                          );
                        } else if (url ==
                            "cms/query/GetLOVIdNameList?lovType=EGOV_ELECTORAL_WARD") {
                          getWardList(context);
                        } else if (multiple == true) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => MultiselectDropDownList(
                                url: url,
                                idKey: idKey,
                                nameKey: nameKey,
                                ddName: title,
                                typeKey: typeKey,
                                onListTap: onListTap,
                                dynamicList: dropdownValues,
                                multiSelectDropdownValues:
                                    multiSelectDropdownValues,
                              ),
                            ),
                          );

                          // Navigator.pushNamed(
                          //   context,
                          //   NTS_DROPDOWN_MULISELECT,
                          //   arguments: ScreenArguments(
                          //     arg1: url,
                          //     arg2: idKey,
                          //     arg3: nameKey,
                          //     arg4: title,
                          //     arg5: typeKey,
                          //     func1: onListTap,
                          //     dynamicList: dropdownValues,
                          //   ),
                          // );

                          // displaySnackBar(
                          //     text:
                          //         'Long Press on item to select mulitple items from list',
                          //     duration: 3,
                          //     context: context);
                        } else {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => DropDownDefaultList(
                                url: url,
                                idKey: idKey,
                                nameKey: nameKey,
                                ddName: title,
                                typeKey: typeKey,
                                onListTap: onListTap,
                                dynamicList: dropdownValues ?? [],
                                commonList: commonListValues ?? [],
                                teamList: teamListValues ?? [],
                                userList: userListValues ?? [],
                                userHierarchyList:
                                    userHierarchyListValues ?? [],
                                // dynamicList: dropdownValues,
                              ),
                            ),
                          );

                          // Navigator.pushNamed(
                          //   context,
                          //   NTS_DROPDOWN,
                          //   arguments: ScreenArguments(
                          //     arg1: url,
                          //     arg2: idKey,
                          //     arg3: nameKey,
                          //     arg4: title,
                          //     arg5: typeKey,
                          //     func1: onListTap,
                          //     dynamicList: dropdownValues,
                          //   ),
                          // );
                        }
                      },
              )
            ],
          ),
        ),
      ],
    );
  }

  getWardList(context) async {
    await commonBloc.getLOVIdNameList(
      queryparams: {
        'lovType': 'EGOV_ELECTORAL_WARD',
      },
    ).then(
      (value) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => DropDownDefaultList(
            url: url,
            idKey: idKey,
            nameKey: nameKey,
            ddName: title,
            typeKey: typeKey,
            onListTap: onListTap,
            dynamicList: dropdownValues,
            commonList: value.list,
          ),
        ),
      ),
    );
  }
}
