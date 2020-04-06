import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrappedRecordAddingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ScrappedRecordAddingPageState();
}

class ScrappedRecordAddingPageState extends State<ScrappedRecordAddingPage> {
  // Future<DateTime> selectedDate;

  @override
  Widget build(BuildContext context) {
    // selectedDate = setDatePicker(context);
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('添加报废记录'),
        ),
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(10.0),
            children: <Widget>[
              buildEquipmentSelectionField(),
              buildEquipmentIdField(),
              buildEquipmentNameField(),
              buildEquipmentTypeField(),
              buildEquipmentPositionField(),
              buildPriceField(),
              buildPurchaseTimeField(),
              buildReasonField(),
              buildHandlerField(),
              buildFillTimeField(),
              buildNoteField(),
              buildSaveButton()
            ],
          ),
        ));
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

  Padding buildPriceField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
        labelText: '价格(元)',
      )),
    );
  }

  Padding buildPurchaseTimeField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
        labelText: '购置时间',
      )),
    );
  }

  Padding buildReasonField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
        labelText: '报废原因',
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
