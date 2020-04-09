import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EquipmentImagePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => EquipmentImagePageState();
}

class EquipmentImagePageState extends State<EquipmentImagePage> {
  File imageFile;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('设备图片'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[showImage(), buildButtonBar()],
      ),
    );
  }

  ButtonBar buildButtonBar() {
    return ButtonBar(
      alignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        RaisedButton(
          child: Text('拍照或选择图片'),
          onPressed: () {
            showSelectionDialog(context);
          },
        ),
        RaisedButton(
          child: Text('上传'),
          onPressed: () {},
        )
      ],
    );
  }

  Future<void> showSelectionDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text('从相册选择'),
                    onTap: () {
                      openGallary(context);
                    },
                  ),
                  Padding(padding: EdgeInsets.all(6.0)),
                  GestureDetector(
                    child: Text('拍照'),
                    onTap: () {
                      openCamera(context);
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

  void openGallary(BuildContext context) async {
    var file = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = file;
    });
    Navigator.of(context).pop();
  }

  void openCamera(BuildContext context) async {
    var file = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = file;
    });
    Navigator.of(context).pop();
  }

  Widget showImage() {
    if (imageFile == null) {
      return Image.network('http://q7yezbh4o.bkt.clouddn.com/image/huawei.jpg');
    } else {
      return Image.file(imageFile);
    }
  }
}
