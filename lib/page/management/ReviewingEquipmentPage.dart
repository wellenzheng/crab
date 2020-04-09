import 'package:crab/model/Equipment.dart';
import 'package:crab/utils/LocalTextData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReviewingEquipmentPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ReviewingEquipmentPageState();
}

class ReviewingEquipmentPageState extends State<ReviewingEquipmentPage> {
  List<Equipment> equipmentList = generateEquipmentList();
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  DateFormat dateFormat = DateFormat('yyyy-MM-dd');
  String reviewingState;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('待审核设备'),
      ),
      body: Column(
        children: <Widget>[
          buildSelectDateField(),
          buildReviewingStateDropdown(),
          buildEquipmentList()
        ],
      ),
    );
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

  Expanded buildEquipmentList() {
    return Expanded(
      child: ListView.separated(
        itemCount: equipmentList.length,
        itemBuilder: (BuildContext context, int index) {
          String n = equipmentList[index].name;
          DateTime d = equipmentList[index].purchaseDateTime;
          return ListTile(
            title: Text('$n'),
            subtitle: Text('$d'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.pushNamed(context, 'equipmentDetails',
                  arguments: equipmentList[index]);
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}
