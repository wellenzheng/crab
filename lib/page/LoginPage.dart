import 'package:flutter/material.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  String username, password;
  bool isObscure = true;
  Color eyeColor;
  bool selected = false;
  String serverName = "默认服务器";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: formKey,
          child: SafeArea(
              child: ListView(
            padding: EdgeInsets.all(10.0),
            children: <Widget>[
              buildTitle(),
              buildTitleLine(),
              SizedBox(height: 70.0),
              buildUsernameTextField(),
              SizedBox(height: 30.0),
              buildPasswordTextField(context),
              buildRememberAndForgetPasswordText(context),
              buildServerTextField(context),
              SizedBox(height: 60.0),
              buildLoginButton(context),
              SizedBox(height: 50.0),
              buildRegisterText(context),
            ],
          ))),
    );
  }

  Padding buildTitle() {
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            '登录',
            style: TextStyle(fontSize: 42.0),
          ),
        ));
  }

  Padding buildTitleLine() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          color: Colors.black,
          width: 80.0,
          height: 2.0,
        ),
      ),
    );
  }

  TextFormField buildUsernameTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: '用户名',
      ),
      validator: (String value) {
        if (value != 'ksxu') return '请输入正确的用户名';
        // var emailReg = RegExp(
        //     r"[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?");
        // if (!emailReg.hasMatch(value)) {
        //   return '请输入正确的邮箱地址';
        // }
      },
      onSaved: (String value) => username = value,
    );
  }

  TextFormField buildPasswordTextField(BuildContext context) {
    return TextFormField(
      onSaved: (String value) => password = value,
      obscureText: isObscure,
      validator: (String value) {
        if (value != '2t88pmQs') {
          return '请输入正确的密码';
        }
      },
      decoration: InputDecoration(
          labelText: '密码',
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
    );
  }

  Padding buildRememberAndForgetPasswordText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Checkbox(
                  value: selected,
                  activeColor: Colors.blue,
                  onChanged: (value) {
                    setState(() {
                      selected = value;
                    });
                  }),
              Text("记住密码"),
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: FlatButton(
              child: Text(
                '忘记密码？',
                style: TextStyle(fontSize: 14.0, color: Colors.grey),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  Padding buildServerTextField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0, left: 10.0, right: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('服务器: $serverName'),
          IconButton(
            icon: Icon(
              Icons.build,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pushNamed(context, 'serverList');
            },
          )
        ],
      ),
    );
  }

  Align buildLoginButton(BuildContext context) {
    return Align(
      child: SizedBox(
        height: 45.0,
        width: 270.0,
        child: RaisedButton(
          child: Text(
            '登录',
            style: Theme.of(context).primaryTextTheme.headline,
          ),
          color: Colors.blue,
          onPressed: () {
            if (formKey.currentState.validate()) {
              ///只有输入的内容符合要求通过才会到达此处
              formKey.currentState.save();
              //TODO 执行登录方法
              Navigator.pushNamed(context, 'index');
              print('username: $username , password: $password');
            }
          },
          shape: StadiumBorder(side: BorderSide(color: Colors.blue)),
        ),
      ),
    );
  }

  Align buildRegisterText(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('没有账号？'),
            GestureDetector(
              child: Text(
                '点击注册',
                style: TextStyle(color: Colors.green),
              ),
              onTap: () {
                //TODO 跳转到注册页面
                print('去注册');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
