import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hr_management/data/helpers/showup.dart';

import 'tile_block.dart';

class TaskWorklist extends StatelessWidget {
  const TaskWorklist({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 12.0,
      mainAxisSpacing: 12.0,
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      children: <Widget>[
        buildTile(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 3.0),
                        child: InkWell(
                            child: Text('Assigned To Me',
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    decoration: TextDecoration.underline)),
                            onTap: () {}),
                      ),
                      ShowUp(
                        child: Text('10',
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w700,
                                fontSize: 30.0)),
                        delay: 100,
                      ),
                    ],
                  ),
                  Material(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(24.0),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child:
                            Icon(Icons.person, color: Colors.white, size: 30.0),
                      )))
                ]),
          ),
          heading: '',
          context: context,
        ),
        buildTile(
          child: worklistTileWidget(
            bgColor: Colors.red,
            value: '10',
            heading: 'Overdue',
          ),
          heading: 'Overdue',
          context: context,
          tabName: "TaskAssigned",
        ),
        buildTile(
            child: worklistTileWidget(
              bgColor: Colors.amber,
              value: '10',
              heading: 'Pending',
            ),
            heading: 'Pending',
            context: context,
            tabName: "TaskAssigned"),
        buildTile(
          child: worklistTileWidget(
            bgColor: Colors.lime,
            value: '10',
            heading: 'Completed',
          ),
          heading: 'Completed',
          context: context,
          tabName: "TaskAssigned",
        ),
        buildTile(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 3.0),
                        child: InkWell(
                            child: Text('Requested By Me',
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    decoration: TextDecoration.underline)),
                            onTap: () {}),
                      ),
                      ShowUp(
                        child: Text('10',
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w700,
                                fontSize: 30.0)),
                        delay: 100,
                      ),
                    ],
                  ),
                  Material(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(24.0),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Icon(Icons.computer,
                            color: Colors.white, size: 30.0),
                      )))
                ]),
          ),
          heading: '',
          context: context,
        ),
        buildTile(
          child: worklistTileWidget(
            bgColor: Colors.red,
            value: '10',
            heading: 'Overdue',
          ),
          heading: 'Overdue',
          context: context,
          tabName: "TaskRequested",
        ),
        buildTile(
            child: worklistTileWidget(
              bgColor: Colors.amber,
              value: '10',
              heading: 'Pending',
            ),
            heading: 'Pending',
            context: context,
            tabName: "TaskRequested"),
        buildTile(
            child: worklistTileWidget(
              bgColor: Colors.lime,
              value: '10',
              heading: 'Completed',
            ),
            heading: 'Completed',
            context: context,
            tabName: "TaskRequested"),
        buildTile(
            child: worklistTileWidget(
              bgColor: Colors.deepPurple,
              value: '10',
              heading: 'Draft',
            ),
            heading: 'Draft',
            context: context,
            tabName: "TaskRequested"),
        buildTile(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 3.0),
                          child: InkWell(
                            child: Text('Shared With Me/Team',
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    decoration: TextDecoration.underline)),
                            onTap: () {},
                          ),
                        ),
                        ShowUp(
                          child: Text('10',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 30.0)),
                          delay: 100,
                        ),
                      ],
                    ),
                    Material(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(24.0),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Icon(Icons.swap_horizontal_circle,
                              color: Colors.white, size: 30.0),
                        )))
                  ]),
            ),
            heading: '',
            context: context),
        buildTile(
            child: worklistTileWidget(
              bgColor: Colors.red,
              value: '10',
              heading: 'Overdue',
            ),
            heading: 'Overdue',
            context: context,
            tabName: "TaskShared"),
        buildTile(
            child: worklistTileWidget(
              bgColor: Colors.amber,
              value: '10',
              heading: 'Pending',
            ),
            heading: 'Pending',
            context: context,
            tabName: "TaskShared"),
        buildTile(
            child: worklistTileWidget(
              bgColor: Colors.lime,
              value: '10',
              heading: 'Completed',
            ),
            heading: 'Completed',
            context: context,
            tabName: "TaskShared"),
      ],
      staggeredTiles: [
        StaggeredTile.extent(3, 110.0),
        StaggeredTile.extent(1, 130.0),
        StaggeredTile.extent(1, 130.0),
        StaggeredTile.extent(1, 130.0),
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
