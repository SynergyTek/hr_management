import 'package:flutter/material.dart';

import '../../../bloc/service_bloc/abstract_service_bloc.dart';
import '../../../constants/enums.dart';
import '../../../models/service_models/service_response.dart';
import '../../widgets/custom_progress_indicator.dart';
import '../../widgets/empty_list_widget.dart';
import '../../widgets/listizer.dart';
import 'tag_list_tile.dart';

class TagNTSBodyWidget extends StatefulWidget {
  final NTSType? ntsType;
  final String? ntsId;

  TagNTSBodyWidget({
    required this.ntsType,
    required this.ntsId,
  });

  @override
  TagNTSBodyWidgetState createState() => TagNTSBodyWidgetState();
}

class TagNTSBodyWidgetState extends State<TagNTSBodyWidget> {
  List<Service>? _serviceList = [];
  List<Service> _filteredServiceList = [];

  @override
  void initState() {
    super.initState();
    apiCall();
  }

  apiCall() {
    Map<String, dynamic> queryparams = Map();
    serviceBloc.subjectServiceList.sink.add(null);
    queryparams['userId'] = '45bba746-3309-49b7-9c03-b5793369d73c';
    serviceBloc.getServiceHomeListData(queryparams: queryparams);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: StreamBuilder<ServiceListResponse?>(
            stream: serviceBloc.subjectServiceList.stream,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data.error != null &&
                    snapshot.data.error.length > 0) {
                  return Center(
                    child: Text(snapshot.data.error),
                  );
                }

                if (snapshot.data.list == null ||
                    snapshot.data.list.length == 0) {
                  return EmptyListWidget();
                }
                _serviceList = snapshot.data.list;
                return Listizer(
                  listItems: _serviceList,
                  filteredSearchList: _filteredServiceList,
                  itemBuilder: (context, index) {
                    return TagListCard(
                      index: index,
                      serviceList: _serviceList,
                      onTap: true,
                    );
                  },
                );
              } else {
                return const Center(
                  child: CustomProgressIndicator(),
                );
              }
            },
          ),
        )
      ],
    );
  }
}
