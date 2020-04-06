import 'dart:async';
import 'dart:convert';

import 'package:crab/model/Post.dart';
import 'package:crab/model/PostList.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Post> fetchPost() async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/posts/1');
  final responseJson = json.decode(response.body);

  return Post.fromJson(responseJson);
}

Future<PostList> fetchAllPost() async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/posts/');
  List<dynamic> responseJson = json.decode(response.body);
  return PostList.fromJson(responseJson);
}

class HttpPage extends StatelessWidget {
  Future<PostList> postList = fetchAllPost();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Column(
          children: <Widget>[
            Container(
              height: 100,
              color: Colors.blue,
            ),
            Container(
              height: 500,
              child: FutureBuilder<PostList>(
                future: postList,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.separated(
                      itemCount: snapshot.data.postList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Center(
                          child: ListTile(
                            title: Text(snapshot.data.postList[index].title),
                            subtitle: Text(snapshot.data.postList[index].body),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                    );
                  } else if (snapshot.hasData) {
                    return Text(snapshot.error);
                  }
                  return CircularProgressIndicator();
                },
              ),
            )
          ],
        ));
  }
}
