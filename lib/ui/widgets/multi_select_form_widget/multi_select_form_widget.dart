import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hr_management/themes/theme_config.dart';

import '../primary_button.dart';
import '../progress_indicator.dart';

///
/// !CAUTION: Don't forget to pass the Type <T> as it would make the rendering erroneous.
/// !CAUTION: <T> class should be the Model class and not the Response class.
/// !CAUTION: the title key should be same as what we are receiving from API.
///
class MultiSelectFormWidget<T> extends StatefulWidget {
  final Function initCallback;
  final Stream stream;
  final String titleKey;
  final Map<String?, T>? selectedDataMap;
  final String? onWillPopScopeErrorMessage;

  MultiSelectFormWidget({
    required this.initCallback,
    required this.stream,
    required this.titleKey,
    required this.selectedDataMap,
    this.onWillPopScopeErrorMessage,
  }) : assert(titleKey != null);

  @override
  _MultiSelectFormWidgetState<T> createState() =>
      _MultiSelectFormWidgetState<T>();
}

class _MultiSelectFormWidgetState<T> extends State<MultiSelectFormWidget> {
  Map<String?, T>? selectedDataMap;

  @override
  void initState() {
    super.initState();

    widget.initCallback();

    if (widget.selectedDataMap == null ||
        widget.selectedDataMap!.keys.isEmpty) {
      selectedDataMap = Map<String?, T>();
    } else {
      selectedDataMap = widget.selectedDataMap as Map<String?, T>?;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              widget.onWillPopScopeErrorMessage ??
                  'Please use the action buttons to navigate.',
            ),
          ),
        );
        return false;
      },
      child: Container(
        padding: DEFAULT_PADDING,
        child: StreamBuilder(
          stream: widget.stream,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data.error != null &&
                  snapshot.data.error.length > 0) {
                return Center(
                  child: Text(snapshot.data.error),
                );
              }

              return _bodyWidget(snapshot.data.data);
            } else {
              return CustomProgressIndicator();
            }
          },
        ),
      ),
    );
  }

  Widget _bodyWidget(List<T>? data) {
    if (data == null || data.isEmpty)
      return Center(
        child: Text(
          "No data found.",
          style: Theme.of(context).textTheme.headline6!.copyWith(
                color: Theme.of(context).textHeadingColor,
              ),
        ),
      );

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Flexible(
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> _eachListTile = jsonDecode(
                jsonEncode(
                  data.elementAt(index),
                ),
              );

              return CheckboxListTile(
                value:
                    selectedDataMap!.containsKey(_eachListTile[widget.titleKey]),
                onChanged: (bool? _) {
                  // If the entry is already present in the map,
                  // i.e. the value is already selected,
                  // remove the entry from the selected data map.

                  if (selectedDataMap!
                      .containsKey(_eachListTile[widget.titleKey])) {
                    // print("Removing: ${_eachListTile[widget.titleKey]}");

                    selectedDataMap!.remove(_eachListTile[widget.titleKey]);
                  }

                  // else: it is a fresh entry and we need to add it to the map.
                  else {
                    // print("Adding: ${_eachListTile[widget.titleKey]}");

                    selectedDataMap![_eachListTile[widget.titleKey]] =
                        data.elementAt(index);
                  }

                  // To update the state (i.e. value) of the checkbox in the UI.
                  setState(() {});
                },
                title: Text(_eachListTile[widget.titleKey] ?? ""),
                // subtitle: Text("subtitle"),
              );
            },
          ),
        ),
        Container(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: PrimaryButton(
                  backgroundColor: Colors.white10,
                  foregroundColor: Colors.black87,
                  buttonText: "Cancel",
                  handleOnPressed: () => _handleCancelOnPressed(),
                ),
              ),
              Expanded(
                child: PrimaryButton(
                  buttonText: "Save",
                  handleOnPressed: () => _handleSaveOnPressed(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _handleCancelOnPressed() {
    Navigator.of(context).pop(widget.selectedDataMap);
  }

  _handleSaveOnPressed() {
    Navigator.of(context).pop(
      selectedDataMap,
    );
  }
}
