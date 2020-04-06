// TODO Implement this library.
import 'dart:io';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:crab/utils/CustomSearchDelegate.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PersonalCenterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PersonalCenterPageState();
}

class PersonalCenterPageState extends State<PersonalCenterPage> {
  File imageFile;
  String barcode;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('个人中心'),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () =>
                showSearch(context: context, delegate: CustomSearchDelegate()),
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          buildButtonList(),
          buildLogoutButton(),
        ],
      ),
    );
  }

  Align buildButtonList() {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: double.infinity,
              minHeight: 60,
            ),
            child: RaisedButton.icon(
              icon: Icon(Icons.dns),
              label: Text("个人设备"),
              onPressed: () {
                Navigator.pushNamed(context, 'personalEquipment');
              },
            ),
          ),
          SizedBox(height: 2),
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: double.infinity,
              minHeight: 60,
            ),
            child: RaisedButton.icon(
                icon: Icon(Icons.crop_free),
                label: Text(" 扫一扫"),
                onPressed: () async {
                  barcode = await scanner.scan();
                }),
          ),
          SizedBox(height: 2),
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: double.infinity,
              minHeight: 60,
            ),
            child: RaisedButton.icon(
              icon: Icon(Icons.camera_alt),
              label: Text(" 拍一拍"),
              onPressed: () {
                openCamera(context);
              },
            ),
          ),
          SizedBox(height: 2),
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: double.infinity,
              minHeight: 60,
            ),
            child: RaisedButton.icon(
              icon: Icon(Icons.info_outline),
              label: Text("信息修改"),
              onPressed: () {
                Navigator.pushNamed(context, 'infoChange');
              },
            ),
          ),
          SizedBox(height: 2),
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: double.infinity,
              minHeight: 60,
            ),
            child: RaisedButton.icon(
              icon: Icon(Icons.mode_edit),
              label: Text("密码修改"),
              onPressed: () {
                Navigator.pushNamed(context, 'passwordChange');
              },
            ),
          ),
        ],
      ),
    );
  }

  Padding buildLogoutButton() {
    return Padding(
        padding: EdgeInsets.only(top: 150.0, left: 100.0, right: 100.0),
        child: SizedBox(
          height: 45,
          width: 200,
          child: RaisedButton(
            child: Text(
              '退出登录',
              style: Theme.of(context).primaryTextTheme.headline,
            ),
            color: Colors.red,
            onPressed: () {
              Navigator.of(context).pop();
            },
            shape: StadiumBorder(),
          ),
        ));
  }

  void openCamera(BuildContext context) async {
    var file = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = file;
    });
  }
}
