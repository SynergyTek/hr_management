import 'package:flutter/material.dart';

import '../../../../data/enums/enums.dart';
import '../../../../data/models/attachment_nts_models/attachment_nts_model.dart';
import '../../../../data/models/attachment_nts_models/attachment_nts_response.dart';
import '../../../../logic/blocs/attachment_nts_bloc/attachment_nts_bloc.dart';
import '../../../../themes/theme_config.dart';
import '../../../widgets/progress_indicator.dart';

class 
AttachmentNTSBodyWidget extends StatefulWidget {
  final NTSType ntsType;
  final String ntsId;

  AttachmentNTSBodyWidget({
    @required this.ntsType,
    @required this.ntsId,
  });

  @override
  _AttachmentNTSBodyWidgetState createState() =>
      _AttachmentNTSBodyWidgetState();
}

class _AttachmentNTSBodyWidgetState extends State<AttachmentNTSBodyWidget> {
  @override
  void initState() {
    super.initState();

    attachmentNTSBloc
      ..getData(
        ntsId: widget?.ntsId,
        ntsType: widget?.ntsType,
      );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: DEFAULT_PADDING,
      child: StreamBuilder<AttachmentNTSResponse>(
        stream: attachmentNTSBloc.subject.stream,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.error != null && snapshot.data.error.length > 0) {
              return Center(
                child: Text(snapshot.data.error),
              );
            }

            return _attachmentListWidget(snapshot.data.data);
          } else {
            return CustomProgressIndicator();
          }
        },
      ),
    );
  }

  Widget _attachmentListWidget(List<AttachmentNTSModel> data) {
    if (data == null || data.isEmpty)
      return Center(
        child: Text(
          "No data found.",
          style: Theme.of(context).textTheme.bodyText1.copyWith(
                color: Theme.of(context).textHeadingColor,
              ),
        ),
      );

    return ListView.builder(
      itemCount: data?.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        return _eachListTile(
          data: data.elementAt(index),
        );
      },
    );
  }

  Widget _eachListTile({
    @required AttachmentNTSModel data,
  }) {
    return ListTile(
      onTap: () => _handleViewOnPressed(data: data),
      leading: Icon(Icons.attachment_outlined),
      title: Text(
        data?.fileName ?? '-',
        style: TextStyle(
          color: Theme.of(context).textHeadingColor,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(data?.size ?? '-'),
          Text(data?.createdDateDisplay ?? '-'),
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () => _handleDownloadOnPressed(data: data),
            icon: Icon(
              Icons.download_sharp,
              color: Colors.blue,
            ),
          ),
          IconButton(
            onPressed: () => _handleDeleteOnPressed(data: data),
            icon: Icon(
              Icons.delete_forever_sharp,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  void _handleDeleteOnPressed({
    @required AttachmentNTSModel data,
  }) {
    attachmentNTSBloc
      ..deleteData(
        queryparams: {
          'Id': data.id,
        },
        ntsId: widget?.ntsId ?? '',
        ntsType: widget?.ntsType ?? NTSType.service,
      );
  }

  void _handleDownloadOnPressed({
    @required AttachmentNTSModel data,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Feature under development."),
      ),
    );
  }

  void _handleViewOnPressed({
    @required AttachmentNTSModel data,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Feature under development."),
      ),
    );
  }
}
