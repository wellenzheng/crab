// TODO Implement this library.

import 'package:crab/utils/CustomSearchDelegate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatisticsPage extends StatefulWidget {
  @override
  StatefulElement createElement() => new StatefulElement(this);

  @override
  State createState() => StatisticsPageState();
}

class StatisticsPageState extends State<StatisticsPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("查询统计"),
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
              icon: Icon(Icons.search),
              label: Text("设备查询"),
              onPressed: () {
                Navigator.pushNamed(context, 'equipmentSearch');
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
              label: Text("维修记录"),
              onPressed: () {
                Navigator.pushNamed(context, 'maintainRecord');
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
              label: Text("调拨记录"),
              onPressed: () {
                Navigator.pushNamed(context, 'allocateRecord');
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
              label: Text("待报废记录"),
              onPressed: () {
                Navigator.pushNamed(context, 'scrappingRecord');
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
              icon: Icon(Icons.delete_forever),
              label: Text("已报废记录"),
              onPressed: () {
                Navigator.pushNamed(context, 'scrappedRecord');
              },
            ),
          ),
        ],
      ),
    );
  }
}
