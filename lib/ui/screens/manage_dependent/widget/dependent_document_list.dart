import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_management/logic/blocs/user_model_bloc/user_model_bloc.dart';
import '../../../listizer/listizer.dart';

import '../../../../data/models/dependent/dependent_doc_req_model.dart';
import '../../../../logic/blocs/dependent_bloc/dependent_api_bloc.dart';
import '../../../../routes/route_constants.dart';
import '../../../../routes/screen_arguments.dart';
import '../../../widgets/empty_list_widget.dart';
import '../../../widgets/progress_indicator.dart';

class DependentDocumentList extends StatefulWidget {
  @override
  _DependentDocumentListState createState() => _DependentDocumentListState();
}

class _DependentDocumentListState extends State<DependentDocumentList> {
  List<DependentDocReqListModel>? _dependnetDocReqList = [];
  List<DependentDocReqListModel> _filteredDependnetDocReqList = [];

  @override
  void initState() {
    super.initState();

    dependentBloc
      ..getReadDependnetDocReqResponse(queryparams: {
        'userId':
            BlocProvider.of<UserModelBloc>(context).state.userModel?.id ?? "",
        
      });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: dependentBloc.subjectDependnetDocReqResponse.stream,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return Center(
              child: Text(snapshot.data.error),
            );
          }
          if (snapshot.data.data == null || snapshot.data.data.length == 0) {
            return EmptyListWidget();
          }

          _dependnetDocReqList = snapshot.data.data;
          return Listizer(
            listItems: _dependnetDocReqList,
            filteredSearchList: _filteredDependnetDocReqList,
            itemBuilder: (context, index) {
              return _dependentDocListCard(index: index);
            },
          );
        } else {
          return Center(
            child: CustomProgressIndicator(),
          );
        }
      },
    );
  }

  _dependentDocListCard({required int index}) {
    return Card(
      elevation: 4,
      child: ListTile(
        title: Text(_dependnetDocReqList![index].documentType!),
        subtitle: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("Service No: "),
                      Text(_dependnetDocReqList![index].serviceNo!),
                    ],
                  )
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    _dependnetDocReqList![index].status!,
                    style: TextStyle(color: Colors.green[800]),
                  ),
                ),
                Text(
                  _dependnetDocReqList![index]
                      .issueDate
                      .toString()
                      .split(' ')[0],
                  style: TextStyle(color: Colors.red[700]),
                ),
              ],
            ),
          ],
        ),
        onTap: () {
          Navigator.pushNamed(
            context,
            CREATE_SERVICE_ROUTE,
            arguments: ScreenArguments(
              arg1: _dependnetDocReqList![index].templateCode,
              arg2: _dependnetDocReqList![index].serviceId,
              arg3: '',
              val1: false,
            ),
          );
        },
      ),
    );
  }
}
