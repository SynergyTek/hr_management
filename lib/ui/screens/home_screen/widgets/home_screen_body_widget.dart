import '../../../widgets/progress_indicator.dart';

import '../../../../data/models/api_models/api_response_model.dart';
import '../../../../logic/blocs/api_bloc/api_bloc.dart';
import '../../../../themes/theme_config.dart';
import 'package:flutter/material.dart';

class HomeScreenBodyWidget extends StatefulWidget {
  HomeScreenBodyWidget();

  @override
  _HomeScreenBodyWidgetState createState() => _HomeScreenBodyWidgetState();
}

class _HomeScreenBodyWidgetState extends State<HomeScreenBodyWidget> {
  @override
  void initState() {
    super.initState();

    // Getting the initial data.
    apiBloc..getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DEFAULT_LARGE_PADDING,
      child: StreamBuilder<APIResponse>(
          stream: apiBloc.subject.stream,
          builder: (context, AsyncSnapshot<APIResponse> snapshot) {
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

  Widget _listWidget(APIResponse apiResponse) {
    return ListView.builder(
      itemCount: apiResponse?.data?.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            title: Text(apiResponse?.data?.elementAt(index)?.title ?? "-"),
            subtitle:
                Text(apiResponse?.data?.elementAt(index)?.overview ?? "-"),
            leading: Image.network(
              "https://image.tmdb.org/t/p/w200/" +
                  apiResponse?.data?.elementAt(index)?.poster,
            ),
            trailing: Text(
                apiResponse?.data?.elementAt(index)?.rating.toString() ?? "-"),
          ),
        );
      },
    );
  }
}
