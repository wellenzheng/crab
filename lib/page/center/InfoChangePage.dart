import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoChangePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InfoChangePageState();
}

class InfoChangePageState extends State<InfoChangePage> {
  final formKey = GlobalKey<FormState>();
  String userType = '普通用户';
  String userRole = '系统管理员';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('修改个人信息'),
      ),
      body: Form(
          key: formKey,
          child: ListView(
            padding: EdgeInsets.all(10.0),
            children: <Widget>[
              buildNameTextField(),
              buildEmailTextField(),
              buildPhoneTextField(),
              buildNoteTextField(),
              buildUserTypeField(),
              buildUserRoleField(),
              buildSaveButton()
            ],
          )),
    );
  }

  Padding buildNameTextField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
        labelText: '姓名',
      )),
    );
  }

  Padding buildEmailTextField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
        labelText: '邮箱',
      )),
    );
  }

  Padding buildPhoneTextField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
        labelText: '手机',
      )),
    );
  }

  Padding buildNoteTextField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
          decoration: InputDecoration(
        labelText: '备注',
      )),
    );
  }

  Padding buildUserTypeField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: ListTile(
        title: Text('用户类型'),
        subtitle: Text('$userType'),
      ),
    );
  }

  Padding buildUserRoleField() {
    return Padding(
      padding: EdgeInsets.only(),
      child: ListTile(
        title: Text('用户角色'),
        subtitle: Text('$userRole'),
      ),
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
