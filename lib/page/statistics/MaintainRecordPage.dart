import 'package:crab/model/PostList.dart';
import 'package:crab/utils/HttpDataFetcher.dart';
import 'package:crab/utils/LocalTextData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MaintainRecordPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MaintainRecordPageState();
}

class MaintainRecordPageState extends State<MaintainRecordPage> {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  DateTime maintainStartDate = DateTime.now();
  DateTime maintainEndDate = DateTime.now();
  DateFormat dateFormat = DateFormat('yyyy-MM-dd');
  String value;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('维修记录'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () async => showSearchDialog(),
            )
          ],
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              buildSelectDateField(),
              buildMaintainDateField(),
              buildEquipmentList()
            ],
          ),
        ));
  }

  Expanded buildEquipmentList() {
    return Expanded(
      child: FutureBuilder<PostList>(
        future: fetchAllPost(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.postList.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  height: 100,
                  color: Colors.teal[100 * (index % 9)],
                  child: ListTile(
                    title: Text(
                      snapshot.data.postList[index].title,
                      maxLines: 1,
                    ),
                    subtitle: Text(
                      snapshot.data.postList[index].body,
                      maxLines: 2,
                    ),
                    trailing: Icon(Icons.keyboard_arrow_right),
                  ),
                );
              },
            );
          } else if (snapshot.hasData) {
            return Text(snapshot.error);
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }

  Future<bool> showSearchDialog() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            // title: Text('添加服务器',textAlign: TextAlign.center,),
            contentPadding: EdgeInsets.only(left: 10, right: 10),
            content: SingleChildScrollView(
                child: ListBody(
              children: <Widget>[
                TextFormField(
                  decoration:
                      InputDecoration(labelText: '设备', hintText: '请输入仪器编号/名称'),
                ),
              ],
            )),
            actions: <Widget>[
              FlatButton(
                child: Text('查询'),
                onPressed: () {},
              ),
            ],
          );
        });
  }

  Row buildSelectDateField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text('选择日期'),
        FlatButton(
          child: Text(dateFormat.format(startDate)),
          onPressed: () async {
            final selectDate = await selectDateTime(context);
            if (selectDate == null) return;
            setState(() {
              this.startDate =
                  DateTime(selectDate.year, selectDate.month, selectDate.day);
            });
          },
        ),
        Text('至'),
        FlatButton(
          child: Text(dateFormat.format(endDate)),
          onPressed: () async {
            final selectDate = await selectDateTime(context);
            if (selectDate == null) return;
            setState(() {
              this.endDate =
                  DateTime(selectDate.year, selectDate.month, selectDate.day);
            });
          },
        ),
      ],
    );
  }

  Row buildMaintainDateField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text('维修日期'),
        FlatButton(
          child: Text(dateFormat.format(startDate)),
          onPressed: () async {
            final selectDate = await selectDateTime(context);
            if (selectDate == null) return;
            setState(() {
              this.maintainStartDate =
                  DateTime(selectDate.year, selectDate.month, selectDate.day);
            });
          },
        ),
        Text('至'),
        FlatButton(
          child: Text(dateFormat.format(endDate)),
          onPressed: () async {
            final selectDate = await selectDateTime(context);
            if (selectDate == null) return;
            setState(() {
              this.maintainEndDate =
                  DateTime(selectDate.year, selectDate.month, selectDate.day);
            });
          },
        ),
      ],
    );
  }
}
