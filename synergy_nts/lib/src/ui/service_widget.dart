import 'dart:convert';

import 'package:flutter/material.dart';

// Others
import '../../synergy_nts.dart';
import '../bloc/common_bloc/abstract_common_bloc.dart';
import '../bloc/nts_dropdown_bloc/abstract_nts_dropdown_bloc.dart';
import '../constants/api_endpoints.dart';

// Widgets/UI:
import '../helpers/multiselectList_helper.dart';
import '../helpers/validation_helper.dart';
import '../models/common_model/common_list_model.dart';
import '../models/nts_dropdown_model/nts_dropdown_model.dart';
import '../models/udf_models/udf_json_model.dart';
import '../ui/map_widgets/google_maps_current_location_widget.dart';

// Helpers:
import '../helpers/parse_json_helper.dart';
import '../helpers/download_helper/download.dart';

// Packages:
import 'package:dio/dio.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:sizer/sizer.dart';

import 'task_widgets/step_task_widgets/step_task_list_screen.dart';
import 'widgets/form_widgets.dart';
import 'widgets/form_widgets/attachment.dart';
import 'widgets/widgets.dart';

class ServiceWidget extends StatefulWidget {
  final String userID;
  final bool isEmployeePortal;
  final String serviceId;
  final String templateCode;
  final Map<String, dynamic>? extraInformationMap;
  final bool? isEmployeeService;
  final String? categoryCode;

  const ServiceWidget({
    Key? key,
    required this.userID,
    this.isEmployeePortal = false,
    required this.serviceId,
    required this.templateCode,
    this.categoryCode = '',
    this.isEmployeeService,
    this.extraInformationMap,
  }) : super(key: key);

  @override
  State<ServiceWidget> createState() => _ServiceWidgetState();
}

class _ServiceWidgetState extends State<ServiceWidget> {
  bool isVisible = false;
  Service? serviceModel;
  int? noOfConnectionsValue = 1;
  int? truckLoadTrips = 1;

  @override
  void initState() {
    super.initState();
    serviceBloc.getServiceDetail(
      queryparams: _handleQueryParams(),
    );
  }

  _handleQueryParams() {
    return {
      'templatecode': widget.templateCode,
      'serviceId': widget.serviceId,
      'userId': widget.userID,
    };
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateServiceFormBloc(),
      child: StreamBuilder<ServiceResponse?>(
          stream: serviceBloc.subject.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data?.error != null &&
                  snapshot.data!.error!.isNotEmpty) {
                return Center(
                  child: Text(snapshot.data!.error!),
                );
              }
              serviceModel = snapshot.data?.data;

              final createServiceFormBloc =
                  context.read<CreateServiceFormBloc>();

              //! hardcoding UNDO
              // if (serviceModel!.json != null) {
              //   if (snapshot.data?.data?.templateCode ==
              //       'EGOV_PUBLIC_GRIEVANCE_REGISTRATION') {
              //     isLocationRequired = true;
              //   }
              // }

              _parseJsonToUDFModel(
                createServiceFormBloc,
                serviceModel?.json,
                widget.templateCode,
              );

              return FormBlocListener<CreateServiceFormBloc, String, String>(
                onSubmitting: (context, state) {},
                onSuccess: (context, state) {},
                onFailure: (context, state) {},
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        physics: const ClampingScrollPhysics(),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: _formFieldsWidgets(
                            context,
                            createServiceFormBloc,
                          ),
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          Expanded(child: Container()),
                          Container(
                            height: 50,
                            color: AppThemeColor.backgroundColor,
                            child: _displayFooterWidget(
                              createServiceFormBloc,
                            ),
                          ),
                        ],
                      ),
                      Visibility(
                        visible: isVisible,
                        child: const Center(
                          child: CustomProgressIndicator(),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const Center(
                child: CustomProgressIndicator(),
              );
            }
          }),
    );
  }

  // to render UDFS
  List<Widget> columnComponentWidgets = [];
  List<Widget> componentComListWidgets = [];

  List<ColumnComponent> columnComponentList = [];

  // ! hardcoding UNDO
  // TextFieldBloc? specificLocationTextFieldBloc;

  // Community Hall Booking specific values
  Map<String, String> conditionalValues = {};

  final Map<String, dynamic> udfJson = {};

  List<String> selectValue = [];

  var radioValue = {};
  int? radioValue1 = 0;
  bool isAttachmentUploaded = false;
  // bool isLocationRequired = false;

  DateTime? leaveStartDate;
  DateTime? leaveEnddate;

  String? typeKey = '';

  TextEditingController leaveDurationControllerCalendarDays =
      TextEditingController();

  // For storing the location:
  Position? position;

  _parseJsonToUDFModel(
    CreateServiceFormBloc createServiceFormBloc,
    udfJsonString,
    String? templateCode,
  ) {
    ParseJsonHelper _parseJsonHelper = ParseJsonHelper();
    columnComponentList = [];

// ! hardcoding UNDO
    // if (templateCode == 'GRV_BIRTH AND DEATH CERTIFICATE' ||
    //     templateCode == "EGOV_BUILDINGS" ||
    //     templateCode == "CIVIL_WORKS" ||
    //     templateCode == "GRV_DRAINAGE" ||
    //     templateCode == "GRV_ENCROACHMENT" ||
    //     templateCode == "GRV_ENFORCEMENT" ||
    //     templateCode == "GRV_ESTATE" ||
    //     templateCode == "GRV_Factories" ||
    //     templateCode == "GRV_GARDEN_AND_TREES" ||
    //     templateCode == "GRV_HEALTH" ||
    //     templateCode == "EGOV_LEGAL" ||
    //     templateCode == "GRV_LICENSE" ||
    //     templateCode == "GRV_OTHERS" ||
    //     templateCode == "EGOV_PEST_CONTROL" ||
    //     templateCode == "GRV_REVENUE" ||
    //     templateCode == "GRV_ROADS_AND_TRAFFIC" ||
    //     templateCode == "GRV_SANITATION" ||
    //     templateCode == "EGOV_SCHOOL" ||
    //     templateCode == "GRV_SEWERAGE_OPERATION_CONTROL_RIVER" ||
    //     templateCode == "EGOV_SHOPS_AND_ESTABLISHMENTS" ||
    //     templateCode == "GRV_SOLID_WASTE_MANAGEMENT" ||
    //     templateCode == "GRV_STRAY_DOGS" ||
    //     templateCode == "GRV_STREET_LIGHTS" ||
    //     templateCode == "GRV_WATER_SUPPLY") {
    //   columnComponentList = _parseJsonHelper.grievanceUDFs(udfJsonString);

    //   if (columnComponentList != null && columnComponentList.isNotEmpty) {
    //     columnComponentWidgets = addDynamic(
    //       columnComponentList,
    //       createServiceFormBloc,
    //       false,
    //       context,
    //     );
    //   }
    // } else if (templateCode == 'EGOV_PUBLIC_GRIEVANCE_REGISTRATION') {
    //   columnComponentList =
    //       _parseJsonHelper.parsePublicGrievanceUDFs(udfJsonString);

    //   if (columnComponentList != null && columnComponentList.isNotEmpty) {
    //     columnComponentWidgets = addDynamic(
    //       columnComponentList,
    //       createServiceFormBloc,
    //       false,
    //       context,
    //     );
    //   }
    // } else if (templateCode == 'BIRTH_REGISTRATION' ||
    //     templateCode == 'DEATH_REGISTRATION' ||
    //     templateCode == 'STILL_BIRTH_REGISTRATION') {
    //   //For Birth Registration, Death Registration, Stillbirth Registration service
    //   columnComponentList =
    //       _parseJsonHelper.parseBirthDeathRegistrationUDFs(udfJsonString);

    //   if (columnComponentList != null && columnComponentList.isNotEmpty) {
    //     columnComponentWidgets = addDynamic(
    //       columnComponentList,
    //       createServiceFormBloc,
    //       true,
    //       context,
    //     );
    //   }
    // } else if (templateCode == 'CommunityHallBooking') {
    //   columnComponentList = _parseJsonHelper.parseCommunityHallBookingUDFs(
    //     udfJsonString,
    //     conditionalValues,
    //   );

    //   if (columnComponentList != null && columnComponentList.isNotEmpty) {
    //     columnComponentWidgets = addDynamic(
    //       columnComponentList,
    //       createServiceFormBloc,
    //       false,
    //       context,
    //     );
    //   }
    // } else if (templateCode == 'NEW_SEWERAGE_CONNECTION_REQUEST' ||
    //     templateCode == 'ExistingSewerageConnection') {
    //   String? _connectionForId;

    //   if (templateCode == 'NEW_SEWERAGE_CONNECTION_REQUEST') {
    //     _connectionForId = widget
    //         .extraInformationMap!['SewerageConnectionRequiredFor']
    //         .extraInfo['codeId'];
    //   } else if (templateCode == 'ExistingSewerageConnection') {
    //     _connectionForId =
    //         widget.extraInformationMap!['SewerageConnectionRequiredFor'].id;
    //   }

    //   columnComponentList = _parseJsonHelper.parseSewerageConnectionUDFs(
    //     udfJsonString,
    //     _connectionForId!,
    //   );

    //   if (columnComponentList != null && columnComponentList.isNotEmpty) {
    //     columnComponentWidgets = addDynamic(
    //       columnComponentList,
    //       createServiceFormBloc,
    //       false,
    //       context,
    //     );
    //   }
    // } else {
    columnComponentList = _parseJsonHelper.parseGenericUDFs(
      udfJsonString,
      conditionalValues,
      widget.serviceId,
    );
    if (columnComponentList != null && columnComponentList.isNotEmpty) {
      columnComponentWidgets = addDynamic(
        columnComponentList,
        createServiceFormBloc,
        false,
        context,
      );
    }
    // }
  }

  List<Widget> addDynamic(
    model,
    createServiceFormBloc,
    bool isOtherDetails,
    BuildContext context,
  ) {
    List<Widget> listDynamic = [];

    if (serviceModel!.stepTasksList != null &&
        serviceModel!.stepTasksList!.isNotEmpty) {
      List<StepTasksList>? _stepTasksList = serviceModel!.stepTasksList;
      listDynamic.add(
        Padding(
            padding: const EdgeInsets.only(top: 24.0, left: 12.0, bottom: 16.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => Scaffold(
                      body: StepTaskListScreen(
                        userId: widget.userID,
                        isEmployeePortal: widget.isEmployeePortal,
                        stepTasksList: _stepTasksList,
                        serviceTemplateCode: widget.templateCode,
                      ),
                    ),
                  ),
                );
              },
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.checklist,
                    color: Colors.blue.shade600,
                  ),
                  Text(
                    "\t\t\tView Service Step Tasks",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.blue.shade800,
                    ),
                  ),
                ],
              ),
            )),
      );
    }

    for (var i = 0; i < model.length; i++) {
      if (model[i].type == 'textfield' && model[i].hidden != true) {
        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId != null || widget.serviceId.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId == null || widget.serviceId.isEmpty)) {
          udfJson[model[i].key] = '';
        }

        // ! hardcoding UNDO
        // if (model[i].key == 'AverageCostDifferAsTheRequest' &&
        //     widget.templateCode != null &&
        //     widget.templateCode.isNotEmpty &&
        //     widget.templateCode == 'NEW_SEWERAGE_CONNECTION_REQUEST') {
        //   udfJson[model[i].key] =
        //       int.parse(model[i].defaultValue) * noOfConnectionsValue!;
        // }

        if (widget.extraInformationMap != null &&
            widget.extraInformationMap!.containsKey(model[i].key)) {
          model[i].defaultValue = widget.extraInformationMap![model[i].key];
          udfJson[model[i].key] = widget.extraInformationMap![model[i].key];
        }

        // ! hardcoding UNDO
        String initialValue;
        initialValue = /*(model[i].key == 'AverageCostDifferAsTheRequest' &&
                widget.templateCode != null &&
                widget.templateCode.isNotEmpty &&
                widget.templateCode == 'NEW_SEWERAGE_CONNECTION_REQUEST')
            ? udfJson[model[i].key].toString()
            :*/
            model[i].defaultValue ?? udfJson[model[i].key];

        udfJson[model[i].key] = initialValue;

        final textField$i = TextFieldBloc(initialValue: initialValue);
        listDynamic.add(
          AbsorbPointer(
            absorbing: !widget.isEmployeePortal &&
                (widget.serviceId != null && widget.serviceId.isNotEmpty),
            child: BlocTextBoxWidget(
              isRequired: model[i].validate?.required,
              labelName: model[i].label,
              fieldName: model[i].label,
              readonly: (model[i].defaultValue != null &&
                          model[i].defaultValue.isNotEmpty) ||
                      model[i].disabled.toString() == 'true' ||
                      widget.serviceId.isNotEmpty
                  ? true
                  : false,
              textFieldBloc: textField$i,
              prefixIcon: const Icon(
                Icons.note_outlined,
                color: AppThemeColor.iconColor,
              ),
              maxLines: 1,
              onChanged: (String value) {
                udfJson[model[i].key] = value;
              },
            ),
          ),
        );
        createServiceFormBloc.addFieldBlocs(fieldBlocs: [textField$i]);
      } else if (model[i].type == 'textarea' && model[i].hidden != true) {
        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId != null && widget.serviceId.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId == null || widget.serviceId.isEmpty)) {
          udfJson[model[i].key] = '';
        }

        if (widget.extraInformationMap != null &&
            widget.extraInformationMap!.containsKey(model[i].key)) {
          model[i].defaultValue = widget.extraInformationMap![model[i].key];
          udfJson[model[i].key] = widget.extraInformationMap![model[i].key];
        }

        final textArea$i = TextFieldBloc(initialValue: udfJson[model[i].key]);

        // Specific Location Fix
        // ! hardcoding UNDO
        // if (model[i].key == 'specificLocation') {
        //   specificLocationTextFieldBloc = textArea$i;
        // }

        listDynamic.add(
          AbsorbPointer(
            absorbing: !widget.isEmployeePortal &&
                (widget.serviceId != null && widget.serviceId.isNotEmpty),
            child: BlocTextBoxWidget(
              isRequired: model[i].validate?.required,
              labelName: model[i].label,
              fieldName: model[i].label,
              readonly: (model[i].defaultValue != null &&
                          model[i].defaultValue.isNotEmpty) ||
                      model[i].disabled.toString() == 'true' ||
                      widget.serviceId.isNotEmpty
                  ? true
                  : false,
              textFieldBloc: textArea$i,
              prefixIcon: const Icon(
                Icons.note_outlined,
                color: AppThemeColor.iconColor,
              ),
              // ! hardcoding UNDO
              maxLines: /*model[i].key == 'specificLocation' ? 5 : */ 3,
              onChanged: (String value) {
                udfJson[model[i].key] = value;
              },
            ),
          ),
        );
        createServiceFormBloc.addFieldBlocs(fieldBlocs: [textArea$i]);
      } else if (model[i].type == 'number' && model[i].hidden != true) {
        String initialValue;
        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId == null || widget.serviceId.isEmpty)) {
          udfJson[model[i].key] = '';
        }

        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId != null || widget.serviceId.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
          leaveDurationControllerCalendarDays.text = model[i].udfValue ?? '';
          initialValue = model[i].udfValue ?? '';
        }

        if (model[i].key == 'LeaveDurationCalendarDays') {
          initialValue = leaveDurationControllerCalendarDays.text;
        } else if (udfJson[model[i].key] != null &&
            udfJson[model[i].key]!.toString().isNotEmpty) {
          initialValue = udfJson[model[i].key].toString();
        } else if (model[i].defaultValue != null &&
            model[i].defaultValue.toString().isNotEmpty) {
          initialValue = model[i].defaultValue.toString();
        } else {
          initialValue = '';
        }

        // Setting the default value to the UDF JSON.
        udfJson[model[i].key] = initialValue;

        // ! hardcoding UNDO
        // if (model[i].key == 'BillAmount' &&
        //     widget.templateCode != null &&
        //     widget.templateCode.isNotEmpty &&
        //     widget.templateCode == "EGOV_SANIT_CONST_WASTE") {
        //   udfJson[model[i].key] = model[i].defaultValue * truckLoadTrips!;
        //   initialValue = udfJson[model[i].key].toString();
        // }

        if (widget.extraInformationMap != null &&
            widget.extraInformationMap!.containsKey(model[i].key)) {
          model[i].defaultValue = widget.extraInformationMap![model[i].key];
          udfJson[model[i].key] =
              widget.extraInformationMap![model[i].key].toString();
          initialValue = widget.extraInformationMap![model[i].key].toString();
        }

        // ! hardcoding UNDO
        // if (widget.templateCode == 'CommunityHallBooking' &&
        //     (widget.serviceId == null || widget.serviceId.isEmpty) &&
        //     model[i].key != 'ContactNo') {
        //   switch (model[i].key) {
        //     case 'BaseCharges':
        //       initialValue = '3000';
        //       break;
        //     case 'ACCharges':
        //       initialValue = '1000';
        //       break;
        //     case 'ElectricityCharges':
        //       initialValue = '500';
        //       break;
        //     case 'CleaningCharges':
        //       initialValue = '500';
        //       break;
        //     case 'TotalCharges':
        //       initialValue =
        //           widget.extraInformationMap![model[i].key].toString();
        //       break;
        //     default:
        //       break;
        //   }
        //   model[i].defaultValue = initialValue;
        //   udfJson[model[i].key] = initialValue;
        // }

        // if (widget.templateCode == 'NEW_RENTAL_PROPERTY' &&
        //     (widget.serviceId == null || widget.serviceId.isEmpty)) {
        //   switch (model[i].key) {
        //     case 'MonthlyRent':
        //       initialValue = '10000';
        //       break;
        //     case 'AdvanceDepositAmount':
        //       initialValue = '200000';
        //       break;
        //     case 'Street':
        //       initialValue =
        //           widget.extraInformationMap![model[i].key].toString();
        //       break;

        //     default:
        //       break;
        //   }
        //   model[i].defaultValue = initialValue;
        //   udfJson[model[i].key] = initialValue;
        // }

        final number$i = TextFieldBloc(initialValue: initialValue);
        listDynamic.add(
          AbsorbPointer(
            absorbing: !widget.isEmployeePortal &&
                (widget.serviceId != null && widget.serviceId.isNotEmpty),
            child: BlocNumberBoxWidget(
              isRequired: model[i].validate?.required,
              labelName: model[i].label,
              fieldName: model[i].label,
              readonly: (model[i].defaultValue != null &&
                      model[i].defaultValue.toString().isNotEmpty) ||
                  model[i].disabled.toString() == 'true' ||
                  widget.serviceId.isNotEmpty,
              // ? true
              // : false,
              textFieldBloc: number$i,
              prefixIcon: const Icon(
                Icons.format_list_numbered,
                color: AppThemeColor.iconColor,
              ),
              // ! hardcoding UNDO
              decimal:
                  /*model[i].key == 'BirthWeightInKgsIfAvailable' ? true : */ false,
              onChanged: (String value) {
                udfJson[model[i].key] = value;
                // ! hardcoding UNDO
                // if (model[i].key == 'NoOfConnectionsRequired' &&
                //     widget.templateCode != null &&
                //     widget.templateCode.isNotEmpty &&
                //     widget.templateCode == 'NEW_SEWERAGE_CONNECTION_REQUEST') {
                //   setState(() {
                //     noOfConnectionsValue = int.parse(value);
                //   });
                // }
                // if (model[i].key == "TruckLoadTrips" &&
                //     widget.templateCode != null &&
                //     widget.templateCode.isNotEmpty &&
                //     widget.templateCode == "EGOV_SANIT_CONST_WASTE") {
                //   setState(() {
                //     if (value.isEmpty) {
                //       truckLoadTrips = 1;
                //     } else {
                //       truckLoadTrips = int.parse(value);
                //     }
                //   });
                // }
              },
            ),
          ),
        );
        createServiceFormBloc.addFieldBlocs(fieldBlocs: [number$i]);
      } else if (model[i].type == 'password' && model[i].hidden != true) {
        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId == null || widget.serviceId.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId != null || widget.serviceId.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
        }

        if (widget.extraInformationMap != null &&
            widget.extraInformationMap!.containsKey(model[i].key)) {
          model[i].defaultValue = widget.extraInformationMap![model[i].key];
          udfJson[model[i].key] = widget.extraInformationMap![model[i].key];
        }

        final password$i = TextFieldBloc(initialValue: udfJson[model[i].key]);
        listDynamic.add(
          AbsorbPointer(
            absorbing: !widget.isEmployeePortal &&
                (widget.serviceId != null && widget.serviceId.isNotEmpty),
            child: BlocTextBoxWidget(
              isRequired: model[i].validate?.required,
              labelName: model[i].label,
              fieldName: model[i].label,
              textFieldBloc: password$i,
              prefixIcon: const Icon(
                Icons.visibility_off_rounded,
                color: AppThemeColor.iconColor,
              ),
              obscureText: true,
              onChanged: (String value) {
                udfJson[model[i].key] = value;
              },
            ),
          ),
        );
        createServiceFormBloc.addFieldBlocs(fieldBlocs: [password$i]);
      } else if (model[i].type == 'checkbox' && model[i].hidden != true) {
        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId == null || widget.serviceId.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId != null || widget.serviceId.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
        }
        listDynamic.add(
          AbsorbPointer(
            absorbing: !widget.isEmployeePortal &&
                (widget.serviceId != null && widget.serviceId.isNotEmpty),
            child: DynamicCheckBoxValue(
              readonly: model[i].disabled,
              code: udfJson[model[i].key],
              name: model[i].label,
              key: Key('${model[i].type}+$i'),
              value: udfJson[model[i].key],
              checkUpdate: (bool check) {
                udfJson[model[i].key] = check.toString();
                setState(() {
                  conditionalValues[model[i].key] = check.toString();
                });
              },
            ),
          ),
        );
      } else if (model[i].type == 'selectboxes' && model[i].hidden != true) {
        TextEditingController _ddController = TextEditingController();
        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId == null || widget.serviceId.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId != null || widget.serviceId.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
          _ddController.text = udfJson[model[i].key].toString();
        }
        listDynamic.add(
          AbsorbPointer(
            absorbing: !widget.isEmployeePortal &&
                (widget.serviceId != null && widget.serviceId.isNotEmpty),
            child: NTSDropDownSelect(
              title: model[i].label,
              controller: _ddController,
              hint: model[i].label,
              validationMessage: "Select " + model[i].label,
              isShowArrow: true,
              nameKey: model[i].template,
              idKey: model[i].idPath,
              url: model[i].data,
              onListTap: (dynamic value) {
                NTSDropdownModel _selectedIdNameViewModel = value;
                _ddController.text = _selectedIdNameViewModel.name.toString();
                udfJson[model[i].label] =
                    _selectedIdNameViewModel.id.toString();
              },
            ),
          ),
        );
      } else if (model[i].type == 'radio' && model[i].hidden != true) {
        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId == null || widget.serviceId.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId != null || widget.serviceId.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
        }
        List radioItemsList = [];
        model[i].values.forEach((element) {
          if (element.label.isEmpty) {
            radioItemsList.add(element.value);
          } else {
            radioItemsList.add(element.label);
          }
        });
        final radio$i = SelectFieldBloc(
            initialValue: (udfJson[model[i].key] != null &&
                    udfJson[model[i].key]!.isNotEmpty)
                ? udfJson[model[i].key]
                : model[i].defaultValue is int
                    ? radioItemsList[model[i].defaultValue - 1]
                    : model[i].defaultValue,
            items: radioItemsList);
        listDynamic.add(
          AbsorbPointer(
            absorbing: !widget.isEmployeePortal &&
                (widget.serviceId != null && widget.serviceId.isNotEmpty),
            child: BlocRadioButtonWidget(
              labelName: model[i].label,
              selectFieldBloc: radio$i,
            ),
          ),
        );
        radio$i.onValueChanges(onData: (previous, current) async* {
          udfJson[model[i].key] = current.value;
          for (var j = 0; j < radioItemsList.length; j++) {
            if (radioItemsList[j] == current.value) {
              setState(() {
                radioValue[model[i].key] = model[i].values[j].value;
              });
            }
          }
        });
        createServiceFormBloc.addFieldBlocs(fieldBlocs: [radio$i]);
      } else if (model[i].type == 'select' && model[i].hidden != true) {
        TextEditingController _ddController = TextEditingController();
        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId == null || widget.serviceId.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        if (selectValue.length < model.length) {
          for (var j = selectValue.length; j < model.length; j++) {
            selectValue.add('');
          }
        }

        if ((selectValue != null && selectValue.isNotEmpty) &&
            (selectValue[i] != null && selectValue[i].isNotEmpty)) {
          _ddController.text = selectValue[i];
        }

        if (model[i].defaultValue != null && model[i].defaultValue.isNotEmpty) {
          editServiceDDValue(
              code: model[i].defaultValue,
              idKey: model[i].idPath,
              nameKey: (model[i].template)
                  .toString()
                  .replaceAll('<span>{{', '')
                  .replaceAll('}}</span>', '')
                  .trim()
                  .split('.')[1],
              url: model[i].data.url,
              ddController: _ddController);
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId != null || widget.serviceId.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
          if (model[i].template == null) {
            List<FileTypeData> _value = model[i].data.values;
            _value.forEach((element) {
              if (element.value == model[i].udfValue) {
                _ddController.text = element.label!;
              }
            });
          } else {
            // if else loop added to separate processing of multi-select and
            // single-select conditions
            if (model[i].multiple != null &&
                model[i].multiple &&
                udfJson[model[i].key] != null &&
                udfJson[model[i].key].isNotEmpty) {
              getMultiSelectListNames(
                udfValue: udfJson[model[i].key],
                idKey: model[i].idPath,
                nameKey: (model[i].template)
                    .toString()
                    .replaceAll('<span>{{', '')
                    .replaceAll('}}</span>', '')
                    .trim()
                    .split('.')[1],
                url: model[i].data.url,
                ddController: _ddController,
              ).then((value) => _ddController.text =
                  value.toString().split('[')[1].split(']')[0]);
            } else {
              editServiceDDValue(
                  code: udfJson[model[i].key].toString(),
                  idKey: model[i].idPath,
                  nameKey: (model[i].template)
                      .toString()
                      .replaceAll('<span>{{', '')
                      .replaceAll('}}</span>', '')
                      .trim()
                      .split('.')[1],
                  url: model[i].data.url,
                  ddController: _ddController);
            }
          }
          if (selectValue.length < model.length) {
            for (var j = selectValue.length; j < model.length; j++) {
              selectValue.add('');
            }
          }
        }

        /// This variable carries the items already selected from the multiselect list
        List<String>? _dropdownModelListMultiselect = [];

        List<NTSDropdownModel>? _dropdownModelList = [];
        model[i].data?.values?.forEach(
              (e) => _dropdownModelList.add(
                NTSDropdownModel(
                  id: e.value,
                  name: e.label,
                ),
              ),
            );
        if ((selectValue != null && selectValue.isNotEmpty) &&
            (selectValue[i] != null && selectValue[i].isNotEmpty)) {
          _ddController.text = selectValue[i];
        }

        // ! hardcoding UNDO
        // if ((model[i].key == 'CommunityHallNameId' ||
        //         model[i].key == 'WardNo') &&
        //     widget.extraInformationMap != null &&
        //     widget.extraInformationMap![model[i].key] != null) {
        //   _ddController.text = widget.extraInformationMap![model[i].key]!.name!;
        //   udfJson[model[i].key] =
        //       widget.extraInformationMap![model[i].key]!.id!;
        // }

        if (widget.extraInformationMap != null &&
            widget.extraInformationMap!.containsKey(model[i].key) &&
            widget.extraInformationMap![model[i].key]?.id != null) {
          udfJson[model[i].key] =
              widget.extraInformationMap![model[i].key]!.id!.toString();
          //Below loop added to fix issue in "Sanitation tax registration - residential"
          if (widget.extraInformationMap![model[i].key] != null &&
              (widget.extraInformationMap![model[i].key]!.id!.toString() ==
                  widget.extraInformationMap![model[i].key]!.name)) {
            editServiceDDValue(
                code: udfJson[model[i].key].toString(),
                idKey: model[i].idPath,
                nameKey: (model[i].template)
                    .toString()
                    .replaceAll('<span>{{', '')
                    .replaceAll('}}</span>', '')
                    .trim()
                    .split('.')[1],
                url: model[i].data.url,
                ddController: _ddController);
          } else {
            _ddController.text =
                widget.extraInformationMap![model[i].key]!.name ?? "NA";
          }
        }

        listDynamic.add(
          AbsorbPointer(
            absorbing: !widget.isEmployeePortal &&
                (widget.serviceId != null && widget.serviceId.isNotEmpty),
            child: NTSDropDownSelect(
              isRequired: model[i].validate?.required,
              title: model[i].label,
              controller: _ddController,
              hint: model[i].label,
              validationMessage: "Select " + model[i].label,
              isShowArrow: true,
              typeKey: typeKey,
              multiple: model[i].multiple ?? false,
              // ! hardcoding UNDO
              isReadonly: ((widget.extraInformationMap != null &&
                          widget.extraInformationMap!.containsKey(model[i]
                              .key)) /*||
                          model[i].key == 'CommunityHallNameId' &&
                              widget.extraInformationMap != null*/
                      ) ||
                      model[i].disabled.toString() == 'true' ||
                      widget.serviceId.isNotEmpty
                  ? true
                  : false,
              nameKey: model[i].template != null
                  ? (model[i].template)
                      .toString()
                      .replaceAll('<span>{{', '')
                      .replaceAll('}}</span>', '')
                      .trim()
                      .split('.')[1]
                  : '',
              idKey: model[i].idPath,
              url: model[i].data.url,
              dropdownValues: (model[i].multiple != null && model[i].multiple)
                  ? []
                  : _dropdownModelList,
              multiSelectDropdownValues: (model[i].multiple != null &&
                      model[i].multiple &&
                      (widget.serviceId == null || widget.serviceId.isEmpty) &&
                      udfJson[model[i].key].isNotEmpty)
                  ? udfJson[model[i].key]
                  : [],
              onListTap: (dynamic value) {
                if (value.runtimeType.toString() == 'NTSDropdownModel' ||
                    value.runtimeType.toString() == 'CommonListModel') {
                  // ! hardcoding UNDO
                  // if (model[i].key == 'Ward' ||
                  //     model[i].key == 'WardId' ||
                  //     model[i].key == 'wardId' ||
                  //     model[i].key == 'WardNo') {
                  //   commonBloc.subjectCommonList.sink.add(null);
                  //   CommonListModel _selectedIdNameViewModel = value;
                  //   _ddController.text =
                  //       _selectedIdNameViewModel.name.toString();
                  //   udfJson[model[i].key] =
                  //       _selectedIdNameViewModel.id.toString();
                  // } else {
                  // ntsDdBloc.subject.sink.add(null);
                  NTSDropdownModel _selectedIdNameViewModel = value;
                  _ddController.text = _selectedIdNameViewModel.name.toString();
                  udfJson[model[i].key] =
                      _selectedIdNameViewModel.id.toString();
                  // }
                  selectValue[i] = _ddController.text;
                  //   if (model[i].key == 'ComplaintType') {
                  //     setState(() {
                  //       typeKey = value.id;
                  //     });
                  //   }
                  //   if (model[i].key == 'EventTypeId' ||
                  //       model[i].key == 'ChooseType' ||
                  //       model[i].key == 'DebrisType' ||
                  //       model[i].key == 'serviceName') {
                  //     //'ChooseType' added for 'Meat Waste Clearance Form'
                  //     //'DebrisType' added for 'Construction and debris waste clearance form'
                  //     //'serviceName' added for 'Tax Registration for Commercial Users'
                  //     setState(() {
                  //       conditionalValues[model[i].key] = value.id;
                  //     });
                  //   }
                } else {
                  List<String> _categoryName = [];
                  List<String> _categoryId = [];
                  List<NTSDropdownModel> _list = value;

                  _list.forEach(
                    (element) {
                      _categoryName.add(element.name!);
                      _categoryId.add(element.id!);
                    },
                  );

                  ntsDdBloc.subject.sink.add(null);
                  _dropdownModelListMultiselect = _categoryId;

                  udfJson[model[i].key] = _dropdownModelListMultiselect;

                  _ddController.text =
                      _categoryName.toString().split('[')[1].split(']')[0];
                  selectValue[i] = _ddController.text;
                  setState(() {});
                }
              },
            ),
          ),
        );
      } else if (model[i].type == 'datetime' &&
          model[i].hidden != true &&
          model[i].widget!.enableTime?.toString() != 'true') {
        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId == null || widget.serviceId.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId != null || widget.serviceId.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
        }
        // ! hardcoding UNDO
        // this is done for rent module date setting
        // if (model[i].key == 'AgreementStartDate' &&
        //     widget.extraInformationMap?['AgreementStartDate'] != null) {
        //   udfJson[model[i].key] =
        //       widget.extraInformationMap!['AgreementStartDate'];
        // }
        // if (model[i].key == 'AgreementEndDate' &&
        //     widget.extraInformationMap?['AgreementEndDate'] != null) {
        //   udfJson[model[i].key] =
        //       widget.extraInformationMap!['AgreementEndDate'];
        // }

        // this is done for sanitation tax registration - residential
        // if (model[i].key == 'BillDueDate' &&
        //     widget.extraInformationMap?['BillDueDate'] != null) {
        //   udfJson[model[i].key] = widget.extraInformationMap!['BillDueDate'];
        // }

        // if (model[i].key == 'BookingFromDate' &&
        //     widget.extraInformationMap?['startDate'] != null) {
        //   udfJson[model[i].key] = widget.extraInformationMap!['startDate'];
        // }
        // if (model[i].key == 'BookingToDate' &&
        //     widget.extraInformationMap?['endDate'] != null) {
        //   udfJson[model[i].key] = widget.extraInformationMap!['endDate'];
        // }

        listDynamic.add(
          AbsorbPointer(
            absorbing: !widget.isEmployeePortal &&
                (widget.serviceId != null && widget.serviceId.isNotEmpty),
            child: DynamicDateBox(
              isRequired: model[i].validate?.required,
              // ! hardcoding UNDO
              // isReadonly: (model[i].key == 'BookingFromDate' &&
              //         widget.extraInformationMap != null &&
              //         widget.extraInformationMap!['startDate'] != null) ||
              //     (model[i].key == 'AgreementStartDate' &&
              //         widget.extraInformationMap != null &&
              //         widget.extraInformationMap!['AgreementStartDate'] !=
              //             null) ||
              //     (model[i].key == 'AgreementEndDate' &&
              //         widget.extraInformationMap != null &&
              //         widget.extraInformationMap!['AgreementEndDate'] !=
              //             null) ||
              //     (model[i].key == 'BookingToDate' &&
              //         widget.extraInformationMap != null &&
              //         widget.extraInformationMap!['endDate'] != null) ||
              //     (model[i].key == 'BillDueDate' &&
              //         widget.extraInformationMap != null &&
              //         widget.extraInformationMap!['BillDueDate'] != null) ||
              //     widget.serviceId.isNotEmpty,
              code: /*(model[i].key == 'BookingFromDate' &&
                          widget.extraInformationMap != null &&
                          widget.extraInformationMap!['startDate'] != null) ||
                      (model[i].key == 'AgreementEndDate' &&
                          widget.extraInformationMap != null &&
                          widget.extraInformationMap!['AgreementEndDate'] !=
                              null) ||
                      (model[i].key == 'AgreementStartDate' &&
                          widget.extraInformationMap != null &&
                          widget.extraInformationMap!['AgreementStartDate'] !=
                              null) ||
                      (model[i].key == 'BookingToDate' &&
                          widget.extraInformationMap != null &&
                          widget.extraInformationMap!['endDate'] != null) ||
                      (model[i].key == 'BillDueDate' &&
                          widget.extraInformationMap != null &&
                          widget.extraInformationMap!['BillDueDate'] != null)
                  // ? DateFormat("dd/MM/yyyy")
                  ? DateFormat("yyyy-MM-dd")
                      .parse(udfJson[model[i].key]!)
                      .toString()
                  : */
                  udfJson[model[i].key]!.isNotEmpty
                      ? model[i]
                              .udfValue
                              .toString()
                              .split(' ')[0]
                              .contains(RegExp(r'[a-z]'))
                          ? null
                          : DateFormat("yyyy-MM-dd")
                              .parse(udfJson[model[i].key]!)
                              .toString()
                      : null,
              name: model[i].label,
              key: Key('${model[i].type}+$i'),
              selectDate: (DateTime date) {
                if (date != null) {
                  model[i].inputFormat = date.toString();

                  udfJson[model[i].key] = date.toString();
                  if (model[i].key == 'LeaveStartDate') {
                    leaveStartDate = date;
                  } else if (model[i].key == 'LeaveEndDate') {
                    leaveEnddate = date;
                  }
                  if ((model[i].key == 'LeaveStartDate' ||
                          model[i].key == 'LeaveEndDate') &&
                      leaveStartDate != null &&
                      leaveEnddate != null) {
                    compareStartEndDate(
                        startDate: leaveStartDate!,
                        enddate: leaveEnddate!,
                        context: context,
                        updateDuration: true);
                  }
                }
              },
            ),
          ),
        );
      } else if (model[i].type == 'datetime' &&
          model[i].hidden != true &&
          model[i].widget!.enableTime?.toString() == 'true') {
        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId == null || widget.serviceId.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId != null || widget.serviceId.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
        }

        TimeOfDay? _time;
        DateTime? _date;
        DateTime _date1;
        String _date2;

        listDynamic.add(
          AbsorbPointer(
            absorbing: !widget.isEmployeePortal &&
                (widget.serviceId != null && widget.serviceId.isNotEmpty),
            child: DynamicDateTimeBox(
              isReadonly: widget.serviceId.isNotEmpty,
              isRequired: model[i].validate?.required,
              code: udfJson[model[i].key],
              name: model[i].label,
              key: Key('${model[i].type}+$i'),
              selectDate: (DateTime date) {
                if (date != null) {
                  _date = date;
                  if (_time != null) {
                    _date1 = DateTime(_date!.year, _date!.month, _date!.day,
                        _time!.hour, _time!.minute);
                    _date2 = DateFormat("yyyy-MM-dd hh:mm:ss").format(_date1);
                    // _date2 = DateFormat("dd MMM yyyy h:mm a").format(_date1);
                    model[i].inputFormat = _date2;
                    udfJson[model[i].key] = _date2;
                  }
                }
              },
              selectTime: (TimeOfDay time) {
                if (time != null) {
                  _time = time;
                  if (_date != null) {
                    _date1 = DateTime(_date!.year, _date!.month, _date!.day,
                        _time!.hour, _time!.minute);
                    _date2 = DateFormat("yyyy-MM-dd hh:mm:ss").format(_date1);
                    // _date2 = DateFormat("dd MMM yyyy h:mm a").format(_date1);
                    model[i].inputFormat = _date2;
                    udfJson[model[i].key] = _date2;
                  }
                }
              },
            ),
          ),
        );
      } else if (model[i].type == 'time' && model[i].hidden != true) {
        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId == null || widget.serviceId.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId != null || widget.serviceId.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
        }
        listDynamic.add(
          AbsorbPointer(
            absorbing: !widget.isEmployeePortal &&
                (widget.serviceId != null && widget.serviceId.isNotEmpty),
            child: DynamicTimeBox(
              code: udfJson[model[i].key]!.isNotEmpty
                  ? DateFormat("hh:mm")
                      .parse(udfJson[model[i].key]!
                          .toString()
                          .split("(")[1]
                          .split(")")[0])
                      .toString()
                  // DateFormat("yyyy-MM-dd HH:mm:ss aa")
                  //     .parse(udfJson[model[i].key]!)
                  //     .toString()
                  : null,
              name: model[i].label,
              key: Key(model[i].label),
              selectTime: (TimeOfDay time) {
                if (time != null) {
                  udfJson[model[i].key] = time.toString();
                }
              },
            ),
          ),
        );
      } else if (model[i].type == 'hidden' && model[i].hidden != true) {
        //Hidden Field
        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId == null || widget.serviceId.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId != null || widget.serviceId.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
        }
        final hidden$i = TextFieldBloc(initialValue: udfJson[model[i].key]);
        listDynamic.add(
          BlocTextBoxWidget(
            obscureText: true,
            labelName: model[i].label,
            fieldName: model[i].label,
            readonly: true,
            textFieldBloc: hidden$i,
            prefixIcon: const Icon(
              Icons.visibility,
              color: AppThemeColor.iconColor,
            ),
            maxLines: 1,
            onChanged: (String value) {
              udfJson[model[i].key] = value;
            },
          ),
        );
        createServiceFormBloc.addFieldBlocs(fieldBlocs: [hidden$i]);
      } else if (model[i].type == 'phoneNumber' && model[i].hidden != true) {
        //Phone Number Field
        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId == null || widget.serviceId.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId != null || widget.serviceId.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
        }

        if (widget.extraInformationMap != null &&
            widget.extraInformationMap!.containsKey(model[i].key)) {
          model[i].defaultValue = widget.extraInformationMap![model[i].key];
          udfJson[model[i].key] = widget.extraInformationMap![model[i].key];
        }

        final phoneNumber$i =
            TextFieldBloc(initialValue: udfJson[model[i].key]);
        listDynamic.add(
          AbsorbPointer(
            absorbing: !widget.isEmployeePortal &&
                (widget.serviceId != null && widget.serviceId.isNotEmpty),
            child: BlocNumberBoxWidget(
              isRequired: model[i].validate?.required,
              labelName: model[i].label,
              fieldName: model[i].label,
              readonly: (model[i].defaultValue != null &&
                          model[i].defaultValue.isNotEmpty) ||
                      widget.serviceId.isNotEmpty
                  ? true
                  : false,
              textFieldBloc: phoneNumber$i,
              prefixIcon: const Icon(
                Icons.phone_rounded,
                color: AppThemeColor.iconColor,
              ),
              onChanged: (String value) {
                udfJson[model[i].key] = value;
              },
            ),
          ),
        );
        createServiceFormBloc.addFieldBlocs(fieldBlocs: [phoneNumber$i]);
      } else if (model[i].type == 'email' && model[i].hidden != true) {
        //Email Field
        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId == null || widget.serviceId.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId != null || widget.serviceId.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
        }

        if (widget.extraInformationMap != null &&
            widget.extraInformationMap!.containsKey(model[i].key)) {
          model[i].defaultValue = widget.extraInformationMap![model[i].key];
          udfJson[model[i].key] = widget.extraInformationMap![model[i].key];
        }

        final email$i = TextFieldBloc(
            validators: [FieldBlocValidators.email],
            initialValue: udfJson[model[i].key]);
        listDynamic.add(
          AbsorbPointer(
            absorbing: !widget.isEmployeePortal &&
                (widget.serviceId != null && widget.serviceId.isNotEmpty),
            child: BlocTextBoxWidget(
              isRequired: model[i].validate?.required,
              labelName: model[i].label,
              fieldName: model[i].label,
              readonly: (model[i].defaultValue != null &&
                          model[i].defaultValue.isNotEmpty) ||
                      model[i].disabled.toString() == 'true' ||
                      widget.serviceId.isNotEmpty
                  ? true
                  : false,
              textFieldBloc: email$i,
              prefixIcon: const Icon(
                Icons.email_outlined,
                color: AppThemeColor.iconColor,
              ),
              maxLines: 1,
              onChanged: (String value) {
                udfJson[model[i].key] = value;
              },
              keyboardType: TextInputType.emailAddress,
            ),
          ),
        );
        createServiceFormBloc.addFieldBlocs(fieldBlocs: [email$i]);
      } else if (model[i].type == 'file' && model[i].hidden != true) {
        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId == null || widget.serviceId.isEmpty)) {
          udfJson[model[i].key] = '';
        }
        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId != null || widget.serviceId.isNotEmpty)) {
          udfJson[model[i].key] = model[i].udfValue ?? '';
        }
        // final textField$i = TextFieldBloc(initialValue: udfJson[model[i].key]);
        // listDynamic.add(
        //   BlocTextBoxWidget(
        //     labelName: model[i].label,
        //     fieldName: model[i].label,
        //     // readonly: model[i].disabled,
        //     textFieldBloc: textField$i,
        //     prefixIcon: const Icon(Icons.note),
        //     maxLines: 1,
        //     onChanged: (String value) {
        //       udfJson[model[i].key] = value;
        //     },
        //   ),
        // );
        // createServiceFormBloc.addFieldBlocs(fieldBlocs: [textField$i]);

        TextEditingController attachmentController = TextEditingController();
        if (!udfJson.containsKey(model[i].key) &&
            (widget.serviceId == null || widget.serviceId.isEmpty)) {
          udfJson[model[i].key] = '';
          if (selectValue.length < model.length) {
            for (var j = selectValue.length; j < model.length; j++) {
              selectValue.add('');
            }
          }
        }

        attachmentController.text = (udfJson[model[i].key] == null ||
                udfJson[model[i].key]!.isEmpty ||
                udfJson[model[i].key] == '[]')
            ? model[i].label ?? " Select File to Attach "
            : (selectValue[i] == null || selectValue[i].isEmpty)
                ? " (1) File Attached: " + udfJson[model[i].key]!
                : " (1) File Attached: " + selectValue[i];

        // attchmentController.text = udfJson[model[i].key] == null
        //     ? (widget.serviceId == null || widget.serviceId.isEmpty)
        //         ? " Select File to Attach "
        //         : model[i].label
        //     // : model[i].udfValue
        //     : " (1) File Attached " + udfJson[model[i].key];

        listDynamic.add(
          DynamicAttachmentWidget(
            isRequired: model[i].validate?.required,
            labelName: model[i].label,
            fieldName: model[i].label,
            controller: attachmentController,

            fileId: (model[i].udfValue == '[]')
                ? model[i].udfValue.replaceAll(RegExp(r'[^\w\s]+'), '')
                : model[i].udfValue,

            // Callback for Download
            callBack1: () => _handleDownloadOnPressed(
              data: model[i],
            ),

            callBack: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) {
                  return SelectAttachment(
                    ntsId: 'Note',
                    userId: widget.userID,
                    onListTap: (dynamic value, dynamic value2, dynamic value3) {
                      setState(() {
                        // isAttachmentUploaded = true;

                        selectValue[i] = value2;
                        model[i].label = value2;
                        udfJson[model[i].key] = value;
                        attachmentController.text =
                            " (1) File Attached: " + selectValue[i];
                      });
                    },
                  );
                }),
              );
            },
            readOnly: widget.serviceId.isNotEmpty ? true : false,
          ),
        );

        // Adding the Google maps with Location marker.
        // if (isLocationRequired == true
        //     //  && isAttachmentUploaded == true
        //     ) {
        //   listDynamic.add(
        //     FutureBuilder(
        //       future: _getCurrentLocationAddress(),
        //       builder: (BuildContext context,
        //           AsyncSnapshot<List<geocoding.Placemark>> snapshot) {
        //         String? latitude = position?.latitude.toString();
        //         String? longitude = position?.longitude.toString();
        //         if (snapshot.hasError) {
        //           return const Center(
        //             child: Text("An error occured, please try again later."),
        //           );
        //         }

        //         if (snapshot.hasData) {
        //           if (snapshot.data == null || snapshot.data!.isEmpty) {
        //             return const Center(
        //               child: Text(
        //                   "Unable to fetch reverse geocoding data. Please try again later."),
        //             );
        //           }

        //           geocoding.Placemark data = snapshot.data!.first;

        //           // Updating the udfJson value of the specifica location field with the address.
        //           udfJson["specificLocation"] = addressToString(data);

        //           if (specificLocationTextFieldBloc != null) {
        //             specificLocationTextFieldBloc
        //                 ?.updateInitialValue(addressToString(data));
        //           }

        //           return Column(
        //             children: [
        //               SizedBox(
        //                 width: MediaQuery.of(context).size.width,
        //                 height: 25.h,
        //                 child: _mapWidget(
        //                   isGoogleMaps: false,
        //                 ),
        //               ),
        //               SizedBox(
        //                 height: 2.h,
        //               ),
        //               Container(
        //                   margin: const EdgeInsets.all(4),
        //                   padding: const EdgeInsets.all(8),
        //                   alignment: Alignment.centerLeft,
        //                   height: 6.h,
        //                   decoration: BoxDecoration(
        //                     borderRadius: BorderRadius.circular(8),
        //                     border: Border.all(color: Colors.grey, width: 1),
        //                   ),
        //                   child: Text('Latitude:\t\t\t\t\t\t' '$latitude',
        //                       style: Theme.of(context)
        //                           .textTheme
        //                           .headline6
        //                           ?.copyWith(fontSize: 12.sp))),
        //               Container(
        //                   margin: const EdgeInsets.all(4),
        //                   padding: const EdgeInsets.all(8),
        //                   alignment: Alignment.centerLeft,
        //                   height: 6.h,
        //                   decoration: BoxDecoration(
        //                     borderRadius: BorderRadius.circular(8),
        //                     border: Border.all(color: Colors.grey, width: 1),
        //                   ),
        //                   child: Text('Longitude:\t\t\t' '$longitude',
        //                       style: Theme.of(context)
        //                           .textTheme
        //                           .headline6
        //                           ?.copyWith(fontSize: 12.sp))),
        //             ],
        //           );
        //         }

        //         return const Center(
        //           child: CircularProgressIndicator(),
        //         );
        //       },
        //     ),
        //   );
        // }
      } else if (model[i].type == 'legend' && model[i].hidden != true) {
        listDynamic.add(
          DynamicTextDisplay(text: model[i].label),
        );
      } else if (model[i].type == 'map') {
        // ! hardcoding UNDO
        // isLocationRequired = true;
        listDynamic.add(
          SizedBox(
            height: 1.h,
          ),
        );
        listDynamic.add(
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 25.h,
            child: _mapWidget(
              isGoogleMaps: false,
            ),
          ),
        );
      } else if (model[i].type == 'htmlelement' && model[i].hidden != true) {
        String? content = '';
        if (model[i]?.content != null && model[i]?.content.isNotEmpty) {
          if (model[i].content.contains('<p>')) {
            content = model[i].content.split('<p>')[1].split('</p>')[0];
          } else if (model[i].content.contains('Payment Link')) {
            content = null;
            // content = model[i].content.split('>')[1].split('<')[0];
          } else {
            // content = model[i].content ?? '';

            // TODO: Figure this out later
            // ! Fix: For now setting an empty string into the content.
            // * Remove this continue when we know what needs to be done for this.
            continue;
          }
        }

        // Guard clause.
        if (content == null || content.isEmpty) {
          continue;
        }

        listDynamic.add(
          DynamicTextDisplay(text: content),
        );
        // } else if (model[i].label.toString().contains('Page')) {
        // TODO: ?
        // } else if (model[i].key == 'map' && model[i].hidden != true) {
        //   print(
        //       '-------------------------------------------------------------------------------------');
      } else {
        // TODO: ?
      }
    }

    return listDynamic;
  }

  // -------------------------------------------------- //
  //            Download code goes here.                //
  // -------------------------------------------------- //

  _handleDownloadOnPressed({
    @required data,
  }) async {
    if (data == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Data is unavailable. Please try again later."),
        ),
      );

      return;
    }
    // AttachmentNTSRepository _apiRepository = AttachmentNTSRepository();
    // _apiRepository.downloadAttachmentData(
    //     fileValue: data?.udfValue ?? '', context: context);
    Map<String, String> queryparams = {
      'fileId': data?.udfValue ?? '',
    };

    Response response = await Dio().get(
      APIEndpointConstants.DOWNLOAD_ATTACHMENT,
      queryParameters: queryparams,
    );

    String fileName = response.headers['content-disposition']![0]
        .split(';')[1]
        .split('=')[1]
        .trim();

    if (fileName == null || fileName.isEmpty) {
      fileName = data?.label ?? 'DEFAULT_FILE_NAME';
    }

    NewDownloadHelper().unbindPortToMainIsolate();

    showModalBottomSheet(
      context: context,
      isDismissible: true,
      isScrollControlled: false,
      backgroundColor: Colors.transparent,
      enableDrag: true,
      builder: (BuildContext context) {
        return Downloader(
          filename: fileName,
          url:
              'https://webapidev.aitalkx.com/CHR/query/DownloadAttachment?fileId=${data?.udfValue ?? ''}',
          // APIEndpointConstants.DOWNLOAD_ATTACHMENT +
          //     "?fileId=${data?.udfValue ?? ''}",
        );
      },
    );
  }

  Future<List<geocoding.Placemark>> _getCurrentLocationAddress() async {
    position = await GeolocatorPlatform.instance.getCurrentPosition(
      locationSettings: const LocationSettings(),
    );

    return geocoding.placemarkFromCoordinates(
      position!.latitude,
      position!.longitude,
    );
  }

  Widget _mapWidget({
    bool? isGoogleMaps = false,
  }) {
    return const GoogleMapsCurrentLocationWidget();
  }

  String addressToString(geocoding.Placemark data) {
    return '''
      ${data.name}, 
      ${data.street}, ${data.subLocality}, ${data.locality},
      ${data.subAdministrativeArea}, ${data.administrativeArea}, 
      ${data.postalCode}. 
      ''';
  }

  List<Widget> _formFieldsWidgets(context, createServiceFormBloc) {
    List<Widget> widgets = [];

    widgets.add(Container(
      padding: const EdgeInsets.all(8.0),
      height: 12.h,
      color: Colors.blue.shade100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          rowChild(serviceModel!.serviceNo.toString(), 'Service No', 3),
          rowChild(serviceModel!.serviceStatusName.toString(), 'Status', 2),
          rowChild(serviceModel!.versionNo.toString(), 'Version No', 2),
        ],
      ),
    ));

    if (columnComponentWidgets != null && columnComponentWidgets.isNotEmpty) {
      widgets.addAll(columnComponentWidgets);
    }
    if (componentComListWidgets != null && componentComListWidgets.isNotEmpty) {
      widgets.addAll(componentComListWidgets);
    }
    widgets.add(Container(
      height: 200,
    ));
    return widgets;
  }

  _displayFooterWidget(
    CreateServiceFormBloc createServiceFormBloc,
  ) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          // Visibility(
          //   visible: APIEndpointConstants.isEmployeePortal &&
          //       serviceModel!.isCompleteButtonVisible!,
          //   child: PrimaryButton(
          //     backgroundColor: Colors.green,
          //     buttonText: 'Complete',
          //     handleOnPressed: () => serviceViewModelPostRequest(
          //       2,
          //       'SERVICE_STATUS_COMPLETE',
          //       createServiceFormBloc,
          //     ),
          //     width: 100,
          //   ),
          // ),
          // Visibility(
          //   visible: APIEndpointConstants.isEmployeePortal &&
          //       serviceModel!.isCancelButtonVisible!,
          //   child: PrimaryButton(
          //     backgroundColor: Colors.red,
          //     buttonText: 'Cancel',
          //     handleOnPressed: () {
          //       if (serviceModel!.isCancelReasonRequired!) {
          //         enterReasonAlertDialog(context);
          //       }
          //       serviceViewModelPostRequest(
          //         2,
          //         'SERVICE_STATUS_CANCEL',
          //         createServiceFormBloc,
          //       );
          //     },
          //     width: 100,
          //   ),
          // ),
          Visibility(
            visible: serviceModel!.isCloseButtonVisible!,
            child: PrimaryButton(
              buttonText: 'Close',
              handleOnPressed: () => Navigator.pop(context),
              width: 100,
            ),
          ),
          Visibility(
            visible: serviceModel!.isDraftButtonVisible!,
            child: PrimaryButton(
              backgroundColor: Colors.greenAccent,
              buttonText: 'Draft',
              handleOnPressed: () {
                serviceViewModelPostRequest(
                  1,
                  'SERVICE_STATUS_DRAFT',
                  createServiceFormBloc,
                );
              },
              width: 100,
            ),
          ),
          Visibility(
            visible: serviceModel!.isSubmitButtonVisible!,
            child: PrimaryButton(
              buttonText: 'Submit',
              handleOnPressed: () {
                for (var i = 0; i < columnComponentList.length; i++) {
                  if (columnComponentList[i].validate?.required != null &&
                      columnComponentList[i].validate!.required == true &&
                      udfJson.containsKey(columnComponentList[i].key) &&
                      (udfJson[columnComponentList[i].key] == null ||
                          udfJson[columnComponentList[i].key]!.isEmpty)) {
                    if (columnComponentList[i].key == 'IAgree') {
                      displaySnackBar(
                          text: 'I Agree is required', context: context);
                    } else {
                      displaySnackBar(
                          text: 'Please enter ${columnComponentList[i].label}',
                          context: context);
                    }
                    return;
                  } else if (columnComponentList[i].validate?.required !=
                          null &&
                      columnComponentList[i].validate!.required == true &&
                      columnComponentList[i].key == 'IAgree' &&
                      udfJson['IAgree'] != 'true') {
                    displaySnackBar(
                        text: 'I Agree is required', context: context);
                    return;
                  }
                  if (columnComponentList[i].validate?.required != null &&
                      columnComponentList[i].validate!.required == true &&
                      columnComponentList[i].type == 'email') {
                    if (!handleEmailValidation(
                        udfJson[columnComponentList[i].key]!)) {
                      displaySnackBar(
                          text: 'Please enter valid email address',
                          context: context);
                      return;
                    }
                  }
                  if (_phoneNumberConditions(i)) {
                    if (!validateMobile(udfJson[columnComponentList[i].key]!)) {
                      return displaySnackBar(
                          text:
                              'Please enter valid ${columnComponentList[i].label}',
                          context: context);
                      // return;
                    }
                  }
                }
                serviceViewModelPostRequest(
                  1,
                  'SERVICE_STATUS_INPROGRESS',
                  createServiceFormBloc,
                );
              },
              width: 100,
            ),
          ),
        ],
      ),
    );
  }

  String? slaValue;
  DateTime? startDate;
  DateTime? dueDate;
  DateTime? reminderDate;
  Service postServiceModel = Service();
  String resultMsg = '';

  serviceViewModelPostRequest(int postDataAction, String serviceStatusCode,
      CreateServiceFormBloc createServiceFormBloc) async {
    String userId = widget.userID;
    postServiceModel = Service.fromJson(serviceModel!.toJson());
    postServiceModel.ownerUserId = userId;
    if (startDate != null && startDate.toString().isNotEmpty) {
      postServiceModel.startDate = startDate.toString();
    }
    if (dueDate != null && dueDate.toString().isNotEmpty) {
      postServiceModel.dueDate = dueDate.toString();
    }
    if (reminderDate != null && reminderDate.toString().isNotEmpty) {
      postServiceModel.reminderDate = reminderDate.toString();
    }
    if (slaValue != null && slaValue!.isNotEmpty) {
      postServiceModel.sla = slaValue;
    }
    postServiceModel.requestedByUserId = userId;
    postServiceModel.serviceSubject = createServiceFormBloc.subject.value;
    postServiceModel.serviceDescription =
        createServiceFormBloc.description.value;
    postServiceModel.dataAction = widget.serviceId.isEmpty ? 1 : 2;
    postServiceModel.serviceStatusCode = serviceStatusCode;
    postServiceModel.portalId = !widget.isEmployeePortal
        ? APIEndpointConstants.EGOV_CUSTOMER_PORTAL_ID
        : APIEndpointConstants.EGOV_EMPLOYEE_PORTAL_ID;
    postServiceModel.portalName = !widget.isEmployeePortal
        ? APIEndpointConstants.EGOV_CUSTOMER_PORTAL_NAME
        : APIEndpointConstants.EGOV_EMPLOYEE_PORTAL_NAME;
    postServiceModel.json = jsonEncode(udfJson);

    setState(() {
      isVisible = true;
    });

    PostResponse result = await serviceBloc.postServiceData(
      isEmployeeService: widget.isEmployeeService ?? false,
      userId: widget.userID,
      service: postServiceModel,
      categoryCode: widget.categoryCode,
    );

    if (result.isSuccess!) {
      setState(() {
        isVisible = false;
      });
      resultMsg = result.messages!;
      Navigator.pop(context);
    } else {
      setState(() {
        isVisible = false;
      });
      resultMsg = result.messages ?? 'Submission unsuccessful!';
    }
    displaySnackBar(
      text: '$resultMsg' '\t\t' 'Service No: ${postServiceModel.serviceNo}',
      context: context,
    );
  }

  void compareStartEndDate(
      {DateTime? startDate,
      DateTime? enddate,
      BuildContext? context,
      bool? updateDuration}) {
    if (enddate!.isBefore(startDate!)) {
      _showMyDialog();
    } else if (updateDuration!) {
      updateLeaveDuration();
    }
  }

  void updateLeaveDuration() {
    if (leaveStartDate != null && leaveEnddate != null) {
      var durationCalendarDays = leaveEnddate?.difference(leaveStartDate!);

      setState(() {
        leaveDurationControllerCalendarDays.text =
            (durationCalendarDays?.inDays ?? 0 + 1).toString();
      });
    }
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('End Date Should be greater than Start Date.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  editServiceDDValue({
    String? idKey,
    String? nameKey,
    String? url,
    String? code,
    TextEditingController? ddController,
  }) async {
    NTSDropdownRepository ntsDdRepository = NTSDropdownRepository();
    String completeUrl = url! + "&filterKey=$idKey&filterValue=$code";
    NTSDropdownResponse ntsDdResponse = await ntsDdRepository.getFilteredDDData(
      idKey: idKey,
      nameKey: nameKey,
      url: completeUrl,
    );

    ddController!.text = ntsDdResponse.data?.elementAt(0).name ?? '';
  }

  rowChild(String data, String field, int flex) {
    return Expanded(
      flex: flex,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            data,
            style: TextStyle(color: Colors.blue.shade800, fontSize: 14),
          ),
          Text(
            field,
            style: const TextStyle(
              color: AppThemeColor.textColorDark,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  _phoneNumberConditions(int i) {
    return ((((columnComponentList[i].type == 'number' &&
                    (columnComponentList[i].key!.contains('MobileNo') ||
                        columnComponentList[i].key!.contains('ContactNumber') ||
                        columnComponentList[i].key!.contains('ContactNo'))) ||
                columnComponentList[i].type == 'phoneNumber') &&
            udfJson[columnComponentList[i].key] != null &&
            udfJson[columnComponentList[i].key].isNotEmpty) ||
        ((columnComponentList[i].validate?.required != null &&
                columnComponentList[i].validate!.required == true &&
                ((columnComponentList[i].type == 'number' &&
                        (columnComponentList[i].key!.contains('MobileNo') ||
                            columnComponentList[i]
                                .key!
                                .contains('ContactNumber') ||
                            columnComponentList[i]
                                .key!
                                .contains('ContactNo'))) ||
                    columnComponentList[i].type == 'phoneNumber')) &&
            columnComponentList[i].disabled.toString() != 'true'));
  }

  @override
  void dispose() {
    columnComponentWidgets = [];
    componentComListWidgets = [];
    super.dispose();
  }
}
