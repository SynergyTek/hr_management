import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/logic/blocs/user_model_bloc/user_model_bloc.dart';
import '../../../../constants/api_endpoints.dart';
import '../../../../data/models/employee_profile_models/employee_profile_model.dart';
import '../../../../data/models/employee_profile_models/employee_profile_response.dart';
import '../../../../logic/blocs/employee_profile_bloc/employee_profile_bloc.dart';
import '../../../../themes/theme_config.dart';
import '../../../widgets/progress_indicator.dart';
import 'package:intl/intl.dart';

part './my_profile_helper_widgets.dart';

class MyProfileBodyWidget extends StatefulWidget {
  const MyProfileBodyWidget();

  @override
  _MyProfileBodyWidgetState createState() => _MyProfileBodyWidgetState();
}

class _MyProfileBodyWidgetState extends State<MyProfileBodyWidget> {
  @override
  void initState() {
    super.initState();

    // Initialising the stream with data from the API.
    employeeProfileBloc
      ..getEmployeeProfileData(
        queryparams: _handleQueryparams(),
      );
  }

  /// Helper function to handle queryparams of the API call.
  _handleQueryparams() {
    return {
      'userid':
          BlocProvider.of<UserModelBloc>(context).state?.userModel?.id ?? '',
    };
  }

  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Theme.of(context).textHeadingColor,
      child: StreamBuilder<EmployeeProfileResponse>(
        stream: employeeProfileBloc.subjectEmployeeProfile.stream,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.error != null && snapshot.data.error.length > 0) {
              return Center(
                child: Text(snapshot.data.error),
              );
            }

            if (snapshot?.data?.data == null)
              return Center(
                child: Text("No data available."),
              );

            return _widget(data: snapshot.data.data);
          } else {
            return CustomProgressIndicator(
              loadingText: "Fetching data...",
            );
          }
        },
      ),
    );
  }

  Widget _widget({
    @required EmployeeProfileModel data,
  }) {
    return Container(
      child: Stack(
        children: [
          _upperSectionWidget(data: data),

          // Lower section
          Positioned(
            bottom: 0,
            child: _lowerSectionWidget(data: data),
          ),
        ],
      ),
    );
  }

  Widget _upperSectionWidget({
    @required EmployeeProfileModel data,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          _profilePicture(
            profilePicturePath: data.photoName,
          ),
          _profileInformation(
            context: context,
            data: data,
          ),
        ],
      ),
    );
  }

  Widget _lowerSectionWidget({
    @required EmployeeProfileModel data,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.65,
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            36.0,
          ),
          topRight: Radius.circular(
            36.0,
          ),
        ),
      ),
      child: ListView(
        shrinkWrap: true,
        children: [
          _basicInformationWidget(
            context: context,
            data: data,
          ),
          _jobDetailsWidget(
            context: context,
            data: data,
          ),
          _presentCountryAddressWidget(
            context: context,
            data: data,
          ),
          _homeCountryAddressWidget(
            context: context,
            data: data,
          ),
          _emergencyContactInfo1Widget(
            context: context,
            data: data,
          ),
          _emergencyContactInfo2Widget(
            context: context,
            data: data,
          ),
        ],
      ),
    );
  }
}
