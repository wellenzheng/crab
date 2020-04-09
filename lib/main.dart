import 'package:crab/page/EquipmentDetailsPage.dart';
import 'package:crab/page/EquipmentImagePage.dart';
import 'package:crab/page/EquipmentLocationPage.dart';
import 'package:crab/page/IndexPage.dart';
import 'package:crab/page/LoginPage.dart';
import 'package:crab/page/ManagementPage.dart';
import 'package:crab/page/PersonalCenterPage.dart';
import 'package:crab/page/RecordDetailsPage.dart';
import 'package:crab/page/ServerListPage.dart';
import 'package:crab/page/StatisticsPage.dart';
import 'package:crab/page/center/PersonalEquipmentAddingPage.dart';
import 'package:crab/page/center/InfoChangePage.dart';
import 'package:crab/page/center/PasswordChangePage.dart';
import 'package:crab/page/center/PersonalEquipmentPage.dart';
import 'package:crab/page/management/AllocateManagementPage.dart';
import 'package:crab/page/management/AllocateRecordAddingPage.dart';
import 'package:crab/page/management/EquipmentAddingPage.dart';
import 'package:crab/page/management/EquipmentManagementPage.dart';
import 'package:crab/page/management/MaintainManagementPage.dart';
import 'package:crab/page/management/MaintainRecordAddingPage.dart';
import 'package:crab/page/management/ReviewingEquipmentPage.dart';
import 'package:crab/page/management/ScrappedRecordAddingPage.dart';
import 'package:crab/page/management/ScrappingManagementPage.dart';
import 'package:crab/page/management/equipmentInfoChangePage.dart';
import 'package:crab/page/statistics/AllocateRecordPage.dart';
import 'package:crab/page/statistics/EquipmentSearchPage.dart';
import 'package:crab/page/statistics/MaintainRecordPage.dart';
import 'package:crab/page/statistics/ScrappedRecordPage.dart';
import 'package:crab/page/statistics/ScrappingRecordPage.dart';
import 'package:crab/utils/HttpDataFetcher.dart';
import 'package:crab/widgets/DropMenuTest.dart';
import 'package:flutter/material.dart';

//应用入口
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      routes: <String, WidgetBuilder>{
        'serverList': (_) => ServerListPage(),
        'index': (_) => IndexPage(),
        'statistics': (_) => StatisticsPage(),
        'equipmentSearch': (_) => EquipmentSearchPage(),
        'maintainRecord': (_) => MaintainRecordPage(),
        'maintainRecordAdding': (_) => MaintainRecordAddingPage(),
        'allocateRecord': (_) => AllocateRecordPage(),
        'allocateRecordAdding': (_) => AllocateRecordAddingPage(),
        'scrappingRecord': (_) => ScrappingRecordPage(),
        'scrappedRecord': (_) => ScrappedRecordPage(),
        'scrappedRecordAdding': (_) => ScrappedRecordAddingPage(),
        'management': (_) => ManagementPage(),
        'equipmentManagement': (_) => EquipmentManagementPage(),
        'equipmentAdding': (_) => EquipmentAddingPage(),
        'reviewingEquipment': (_) => ReviewingEquipmentPage(),
        'maintainManagement': (_) => MaintainManagementPage(),
        'allocateManagement': (_) => AllocateManagementPage(),
        'scrappingManagement': (_) => ScrappingManagementPage(),
        'personalCenter': (_) => PersonalCenterPage(),
        'personalEquipment': (_) => PersonalEquipmentPage(),
        'personalEquipmentAdding': (_) => PersonalEquipmentAddingPage(),
        'passwordChange': (_) => PasswordChangePage(),
        'infoChange': (_) => InfoChangePage(),
        'equipmentDetails': (_) => EquipmentDetailsPage(),
        'equipmentImage': (_) => EquipmentImagePage(),
        'equipmentLocation': (_) => EquipmentLocationPage(),
        'equipmentInfoChange': (_) => EquipmentInfoChangePage(),
        'recordDetails': (_) => RecordDetailsPage(),
      },
    );
  }
}
