import 'package:crab/model/ServerInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServerListPage extends StatefulWidget {
  @override
  ServerPageState createState() => ServerPageState();
}

class ServerPageState extends State<ServerListPage> {
  final formKey = GlobalKey<FormState>();
  List<ServerInfo> serverInfoList = List();

  @override
  Widget build(BuildContext context) {
    addServer();
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('服务器列表'),
        ),
        body: Form(
          key: formKey,
          child: SafeArea(child: buildServerList()),
        ),
        floatingActionButton: buildAddButton());
  }

  ListView buildServerList() {
    return ListView.separated(
      itemCount: serverInfoList.length,
      itemBuilder: (BuildContext context, int index) {
        String name = serverInfoList[index].serverName;
        String url = serverInfoList[index].serverURL;
        return ListTile(
          title: Text('$name'),
          subtitle: Text('$url'),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }

  FloatingActionButton buildAddButton() {
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Colors.blue,
      onPressed: () async {
        showAddServerDialog();
      },
    );
  }

  Future<bool> showAddServerDialog() {
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
                    labelText: '服务器名称',
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: '服务器地址',
                  ),
                ),
              ],
            )),
            actions: <Widget>[
              FlatButton(
                child: Text('取消'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              FlatButton(
                child: Text('添加'),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        });
  }

  void addServer() {
    for (int i = 0; i < 10; i++) {
      serverInfoList.add(new ServerInfo(i, '服务器名称: ' + i.toString(),
          '服务器地址: www.xxx' + i.toString() + '.com', true));
    }
  }
}
