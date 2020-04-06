import 'package:crab/page/PersonalCenterPage.dart';
import 'package:crab/page/ManagementPage.dart';
import 'package:crab/page/StatisticsPage.dart';
import 'package:flutter/material.dart';

class IndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => IndexPageState();
}

class IndexPageState extends State<IndexPage> {
  final pages = [StatisticsPage(), ManagementPage(), PersonalCenterPage()];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.assessment), title: Text("查询统计")),
          BottomNavigationBarItem(
              icon: Icon(Icons.storage), title: Text("设备管理")),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text("个人中心")),
        ],
        currentIndex: currentIndex,
        fixedColor: Colors.black,
        onTap: onItemTapped,
      ),
      body: pages[currentIndex],
    );
  }

  void onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
