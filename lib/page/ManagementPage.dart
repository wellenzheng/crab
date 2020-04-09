// TODO Implement this library.

import 'package:crab/utils/CustomSearchDelegate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ManagementPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ManagementPageState();
}

class ManagementPageState extends State<ManagementPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('设备管理'),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () =>
                showSearch(context: context, delegate: CustomSearchDelegate()),
          )
        ],
      ),
      body: buildButtonList(context),
    );
  }

  Align buildButtonList(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: double.infinity,
              minHeight: 60,
            ),
            child: RaisedButton.icon(
              icon: Icon(Icons.view_list),
              label: Text("设备管理"),
              onPressed: () {
                Navigator.pushNamed(context, 'equipmentManagement');
              },
            ),
          ),
          SizedBox(height: 2),
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: double.infinity,
              minHeight: 60,
            ),
            child: RaisedButton.icon(
              icon: Icon(Icons.av_timer),
              label: Text("待审核设备"),
              onPressed: () {
                Navigator.pushNamed(context, 'reviewingEquipment');
              },
            ),
          ),
          SizedBox(height: 2),
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: double.infinity,
              minHeight: 60,
            ),
            child: RaisedButton.icon(
              icon: Icon(Icons.build),
              label: Text("维修管理"),
              onPressed: () {
                Navigator.pushNamed(context, 'maintainManagement');
              },
            ),
          ),
          SizedBox(height: 2),
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: double.infinity,
              minHeight: 60,
            ),
            child: RaisedButton.icon(
              icon: Icon(Icons.autorenew),
              label: Text("调拨管理"),
              onPressed: () {
                Navigator.pushNamed(context, 'allocateManagement');
              },
            ),
          ),
          SizedBox(height: 2),
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: double.infinity,
              minHeight: 60,
            ),
            child: RaisedButton.icon(
              icon: Icon(Icons.delete_outline),
              label: Text("待报废管理"),
              onPressed: () {
                Navigator.pushNamed(context, 'scrappingManagement');
              },
            ),
          ),
        ],
      ),
    );
  }
}
