import 'package:crab/model/EquipmentInfo.dart';
import 'package:crab/model/Record.dart';
import 'package:crab/model/RecordMessage.dart';
import 'package:crab/utils/LocalTextData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AllocateRecordPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AllocateRecordPageState();
}

class AllocateRecordPageState extends State<AllocateRecordPage> {
  List<Record> recordList = genRecordList('调拨');
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  DateTime allocateStartDate = DateTime.now();
  DateTime allocateEndDate = DateTime.now();
  DateFormat dateFormat = DateFormat('yyyy-MM-dd');
  String value;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('调拨记录'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async => showSearchDialog(),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          buildSelectDateField(),
          buildAllocateDateField(),
          buildRecordList()
        ],
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

  Row buildAllocateDateField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text('调拨日期'),
        FlatButton(
          child: Text(dateFormat.format(startDate)),
          onPressed: () async {
            final selectDate = await selectDateTime(context);
            if (selectDate == null) return;
            setState(() {
              this.allocateStartDate =
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
              this.allocateEndDate =
                  DateTime(selectDate.year, selectDate.month, selectDate.day);
            });
          },
        ),
      ],
    );
  }

  Expanded buildRecordList() {
    return Expanded(
      child: ListView.separated(
        itemCount: recordList.length,
        itemBuilder: (BuildContext context, int index) {
          String n = recordList[index].name;
          DateTime d = recordList[index].dateTime;
          return ListTile(
            title: Text('$n'),
            subtitle: Text('$d'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.pushNamed(context, 'recordDetails',
                  arguments:
                      RecordMessage(prefix: '调拨', record: recordList[index]));
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}
