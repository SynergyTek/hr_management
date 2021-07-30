import 'package:flutter/material.dart';

import '../../../../data/models/counts_api_models/counts_api_response.dart';
import '../../../../logic/blocs/counts_api_bloc/counts_api_bloc.dart';
import '../../../../themes/theme_config.dart';
import '../../../widgets/progress_indicator.dart';

class CountsScreenBodyWidget extends StatefulWidget {
  CountsScreenBodyWidget();

  @override
  _CountsScreenBodyWidgetState createState() => _CountsScreenBodyWidgetState();
}

class _CountsScreenBodyWidgetState extends State<CountsScreenBodyWidget> {
  @override
  void initState() {
    super.initState();

    // Getting the initial data.
    countsAPIBloc..getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: DEFAULT_LARGE_PADDING,
      child: StreamBuilder<CountsAPIResponse>(
          stream: countsAPIBloc.subject.stream,
          builder: (context, AsyncSnapshot<CountsAPIResponse> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.error != null &&
                  snapshot.data.error.length > 0) {
                return Center(
                  child: Text(snapshot.data.error),
                );
              }

              return _listWidget(
                snapshot.data,
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.data.error),
              );
            } else {
              return _loadingWidget();
            }
          }),
    );
  }

  Widget _loadingWidget() {
    return Center(
      child: CustomProgressIndicator(),
    );
  }

  Widget _listWidget(CountsAPIResponse apiResponse) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.1,
      color: Theme.of(context).textHeadingColor.withOpacity(0.85),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          _eachCount(
            tooltip: "Attachments count",
            count: apiResponse.data.serviceAttachmentCount,
            icon: Icon(
              Icons.attach_file,
              color: Colors.white,
            ),
          ),
          _eachCount(
            tooltip: "Comments count",
            count: apiResponse.data.serviceCommentsCount,
            icon: Icon(
              Icons.comment_outlined,
              color: Colors.white,
            ),
          ),
          _eachCount(
            tooltip: "Notifications count",
            count: apiResponse.data.serviceNotificationCount,
            icon: Icon(
              Icons.notifications_on_outlined,
              color: Colors.white,
            ),
          ),
          _eachCount(
            tooltip: "Shared count",
            count: apiResponse.data.serviceSharedCount,
            icon: Icon(
              Icons.share_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _eachCount({
    @required String tooltip,
    @required int count,
    @required Icon icon,
  }) {
    return Expanded(
      child: Tooltip(
        message: tooltip,
        child: Container(
          child: Stack(
            children: [
              Positioned(
                top: 0.0,
                left: MediaQuery.of(context).size.width * 0.165,
                child: Text(
                  count.toString() ?? "",
                  style: Theme.of(context).textTheme.headline6.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
              Center(child: icon),
            ],
          ),
        ),
      ),
    );
  }
}
