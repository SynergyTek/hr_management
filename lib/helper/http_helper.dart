import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hr_management/constants/endpoint_constants.dart';
import 'package:hr_management/ui/widgets/snack_bar.dart';
import 'package:http/http.dart' as http;
import 'package:hr_management/data/models/api_models/leave_temp_model.dart';

Future<List<LeaveTemplateModel>> httpFetchLeaveTemplate(
    {BuildContext context}) async {
  List<LeaveTemplateModel> returnList = [];
  try {
    final response = await http.get(
      Uri.http(EndpointConstants.API_URL, APIEndpointConstants.LEAVE_TEMPLATE),
    );

    if (response?.body != null && response.statusCode == 200) {
      var apiRes = jsonDecode(response.body)['Data'];
      returnList = apiRes;
    } else {
      displaySnackBar(
          text: 'Something Went Wrong',
          snackBarcolor: Colors.red,
          context: context);
    }
  } on TimeoutException catch (ex) {
    timeOutSnackbar(context: context);
    print(ex);
  } on SocketException catch (ex) {
    print(ex);
    networkSnackbar(context: context);
  } on Exception catch (ex) {
    print(ex);
    errorSnackbar(context: context);
  } on Error catch (e) {
    print(e);
  }
  return returnList;
}
