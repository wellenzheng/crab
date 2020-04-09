import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersonalEquipmentAddingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PersonalEquipmentAddingPageState();
}

class PersonalEquipmentAddingPageState extends State<PersonalEquipmentAddingPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('添加个人设备'),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
            buildIdField(),
            buildNameField(),
            buildAliasField(),
            buildPositionField(),
            buildRoomNumberField(),
            buildModelTypeField(),
            buildSpecificationField(),
            buildProducingCountryField(),
            buildFactoryNumberField(),
            buildFactoryNameField(),
            buildPurchaseTimeField(),
            buildPriceField(),
            buildInvoiceField(),
            buildUsingDirectionField(),
            buildUserField(),
            buildNoteField(),
            buildSaveButton()
          ],
        ),
      ),
    );
  }

  Padding buildIdField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
        labelText: '仪器编号(必填)',
      )),
    );
  }

  Padding buildNameField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
        labelText: '仪器名称(必填)',
      )),
    );
  }

  Padding buildAliasField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
        labelText: '别名',
      )),
    );
  }

  Padding buildPositionField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
        labelText: '放置地点(必填)',
      )),
    );
  }

  Padding buildRoomNumberField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
        labelText: '所在房间号',
      )),
    );
  }

  Padding buildModelTypeField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
        labelText: '型号',
      )),
    );
  }

  Padding buildSpecificationField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
        labelText: '规格',
      )),
    );
  }

  Padding buildProducingCountryField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
        labelText: '生产国',
      )),
    );
  }

  Padding buildFactoryNumberField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
        labelText: '出厂号',
      )),
    );
  }

  Padding buildFactoryNameField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
        labelText: '厂家',
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

  Padding buildPriceField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
        labelText: '单价',
      )),
    );
  }

  Padding buildInvoiceField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
        labelText: '发票号',
      )),
    );
  }

  Padding buildUsingDirectionField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
        labelText: '使用方向',
      )),
    );
  }

  Padding buildUserField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
        labelText: '使用人',
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
        buttonMinWidth: 150,
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
