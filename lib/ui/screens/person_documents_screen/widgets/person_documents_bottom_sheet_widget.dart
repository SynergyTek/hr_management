import 'package:flutter/material.dart';
import 'package:hr_management/data/models/documents_models/person_document_models/person_document_model.dart';
import '../../../../../themes/theme_config.dart';

class PersonDocumentsBottomSheetWidget extends StatelessWidget {
  final PersonDocumentsModel data;

  const PersonDocumentsBottomSheetWidget({
    @required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            16.0,
          ),
          topRight: Radius.circular(
            16.0,
          ),
        ),
      ),
      padding: DEFAULT_LARGE_PADDING,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text(
              data?.documentType ?? '',
              style: TextStyle(
                color: Theme.of(context).textHeadingColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              data?.serviceNo ?? 'NA',
            ),
            trailing: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    data?.status ?? 'NA',
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.headline6.fontSize,
                      color: _handleListTileColor(context),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("Status"),
                ],
              ),
            ),
          ),
          ListTile(
            title: Text(data?.issueDate ?? "NA"),
            subtitle: Text("Issue Date"),
          ),
          ListTile(
            title: Text(data?.expiryDate ?? "NA"),
            subtitle: Text("Expiry Date"),
          ),
        ],
      ),
    );
  }

  /// Helper function to handle color of the status.
  Color _handleListTileColor(BuildContext context) {
    // Guard clause
    if (data?.status == null || data.status.isEmpty) return Colors.white54;

    if (data.status == 'In Progress') return Colors.green;
    if (data.status == 'Draft') return Colors.orangeAccent;
    if (data.status == 'Overdue') return Colors.redAccent;

    return Theme.of(context).invertedColor;
  }
}
