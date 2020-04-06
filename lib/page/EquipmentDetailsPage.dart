import 'package:crab/model/Equipment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum MenuItems { image, location, infoChange, delete }

class EquipmentDetailsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => EquipmentDetailsPageState();
}

class EquipmentDetailsPageState extends State<EquipmentDetailsPage> {
  String selection;
  List<String> values;
  final List<String> params = [
    '仪器名称',
    '仪器编号',
    '仪器型号',
    '仪器使用人',
    '别名',
    '防止地点',
    '所在房间号',
    '规格',
    '生产国',
    '出厂号',
    '生产厂家',
    '购置年月',
    '单价',
    '发票号',
    '使用方向',
    '备注'
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final Equipment equipment = ModalRoute.of(context).settings.arguments;
    values = getValues(equipment);

    return Scaffold(
        appBar: AppBar(title: Text('设备详情'), actions: <Widget>[
          PopupMenuButton<MenuItems>(
            onSelected: (MenuItems value) {
              switch (value) {
                case MenuItems.image:
                  Navigator.pushNamed(context, 'equipmentImage');
                  break;
                case MenuItems.location:
                  Navigator.pushNamed(context, 'equipmentLocation',
                      arguments: equipment.location);
                  break;
                case MenuItems.infoChange:
                  Navigator.pushNamed(context, 'equipmentInfoChange');
                  break;
                case MenuItems.delete:
                  break;
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<MenuItems>>[
              const PopupMenuItem<MenuItems>(
                value: MenuItems.image,
                child: Text('设备图片'),
              ),
              const PopupMenuItem<MenuItems>(
                  value: MenuItems.location, child: Text('设备定位')),
              const PopupMenuItem<MenuItems>(
                value: MenuItems.infoChange,
                child: Text('修改信息'),
              ),
              const PopupMenuItem<MenuItems>(
                value: MenuItems.delete,
                child: Text('删除设备'),
              ),
            ],
          )
        ]),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
                expandedHeight: 500.0,
                floating: false,
                pinned: false,
                snap: false,
                flexibleSpace: Stack(
                  children: <Widget>[
                    Positioned.fill(
                        child: Image.network(
                      'http://q7yezbh4o.bkt.clouddn.com/image/huawei.jpg',
                      fit: BoxFit.cover,
                    )),
                  ],
                )),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.grey[100 * (3 + index % 2)],
                    child: ListTile(
                      title: Text(params[index]),
                      subtitle: Text(values[index]),
                    ),
                  );
                },
                childCount: params.length,
              ),
            ),
          ],
        ));
  }

  Column buildHeaderField(String id, String name, String modelType) {
    return Column(
      children: <Widget>[
        Text(name),
        Text('编号: ' + id),
        Text('型号: ' + modelType)
      ],
    );
  }

  Padding buildButtonBar() {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: ButtonBar(
        alignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RaisedButton(
            color: Colors.blue,
            child: Text('设备图片'),
            onPressed: () {},
          ),
          RaisedButton(
            color: Colors.blue,
            child: Text('设备定位'),
            onPressed: () {},
          )
        ],
      ),
    );
  }

  Expanded buildBodyField() {
    return Expanded(
      child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Container(
              color: Colors.grey[100 * (index % 2)],
              child: ListTile(
                title: Text(params[index]),
                subtitle: Text(values[index]),
              ),
            );
          },
          itemCount: params.length),
    );
  }

  List<String> getValues(Equipment equipment) {
    List<String> values = List();
    values.add(equipment.name);
    values.add(equipment.id);
    values.add(equipment.modelType);
    values.add(equipment.user);
    values.add(equipment.alias);
    values.add(equipment.location);
    values.add(equipment.roomNumber);
    values.add(equipment.specification);
    values.add(equipment.produceCountry);
    values.add(equipment.factoryNumber);
    values.add(equipment.produceFactory);
    values.add(equipment.purchaseDateTime.toString());
    values.add(equipment.price.toString());
    values.add(equipment.invoice);
    values.add(equipment.usingDirection);
    values.add(equipment.note);
    return values;
  }
}
