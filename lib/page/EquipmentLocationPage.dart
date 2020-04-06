import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum LocationSelection { viewLocation, uploadLocation }

class EquipmentLocationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => EquipmentLocationPageState();
}

class EquipmentLocationPageState extends State<EquipmentLocationPage> {
  String location;
  String ipAddress = '127.0.0.1';
  String macAddress = '10:c3:7b:95:fe:dc';

  @override
  Widget build(BuildContext context) {
    location = ModalRoute.of(context).settings.arguments;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('设备定位'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('查看设备位置', style: TextStyle(fontSize: 25))),
          Divider(color: Colors.grey),
          Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(location,
                  style: TextStyle(color: Colors.blueGrey, fontSize: 20))),
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: double.infinity,
              minHeight: 30,
            ),
            child: RaisedButton(
              child: Text('查看设备位置'),
              onPressed: () {},
            ),
          ),
          Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('上传设备位置', style: TextStyle(fontSize: 25))),
          Divider(color: Colors.grey),
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: double.infinity,
              minHeight: 30,
            ),
            child: RaisedButton(
              child: Text('查看设备位置'),
              onPressed: () {},
            ),
          ),
          Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('设备IP地址', style: TextStyle(fontSize: 25))),
          Divider(color: Colors.grey),
          Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(ipAddress,
                  style: TextStyle(color: Colors.blueGrey, fontSize: 20))),
          Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('设备MAC地址', style: TextStyle(fontSize: 25))),
          Divider(color: Colors.grey),
          Padding(
              padding: EdgeInsets.all(10.0),
              child: TextFormField(
                  decoration: InputDecoration(
                      labelText: '请输入设备MAC地址(用 : 分隔)',
                      hintText: '例如: 10:c3:7b:95:fe:dc'))),
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: double.infinity,
              minHeight: 30,
            ),
            child: RaisedButton(
              child: Text('定位设备IP地址'),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
