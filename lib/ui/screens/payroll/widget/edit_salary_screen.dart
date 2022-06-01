import 'package:flutter/material.dart';
import 'package:hr_management/themes/theme_config.dart';
import 'package:hr_management/ui/widgets/nts_dropdown_select.dart';
import 'package:hr_management/ui/widgets/primary_button.dart';
import 'package:sizer/sizer.dart';

class EditSalaryInfoScreen extends StatefulWidget {
  EditSalaryInfoScreen({Key? key}) : super(key: key);

  @override
  State<EditSalaryInfoScreen> createState() => _EditSalaryInfoScreenState();
}

class _EditSalaryInfoScreenState extends State<EditSalaryInfoScreen> {
  TextEditingController personController = TextEditingController();
  TextEditingController payCalendarController = TextEditingController();
  TextEditingController flightTicketFrequencyController =
      TextEditingController();
  TextEditingController overtimePaymentTypeController = TextEditingController();
  TextEditingController payGroupController = TextEditingController();
  TextEditingController paymentModeController = TextEditingController();

  bool value0 = false;
  bool value1 = false;
  bool value2 = false;
  bool value3 = false;
  bool value4 = false;
  bool value5 = false;
  bool value6 = false;
  bool value7 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Salary Info')),
      body:
          //
          Container(
        padding: DEFAULT_PADDING,
        margin: DEFAULT_PADDING,
        child: ListView(
          children: [
            NTSDropDownSelect(
              isPrefixIcon: false,
              controller: personController,
              isShowArrow: true,
              hint: 'Person',
              idKey: '',
              isInitial: true,
              nameKey: '',
              title: 'Person',
              url: '',
              onListTap: (v) {},
            ),
            //
            NTSDropDownSelect(
              isPrefixIcon: false,
              controller: payCalendarController,
              isShowArrow: true,
              hint: 'Pay Calendar',
              idKey: '',
              isInitial: true,
              nameKey: '',
              title: 'Pay Calendar',
              url: '',
              onListTap: (v) {},
            ),
            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              title: Text('IsEmployeeEligibleForOvertime'),
              value: value0,
              onChanged: (val) {
                setState(() {
                  value0 = val ?? false;
                });
              },
            ),
            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              title: Text('IsEmployeeEligibleForFlightTicketsForSelf'),
              value: value1,
              onChanged: (val) {
                setState(() {
                  value1 = val ?? false;
                });
              },
            ),
            NTSDropDownSelect(
              isPrefixIcon: false,
              controller: flightTicketFrequencyController,
              isShowArrow: true,
              hint: 'FlightTicketFrequency',
              idKey: '',
              isInitial: true,
              nameKey: '',
              title: 'FlightTicketFrequency',
              url: '',
              onListTap: (v) {},
            ),
            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              title: Text('IsValidateDependentDocumentForBenefit'),
              value: value2,
              onChanged: (val) {
                setState(() {
                  value2 = val ?? false;
                });
              },
            ),
            NTSDropDownSelect(
              isPrefixIcon: false,
              controller: overtimePaymentTypeController,
              isShowArrow: true,
              hint: 'OvertimePaymentType',
              idKey: '',
              isInitial: true,
              nameKey: '',
              title: 'OvertimePaymentType',
              url: '',
              onListTap: (v) {},
            ),
            NTSDropDownSelect(
              isPrefixIcon: false,
              controller: payGroupController,
              isShowArrow: true,
              hint: 'Pay Group',
              idKey: '',
              isInitial: true,
              nameKey: '',
              title: 'Pay Group',
              url: '',
              onListTap: (v) {},
            ),

            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              title: Text('TakeAttendanceFromTAA'),
              value: value3,
              onChanged: (val) {
                setState(() {
                  value3 = val ?? false;
                });
              },
            ),
            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              title: Text('IsEmployeeEligibleForEndOfService'),
              value: value4,
              onChanged: (val) {
                setState(() {
                  value4 = val ?? false;
                });
              },
            ),
            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              title: Text('IsEmployeeEligibleForFlightTicketsForDependants'),
              value: value5,
              onChanged: (val) {
                setState(() {
                  value5 = val ?? false;
                });
              },
            ),
            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              title: Text('DisableFlightTicketProcessingInPayroll'),
              value: value6,
              onChanged: (val) {
                setState(() {
                  value6 = val ?? false;
                });
              },
            ),
            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              title: Text('IsEligibleForSalaryTransferLetter'),
              value: value7,
              onChanged: (val) {
                setState(() {
                  value7 = val ?? false;
                });
              },
            ),
            NTSDropDownSelect(
              isPrefixIcon: false,
              controller: paymentModeController,
              isShowArrow: true,
              hint: 'Payment Mode',
              idKey: '',
              isInitial: true,
              nameKey: '',
              title: 'Payment Mode',
              url: '',
              onListTap: (v) {},
            ),
            SizedBox(
              height: 5.h,
            )
          ],
        ),
      ),
      bottomSheet: Row(
        children: [
          Flexible(
            child: SecondaryButton(
              backgroundColor: Theme.of(context).primaryColor,
              buttonText: 'Close',
              handleOnPressed: () => Navigator.of(context).pop(),
            ),
          ),
          Flexible(
            child: PrimaryButton(
              backgroundColor: Theme.of(context).primaryColor,
              buttonText: 'Submit',
              handleOnPressed: () => _handleSubmitOnPressed(),
            ),
          ),
        ],
      ),
      //
    );
  }

  _handleSubmitOnPressed() {}
}
