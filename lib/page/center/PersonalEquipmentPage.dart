import 'package:crab/model/Equipment.dart';
import 'package:crab/utils/CustomSearchDelegate.dart';
import 'package:crab/utils/LocalTextData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersonalEquipmentPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PersonalEquipmentPageState();
}

class PersonalEquipmentPageState extends State<PersonalEquipmentPage> {
  List<Equipment> equipmentList = generateEquipmentList();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('个人设备'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () => showSearch(
                  context: context, delegate: CustomSearchDelegate()),
            )
          ],
        ),
        body: buildEquipmentList(),
        floatingActionButton: buildAddButton());
  }

  ListView buildEquipmentList() {
    return ListView.separated(
      itemCount: equipmentList.length,
      itemBuilder: (BuildContext context, int index) {
        String n = equipmentList[index].name;
        DateTime d = equipmentList[index].purchaseDateTime;
        return ListTile(
          title: Text('$n'),
          subtitle: Text('$d'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.pushNamed(context, 'equipmentDetails',
                arguments: equipmentList[index]);
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }

  FloatingActionButton buildAddButton() {
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Colors.blue,
      onPressed: () {
        Navigator.pushNamed(context, 'personalEquipmentAdding');
      },
    );
  }
}
