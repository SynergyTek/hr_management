import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'tile_block.dart';

class ServiceWorklist extends StatelessWidget {
  const ServiceWorklist({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 12.0,
      mainAxisSpacing: 12.0,
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      children: <Widget>[
        buildTile(
          isTile: false,
          title: 'Requested By Me',
          context: context,
          //value: '10',
        ),
        buildTile(
          isTile: true,
          title: 'Overdue',
          bgColor: Colors.red,
          context: context,
          //value: '10',
          tabName: "ServiceRequested",
        ),
        buildTile(
            isTile: true,
            title: 'Pending',
            bgColor: Colors.amber,
            context: context,
            //value: '10',
            tabName: "ServiceRequested"),
        buildTile(
            isTile: true,
            title: 'Completed',
            context: context,
            bgColor: Colors.lime,
            //value: '10',
            tabName: "ServiceRequested"),
        buildTile(
            isTile: true,
            title: 'Draft',
            bgColor: Colors.deepPurple,
            context: context,
            //value: '10',
            tabName: "ServiceRequested"),
        buildTile(
            isTile: false,
            //value: '10',
            title: 'Shared With Me/Team',
            context: context),
        buildTile(
            isTile: true,
            title: 'Overdue',
            bgColor: Colors.red,
            context: context,
            //value: '10',
            tabName: "ServiceShared"),
        buildTile(
            isTile: true,
            title: 'Pending',
            bgColor: Colors.amber,
            //value: '10',
            context: context,
            tabName: "ServiceShared"),
        buildTile(
            isTile: true,
            title: 'Completed',
            bgColor: Colors.lime,
            //value: '10',
            context: context,
            tabName: "ServiceShared"),
      ],
      staggeredTiles: [
        // StaggeredTile.extent(3, 110.0),
        // StaggeredTile.extent(1, 130.0),
        // StaggeredTile.extent(1, 130.0),
        // StaggeredTile.extent(1, 130.0),
        StaggeredTile.extent(3, 110.0),
        StaggeredTile.extent(1, 130.0),
        StaggeredTile.extent(1, 130.0),
        StaggeredTile.extent(1, 130.0),
        StaggeredTile.extent(1, 130.0),
        StaggeredTile.extent(3, 110.0),
        StaggeredTile.extent(1, 130.0),
        StaggeredTile.extent(1, 130.0),
        StaggeredTile.extent(1, 130.0),
      ],
    );
  }
}
