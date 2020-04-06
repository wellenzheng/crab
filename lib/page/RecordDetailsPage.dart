import 'package:crab/model/Record.dart';
import 'package:crab/model/RecordMessage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecordDetailsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RecordDetailsPageState();
}

class RecordDetailsPageState extends State<RecordDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final RecordMessage recordMessage =
        ModalRoute.of(context).settings.arguments;
    final String prefix = recordMessage.prefix;
    final Record record = recordMessage.record;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(prefix + '记录详情'),
      ),
      body: Card(
        color: Colors.blue,
        child: ListTile(
          title: Text(record.name),
          subtitle: Text(record.dateTime.toString()),
        ),
      ),
    );
  }
}
