import 'package:crab/model/EquipmentInfo.dart';
import 'package:crab/model/Record.dart';
import 'package:crab/model/RecordMessage.dart';
import 'package:crab/utils/LocalTextData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MaintainManagementPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MaintainManagementPageState();
}

class MaintainManagementPageState extends State<MaintainManagementPage> {
  List<Record> recordList = genRecordList('维修');
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  DateTime maintainStartDate = DateTime.now();
  DateTime maintainEndDate = DateTime.now();
  DateFormat dateFormat = DateFormat('yyyy-MM-dd');
  String reviewingState;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('维修管理'),
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
          buildMaintainDateField(),
          buildReviewingStateDropdown(),
          buildRecordList()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, 'maintainRecordAdding');
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

  Padding buildReviewingStateDropdown() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: DropdownButton(
        items: genReviewingStateDropdownItems(),
        hint: Text('审核状态'), // 当没有初始值时显示
        isExpanded: true,
        onChanged: (selectValue) {
          //选中后的回调
          setState(() {
            reviewingState = selectValue;
          });
        },
        value: reviewingState, // 设置初始值，要与列表中的value是相同的
        elevation: 10, //设置阴影
        style: TextStyle(
            //设置文本框里面文字的样式
            color: Colors.blue,
            fontSize: 15),
        iconSize: 30, //设置三角标icon的大小
        underline: Container(
          height: 1,
          color: Colors.blue,
        ), // 下划线
      ),
    );
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
                      RecordMessage(prefix: '维修', record: recordList[index]));
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}
