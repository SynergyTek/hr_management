library listizer;

import 'package:flutter/material.dart';

typedef Widget ItemBuilder(BuildContext context, dynamic item);

class Listizer extends StatefulWidget {
  final List<dynamic>? listItems;
  final List<dynamic>? filteredSearchList;
  final ItemBuilder? itemBuilder;
  final bool? showSearchBar;
  final bool? doAddSeperator;
  final ScrollController? controller;
  Listizer({
    this.listItems,
    this.itemBuilder,
    this.filteredSearchList,
    this.controller,
    this.showSearchBar,
    this.doAddSeperator,
  });

  @override
  _ListizerState createState() => _ListizerState();
}

class _ListizerState extends State<Listizer> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();
  ScrollController? _controller = new ScrollController();
  TextEditingController searchTextController = TextEditingController();
  bool status = false;
  bool isSearch = false;
  bool scrollNotificationPredicate(ScrollNotification notification) {
    if (notification.metrics.pixels == 80.0) {
      status = true;
    }

    if (status == false) {
      return notification.depth == 100;
    } else {
      return notification.depth == 0;
    }
  }

  @override
  void initState() {
    if (widget.controller != null) {
      _controller = widget.controller;
    }
    //  widget.filteredSearchList.addAll(widget.listItems);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!isSearch) {
      setState(() {
        widget.filteredSearchList!.clear();
        widget.filteredSearchList!.addAll(widget.listItems!);
      });
    }
    return Column(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: RefreshIndicator(
            notificationPredicate: scrollNotificationPredicate,
            key: _refreshIndicatorKey,
            onRefresh: _refreshList,
            child: ListView.separated(
              controller: _controller,
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),

              separatorBuilder: (context, index) {
                return widget.doAddSeperator == null
                    ? Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Divider(
                          color: index == 0 ? Colors.transparent : Colors.grey,
                        ),
                      )
                    : Container();
              },
              // controller: _controller,
              shrinkWrap: true,
              itemCount: widget.filteredSearchList!.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: _searchBarBuilder(context),
                  );
                } else {
                  return widget.itemBuilder!(context, index - 1);
                }
              },
            ),
          ),
        ),
        // ),
      ],
    );
  }

  Future<void> _refreshList() async {
    // print("No Data to Refresh");
  }

  Widget _searchBarBuilder(BuildContext context) {
    return (widget.showSearchBar != null && widget.showSearchBar == true)
        ? Container(
            height: 55,
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: TextField(
              onChanged: (value) {
                filterSearchResults(value);
              },
              controller: searchTextController,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelStyle: TextStyle(fontSize: 20.0, color: Colors.grey),
                  labelText: "Search",
                  hintText: "Search",
                  hintStyle: TextStyle(fontSize: 18.0, color: Colors.grey),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey[400],
                  ),
                  suffixIcon: IconButton(
                      icon: Icon(
                        Icons.cancel,
                        size: 22.0,
                      ),
                      onPressed: reset),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  )),
            ),
          )
        : Container();
  }

  void filterSearchResults(String searchText) {
    setState(() {
      widget.filteredSearchList!.clear();
      if (searchText.isNotEmpty) {
        isSearch = true;
        widget.listItems!.forEach((item) {
          if (item.searchS != null &&
              item.searchS.toLowerCase().contains(searchText.toLowerCase())) {
            widget.filteredSearchList!.add(item);
          }
        });
      } else {
        isSearch = false;
      }
    });
  }

  void reset() {
    setState(() {
      isSearch = false;
      searchTextController.clear();
      widget.filteredSearchList!.clear();
      widget.filteredSearchList!.addAll(widget.listItems!);
      FocusScope.of(context).requestFocus(new FocusNode());
    });
  }
}
