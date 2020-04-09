import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PasswordChangePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PasswordChangePageState();
}

class PasswordChangePageState extends State<PasswordChangePage> {
  final formKey = GlobalKey<FormState>();
  Color eyeColor;
  String password;
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('修改密码'),
      ),
      body: Form(
          key: formKey,
          child: ListView(
            padding: EdgeInsets.all(10.0),
            children: <Widget>[
              buildOldPasswordTextField(),
              buildNewPasswordTextField(),
              buildNewPasswordConfirmTextField(),
              buildSaveButton()
            ],
          )),
    );
  }

  Padding buildOldPasswordTextField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
        onSaved: (String value) => password = value,
        obscureText: isObscure,
        validator: (String value) {
          if (value.isEmpty) {
            return '请输入旧密码';
          }
        },
        decoration: InputDecoration(
            labelText: '旧密码',
            suffixIcon: IconButton(
                icon: Icon(
                  Icons.remove_red_eye,
                  color: eyeColor,
                ),
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                    eyeColor = isObscure
                        ? Colors.grey
                        : Theme.of(context).iconTheme.color;
                  });
                })),
      ),
    );
  }

  Padding buildNewPasswordTextField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
        onSaved: (String value) => password = value,
        obscureText: isObscure,
        validator: (String value) {
          if (value.isEmpty) {
            return '请输入新密码';
          }
        },
        decoration: InputDecoration(
            labelText: '请输入新密码',
            suffixIcon: IconButton(
                icon: Icon(
                  Icons.remove_red_eye,
                  color: eyeColor,
                ),
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                    eyeColor = isObscure
                        ? Colors.grey
                        : Theme.of(context).iconTheme.color;
                  });
                })),
      ),
    );
  }

  Padding buildNewPasswordConfirmTextField() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
        onSaved: (String value) => password = value,
        obscureText: isObscure,
        validator: (String value) {
          if (value.isEmpty) {
            return '请重新输入新密码';
          }
        },
        decoration: InputDecoration(
            labelText: '请重新输入新密码',
            suffixIcon: IconButton(
                icon: Icon(
                  Icons.remove_red_eye,
                  color: eyeColor,
                ),
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                    eyeColor = isObscure
                        ? Colors.grey
                        : Theme.of(context).iconTheme.color;
                  });
                })),
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
