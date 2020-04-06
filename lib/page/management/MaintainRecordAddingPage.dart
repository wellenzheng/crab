import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MaintainRecordAddingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MaintainRecordAddingPageState();
}

class MaintainRecordAddingPageState extends State<MaintainRecordAddingPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('添加维修记录'),
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
            buildMaintainTimeField(),
            buildMaintainReasonField(),
            buildMaintainStateField(),
            buildPriceField(),
            buildMaintainCompanyField(),
            buildContactField(),
            buildHandlerField(),
            buildFillTimeField(),
            buildNoteField(),
            buildSaveButton()
          ],
        ),
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

  Padding buildMaintainTimeField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
        labelText: '维修时间',
      )),
    );
  }

  Padding buildMaintainReasonField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
        labelText: '故障现象及原因',
      )),
    );
  }

  Padding buildMaintainStateField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
        labelText: '维修情况',
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

  Padding buildMaintainCompanyField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
        labelText: '维修单位',
      )),
    );
  }

  Padding buildContactField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
        labelText: '联系方式',
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
}
