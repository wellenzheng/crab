import 'package:crab/model/Laboratory.dart';
import 'package:crab/utils/LocalTextData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EquipmentAddingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => EquipmentAddingPageState();
}

class EquipmentAddingPageState extends State<EquipmentAddingPage> {
  List<Laboratory> labList = genLaboratoryList();
  String laboratory;
  int currentState;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('设备添加'),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
            buildEquipmentIdField(),
            buildEquipmentNameField(),
            buildShowNameField(),
            buildRegistererField(),
            buildLaboratoryField(),
            buildPositionField(),
            buildClassIdField(),
            buildCompanyIdField(),
            buildModelTypeField(),
            buildSpecificationField(),
            buildProducingCountryField(),
            buildFactoryNumberField(),
            buildFactoryNameField(),
            buildSupplierField(),
            buildFactoryDateField(),
            buildPurchaseDateField(),
            buildPriceField(),
            buildInvoiceField(),
            buildFundingSubjectField(),
            buildEquipmentOriginField(),
            buildUsingDirectionField(),
            buildCurrentStateField(),
            buildManagerField(),
            buildUserField(),
            buildTemporarUseryField(),
            buildAnnualInAndDecreaseField(),
            buildCreditDateField(),
            buildBillIdField(),
            buildCancelDateField(),
            buildCancelApproverField(),
            buildAttachmentField(),
            buildNoteField(),
            buildSaveButton()
          ],
        ),
      ),
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

  Padding buildShowNameField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
        labelText: '显示名',
      )),
    );
  }

  Padding buildRegistererField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
        labelText: '登记人',
      )),
    );
  }

  Padding buildLaboratoryField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: DropdownButton(
        items: generateDropdownItems(labList),
        hint: Text('实验室(必填)'), // 当没有初始值时显示
        onChanged: (selectValue) {
          //选中后的回调
          setState(() {
            laboratory = selectValue;
          });
        },
        value: laboratory, // 设置初始值，要与列表中的value是相同的
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

  Padding buildPositionField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
        labelText: '放置地点(必填)',
      )),
    );
  }

  Padding buildClassIdField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
        labelText: '分类号',
      )),
    );
  }

  Padding buildCompanyIdField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
        labelText: '单位编号',
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

  Padding buildSupplierField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
        labelText: '供应商',
      )),
    );
  }

  Padding buildFactoryDateField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
        labelText: '出厂日期',
      )),
    );
  }

  Padding buildPurchaseDateField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
        labelText: '购置日期',
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
        labelText: '厂家',
      )),
    );
  }

  Padding buildFundingSubjectField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
        labelText: '经费科目',
      )),
    );
  }

  Padding buildEquipmentOriginField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
        labelText: '仪器来源',
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

  Padding buildCurrentStateField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: DropdownButton(
        items: [
          DropdownMenuItem(
            child: Text('未使用'),
            value: 0,
          ),
          DropdownMenuItem(
            child: Text('在用'),
            value: 1,
          )
        ],
        hint: Text("仪器现状"), // 当没有初始值时显示
        onChanged: (selectValue) {
          //选中后的回调
          setState(() {
            currentState = selectValue;
          });
        },
        value: currentState, // 设置初始值，要与列表中的value是相同的
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

  Padding buildManagerField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
        labelText: '设备管理员',
      )),
    );
  }

  Padding buildUserField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
        labelText: '仪器使用人',
      )),
    );
  }

  Padding buildTemporarUseryField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
        labelText: '临时使用人',
      )),
    );
  }

  Padding buildAnnualInAndDecreaseField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
        labelText: '年增减值',
      )),
    );
  }

  Padding buildCreditDateField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
        labelText: '入账日期',
      )),
    );
  }

  Padding buildBillIdField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
        labelText: '报增单号',
      )),
    );
  }

  Padding buildCancelDateField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
        labelText: '注销日期',
      )),
    );
  }

  Padding buildCancelApproverField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
        labelText: '注销批准人',
      )),
    );
  }

  Padding buildAttachmentField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
        labelText: '有附件标注',
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
}
