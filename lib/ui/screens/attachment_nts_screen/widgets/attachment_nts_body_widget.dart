import 'package:flutter/material.dart';
import '../../../../data/enums/enums.dart';
import '../../../../data/models/attachment_nts_models/attachment_nts_model.dart';
import '../../../../data/models/attachment_nts_models/attachment_nts_response.dart';
import '../../../../logic/blocs/attachment_nts_bloc/attachment_nts_bloc.dart';
import '../../../../themes/theme_config.dart';
import '../../../widgets/progress_indicator.dart';

class AttachmentNTSBodyWidget extends StatefulWidget {
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
        ntsId: widget?.ntsId ?? '',
        ntsType: widget?.ntsType ?? NTSType.service,
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

            if (snapshot?.data?.data == null || snapshot.data.data.length == 0)
              return Center(
                child: Text(
                  "No data found.",
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: Theme.of(context).textHeadingColor,
                      ),
                ),
              );

            return _attachmentListWidget(snapshot.data.data);
          } else {
            return CustomProgressIndicator();
          }
        },
      ),
    );
  }

  Widget _attachmentListWidget(List<AttachmentNTSModel> data) {
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
      leading: Icon(Icons.attachment_outlined),
      // leading: CircleAvatar(
      //   child: Icon(Icons.attachment_outlined),
      //   backgroundColor: Theme.of(context).textHeadingColor,
      //   foregroundColor: Colors.white,
      // ),
      title: Text(data?.fileName ?? '-'),
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
            onPressed: () => null,
            icon: Icon(
              Icons.download_outlined,
              // Icons.download,
            ),
          ),
          IconButton(
            onPressed: () => attachmentNTSBloc
              ..deleteData(
                queryparams: {
                  'Id': data.id,
                },
                ntsId: widget?.ntsId ?? '',
                ntsType: widget?.ntsType ?? NTSType.service,
              ),
            icon: Icon(
              Icons.delete,
            ),
          ),
        ],
      ),
    );
  }
}
