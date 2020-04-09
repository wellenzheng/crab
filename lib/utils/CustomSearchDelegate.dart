import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        tooltip: 'Clear',
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      tooltip: 'Back',
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        this.close(context, null);
      },
    );
  }

  @override
  TextInputType get keyboardType => TextInputType.number;

  Future fetchPosts() async {
    http.Response response =
        await http.get('https://jsonplaceholder.typicode.com/posts/$query');
    final data = await json.decode(response.body);
    return data;
  }

  @override
  Widget buildResults(BuildContext context) {
    if (int.parse(query) >= 100) {
      return Center(child: Text('请输入小于 100 的数字'));
    }
    return FutureBuilder(
      future: fetchPosts(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          final post = snapshot.data;
          return ListTile(
            title: Text(post['title'], maxLines: 1),
            subtitle: Text(post['body'], maxLines: 3),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(title: Text('推荐关键字 01')),
        ListTile(title: Text('推荐关键字 02')),
        ListTile(title: Text('推荐关键字 03')),
        ListTile(title: Text('推荐关键字 04')),
        ListTile(title: Text('推荐关键字 05')),
      ],
    );
  }
}
