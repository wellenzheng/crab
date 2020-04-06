import 'dart:core';

final String columnId = "Id";
final String columnServerName = "ServerName";
final String columnServerUrl = "ServerUrl";
final String columnIsSelected = "isSelected";

class ServerInfo {
  int id;
  String serverName;
  String serverURL;
  bool isSelected;

  ServerInfo(int id, String serverName, String serverURL, bool isSelected) {
    this.id = id;
    this.serverName = serverName;
    this.serverURL = serverURL;
    this.isSelected = isSelected;
  }

  int getId() {
    return id;
  }

  void setId(int id) {
    this.id = id;
  }

  String getServerName() {
    return serverName;
  }

  void setServerName(String serverName) {
    this.serverName = serverName;
  }

  String getServerURL() {
    return serverURL;
  }

  void setServerURL(String serverURL) {
    this.serverURL = serverURL;
  }

  bool getIsSelected() {
    return isSelected;
  }

  void setIsSelected(bool isSelected) {
    this.isSelected = isSelected;
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnServerName: serverName,
      columnServerUrl: serverURL,
      columnIsSelected: isSelected == true ? 1 : 0,
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  ServerInfo.formMap(Map<String, dynamic> map) {
    id = map[columnId];
    serverName = map[columnServerName];
    serverURL = map[columnServerUrl];
    isSelected = map[columnIsSelected] == 1;
  }
}
