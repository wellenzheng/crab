import 'package:crab/model/Equipment.dart';
import 'package:crab/model/EquipmentInfo.dart';
import 'package:crab/model/Laboratory.dart';
import 'package:crab/model/Record.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class Item {
  Item({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<String> reviewingState = ['全部', '未送审', '待审核', '退回重填', '审核通过', '审核不通过'];

List<Item> generateItems(int numberOfItems) {
  return List.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}

List<Laboratory> genLaboratoryList() {
  List<Laboratory> list = List();
  for (var i = 0; i < 10; i++) {
    list.add(Laboratory(name: '实验室: $i', isSelected: false));
  }
  return list;
}

List<EquipmentInfo> genEquipmentList() {
  List<EquipmentInfo> list = List();
  for (int i = 0; i < 20; i++) {
    list.add(EquipmentInfo(name: '设备名称: $i', dateTime: DateTime.now()));
  }
  return list;
}

List<Equipment> generateEquipmentList() {
  List<Equipment> list = List();
  for (var i = 0; i < 20; i++) {
    final WordPair wordPair = WordPair.random();
    list.add(Equipment(
        id: i.toString(),
        name: '设备：$i',
        modelType: i.toString(),
        user: '徐凯硕',
        alias: wordPair.toString(),
        location: wordPair.toString(),
        roomNumber: wordPair.toString(),
        specification: wordPair.toString(),
        produceCountry: wordPair.toString(),
        factoryNumber: wordPair.toString(),
        produceFactory: wordPair.toString(),
        purchaseDateTime: DateTime.now(),
        price: i.toDouble() * 100,
        invoice: wordPair.toString(),
        usingDirection: wordPair.toString(),
        note: wordPair.toString()));
  }
  return list;
}

List<Record> genRecordList(String prefix) {
  List<Record> list = List();
  for (var i = 0; i < 20; i++) {
    list.add(Record(name: prefix + '记录: $i', dateTime: DateTime.now()));
  }
  return list;
}

List<DropdownMenuItem<String>> genLabDropdownItems(List<Laboratory> labList) {
  List<DropdownMenuItem<String>> list = List();
  for (Laboratory laboratory in labList) {
    list.add(DropdownMenuItem(
      value: laboratory.name,
      child: Text(laboratory.name),
    ));
  }
  return list;
}

List<DropdownMenuItem<String>> genReviewingStateDropdownItems() {
  List<DropdownMenuItem<String>> list = List();
  for (String string in reviewingState) {
    list.add(DropdownMenuItem(
      value: string,
      child: Text(string),
    ));
  }
  return list;
}

Future<DateTime> selectDateTime(BuildContext context) => showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.parse('1950-01-01'),
    lastDate: DateTime.now());
