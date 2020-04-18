import 'package:crab/model/ServerInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServerListPage extends StatefulWidget {
  @override
  ServerPageState createState() => ServerPageState();
}

class ServerPageState extends State<ServerListPage> {
  final formKey = GlobalKey<FormState>();
  // ServerDBHelper serverDBHelper = new ServerDBHelper();
  List<ServerInfo> serverInfoList = new List();
  final serverNameController = TextEditingController();
  final serverUrlController = TextEditingController();
  String serverName;
  String serverUrl;

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
        String name = serverInfoList[index].name;
        String url = serverInfoList[index].url;
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
                  controller: serverNameController,
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: '服务器地址',
                  ),
                  controller: serverUrlController,
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
                  onPressed: () {
                    ServerInfo serverInfo = new ServerInfo(
                        id: null,
                        name: serverNameController.text,
                        url: serverUrlController.text,
                        isSelected: false);
                    Navigator.of(context).pop();
                  })
            ],
          );
        });
  }

  void addServer() {
    for (int i = 0; i < 10; i++) {
      serverInfoList.add(new ServerInfo(
          id: i, name: '服务器：$i', url: 'www.$i$i$i.com', isSelected: false));
    }
  }
}
