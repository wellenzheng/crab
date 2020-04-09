import 'package:crab/model/Record.dart';
import 'package:crab/model/RecordMessage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:crab/utils/LocalTextData.dart';

class ScrappedRecordPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ScrappedRecordPageState();
}

class ScrappedRecordPageState extends State<ScrappedRecordPage> {
  List<Record> recordList = genRecordList('已报废');
  DateTime scrappedStartDate = DateTime.now();
  DateTime scrappedEndDate = DateTime.now();
  DateFormat dateFormat = DateFormat('yyyy-MM-dd');
  String value;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('已报废记录'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async => showSearchDialog(),
          )
        ],
      ),
      body: Column(
        children: <Widget>[buildScrappingDateField(), buildRecordList()],
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

  Row buildScrappingDateField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text('报废日期'),
        FlatButton(
          child: Text(dateFormat.format(scrappedStartDate)),
          onPressed: () async {
            final selectDate = await selectDateTime(context);
            if (selectDate == null) return;
            setState(() {
              this.scrappedStartDate =
                  DateTime(selectDate.year, selectDate.month, selectDate.day);
            });
          },
        ),
        Text('至'),
        FlatButton(
          child: Text(dateFormat.format(scrappedEndDate)),
          onPressed: () async {
            final selectDate = await selectDateTime(context);
            if (selectDate == null) return;
            setState(() {
              this.scrappedEndDate =
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
                      RecordMessage(prefix: '待报废', record: recordList[index]));
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}
