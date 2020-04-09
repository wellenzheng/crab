import 'package:crab/widgets/DropMenuBloc.dart';
import 'package:crab/widgets/DropMenuHeader.dart';
import 'package:crab/widgets/DropMenuLeftWidget.dart';
import 'package:crab/widgets/DropMenuRightWidget.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import 'dart:convert';
import 'dart:async' show Future;
import 'dart:async';

import 'package:crab/model/SearchParamModel.dart';
import 'package:realank_flutter_bloc/realank_flutter_bloc.dart';

Future<String> loadAStudentAsset(BuildContext context) async {
  return await DefaultAssetBundle.of(context)
      .loadString('assets/searchParam.json');
}

Future loadStudent(BuildContext context) async {
  String jsonString = await loadAStudentAsset(context);
  final jsonResponse = json.decode(jsonString);
  SearchParamList paramList = new SearchParamList.fromJson(jsonResponse);
  for (SearchParamModel item in paramList.list) {
    if (item.dateFlag == true) {
      item.itemList.add(new ParamItemModel(
        name: "自定义时间",
        code: "-1",
      ));
    }
  }
  return paramList;
}

class TestPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  bool showPop = false;
  bool showFilter = false;
  bool showSort = false;

  static List<SortModel> leftWidgets = [
    SortModel(name: "最早预约日期", isSelected: false, code: "1"),
    SortModel(name: "最晚预约日期", isSelected: true, code: "2"),
    SortModel(name: "最早完成日期", isSelected: false, code: "5"),
    SortModel(name: "最晚完成日期", isSelected: false, code: "6")
  ];
  SortModel leftSelectedModel = leftWidgets[1];
  List<String> dropDownHeaderItemStrings = [leftWidgets[1].name, '筛选'];

  void showPopView() {
    setState(() {
      showPop = (showFilter || showSort);
    });
  }

  @override
  Widget build(BuildContext context) {
    return RLKBLoCProvider(
        bloc: DropMenuHeaderBLoC({
          "selectedIndex": 0,
          "filterData": false,
        }),
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            bottom: DropMenuHeader(
              items: [
                ButtonModel(
                    text: leftSelectedModel.name,
                    onTap: (bool selected) {
                      showSort = selected;
                      showFilter = false;
                      showPopView();
                    }),
                ButtonModel(
                    text: dropDownHeaderItemStrings[1],
                    onTap: (bool selected) {
                      showFilter = selected;
                      showSort = false;
                      showPopView();
                    }),
              ],
              height: 44,
            ),
          ),
          body: showPop
              ? Stack(
                  children: <Widget>[
                    buildBody(),
                    Positioned(child: RLKBLoCBuilder(builder:
                        (BuildContext context, Map data, RLKBaseBLoC bloc) {
                      DropMenuHeaderBLoC bloc2 = bloc as DropMenuHeaderBLoC;
                      return GestureDetector(
                        onTap: () {
                          bloc2.headerUnSelect(999);
                          showFilter = false;
                          showSort = false;
                          showPopView();
                        },
                        child: Container(
                          color: Colors.black.withAlpha(70),
                        ),
                      );
                    })),
                    buildPopView(),
                  ],
                )
              : buildBody(),
        ));
  }

  Widget buildPopView() {
    if (showFilter) {
      return FutureBuilder(
        future: loadStudent(context),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return DropMenuRightWidget(
              paramList: snapshot.data as SearchParamList,
              clickCallBack:
                  (SearchParamModel pressModel, ParamItemModel pressItem) {
                print('${pressItem.name}');
              },
              sureFun: () {
                print("sure click");
              },
              resetFun: () {
                print("reset click");
              },
            );
          } else {
            return Text("data error");
          }
        },
      );
    } else if (showSort) {
      return DropMenuLeftWidget(
        dataSource: leftWidgets,
        onSelected: (SortModel model) {
          leftSelectedModel = model;
          print("select ${model.name}  ${model.code}");
          setState(() {});
        },
      );
    } else {
      return SizedBox(
        height: 0,
      );
    }
  }

  Widget buildBody() {
    return Center(child: Text('这里放列表以及请求错误的失败页面以及无数据的空页面'));
  }
}
