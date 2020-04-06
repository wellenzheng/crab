import 'package:crab/model/EquipmentInfo.dart';
import 'package:crab/model/Laboratory.dart';
import 'package:crab/model/PostList.dart';
import 'package:crab/utils/HttpDataFetcher.dart';
import 'package:crab/utils/LocalTextData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EquipmentManagementPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => EquipmentManagementPageState();
}

class EquipmentManagementPageState extends State<EquipmentManagementPage> {
  List<EquipmentInfo> equipmentList = List();
  List<Laboratory> labList = genLaboratoryList();
  String laboratory;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('设备管理'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async => showSearchDialog(),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[buildLabDropdown(), buildEquipmentList()],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, 'equipmentAdding');
        },
      ),
    );
  }

  Padding buildLabDropdown() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: DropdownButton(
        items: genLabDropdownItems(labList),
        hint: Text('实验室'), // 当没有初始值时显示
        isExpanded: true,
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

  Expanded buildEquipmentList() {
    return Expanded(
      child: FutureBuilder<PostList>(
        future: fetchAllPost(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.postList.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  height: 100,
                  color: Colors.teal[100 * (index % 9)],
                  child: ListTile(
                    title: Text(
                      snapshot.data.postList[index].title,
                      maxLines: 1,
                    ),
                    subtitle: Text(
                      snapshot.data.postList[index].body,
                      maxLines: 2,
                    ),
                    trailing: Icon(Icons.keyboard_arrow_right),
                  ),
                );
              },
            );
          } else if (snapshot.hasData) {
            return Text(snapshot.error);
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }

  Future<bool> showSearchDialog() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            // title: Text('添加服务器',textAlign: TextAlign.center,),
            contentPadding: EdgeInsets.only(left: 10, right: 10),
            content: new SingleChildScrollView(
                child: new ListBody(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: '查询词',
                  ),
                ),
              ],
            )),
            actions: <Widget>[
              FlatButton(
                child: Text('查询'),
                onPressed: () {},
              ),
            ],
          );
        });
  }
}
