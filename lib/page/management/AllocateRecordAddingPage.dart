import 'package:crab/model/Laboratory.dart';
import 'package:crab/utils/LocalTextData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllocateRecordAddingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AllocateRecordAddingPageState();
}

class AllocateRecordAddingPageState extends State<AllocateRecordAddingPage> {
  List<Laboratory> labList = genLaboratoryList();
  String toLaboratory;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('添加调拨记录'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          buildEquipmentSelectionField(),
          buildEquipmentIdField(),
          buildEquipmentNameField(),
          buildEquipmentTypeField(),
          buildEquipmentPositionField(),
          buildToLabField(),
          buildToPositionField(),
          buildReceptorField(),
          buildAllocateTimeField(),
          buildAllocateReasonField(),
          buildAllowerField(),
          buildHandlerField(),
          buildFillTimeField(),
          buildNoteField(),
          buildSaveButton()
        ],
      ),
    );
  }

  Padding buildEquipmentSelectionField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
        labelText: '选择仪器设备',
        hintText: '请输入仪器设备编号或名称或型号',
      )),
    );
  }

  Padding buildEquipmentIdField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
        labelText: '仪器编号',
      )),
    );
  }

  Padding buildEquipmentNameField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
        labelText: '仪器名称',
      )),
    );
  }

  Padding buildEquipmentTypeField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
        labelText: '仪器型号',
      )),
    );
  }

  Padding buildEquipmentPositionField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
        labelText: '存放地点',
      )),
    );
  }

  Padding buildToLabField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: DropdownButton(
        items: generateDropdownItems(labList),
        hint: Text('调入实验室'), // 当没有初始值时显示
        onChanged: (selectValue) {
          //选中后的回调
          setState(() {
            toLaboratory = selectValue;
          });
        },
        value: toLaboratory, // 设置初始值，要与列表中的value是相同的
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

  Padding buildToPositionField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
        labelText: '调入地址',
      )),
    );
  }

  Padding buildReceptorField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
        labelText: '接收人',
      )),
    );
  }

  Padding buildAllocateTimeField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
        labelText: '调拨时间',
      )),
    );
  }

  Padding buildAllocateReasonField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
        labelText: '调拨原因',
      )),
    );
  }

  Padding buildAllowerField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
        labelText: '批准人',
      )),
    );
  }

  Padding buildHandlerField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
        labelText: '经办人',
      )),
    );
  }

  Padding buildFillTimeField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
        labelText: '填写时间',
      )),
    );
  }

  Padding buildNoteField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
        labelText: '备注',
      )),
    );
  }

  Padding buildSaveButton() {
    return Padding(
      padding: EdgeInsets.only(top: 100),
      child: Center(
          child: ButtonBar(
        alignment: MainAxisAlignment.spaceEvenly,
        buttonHeight: 45,
        buttonMinWidth: 100,
        children: <Widget>[
          RaisedButton(
            child: Text(
              '取消',
              style: Theme.of(context).primaryTextTheme.headline,
            ),
            color: Colors.grey,
            onPressed: () {
              Navigator.pop(context);
            },
            shape: StadiumBorder(),
          ),
          RaisedButton(
            child: Text(
              '保存并提交',
              style: Theme.of(context).primaryTextTheme.headline,
            ),
            color: Colors.red,
            onPressed: () {},
            shape: StadiumBorder(),
          ),
          RaisedButton(
            child: Text(
              '保存',
              style: Theme.of(context).primaryTextTheme.headline,
            ),
            color: Colors.blue,
            onPressed: () {},
            shape: StadiumBorder(),
          ),
        ],
      )),
    );
  }

  List<DropdownMenuItem<String>> generateDropdownItems(
      List<Laboratory> labList) {
    List<DropdownMenuItem<String>> list = List();
    for (Laboratory laboratory in labList) {
      list.add(DropdownMenuItem(
        value: laboratory.name,
        child: Text(laboratory.name),
      ));
    }
    return list;
  }

  Future<DateTime> setDatePicker(BuildContext context) {
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light(),
          child: child,
        );
      },
    );
  }
}
