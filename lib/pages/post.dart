import 'post_detail.dart';
import 'post_model.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class PostsPage extends StatefulWidget {
  @override
  _PostsPageState createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  final String postsURL = "https://jsonplaceholder.typicode.com/posts";

  late Future<List<Post>> posts;

  @override
  void initState() {
    super.initState();
    posts = getPosts();
  }

  Future<List<Post>> getPosts() async {
    var response = await http.get(postsURL as Uri);
    if (response.statusCode == 200) {
      final items = json.decode(response.body).cast<Map<String, dynamic>>();
      List<Post> posts = items.map<Post>((json) {
        return Post.fromJson(json);
      }).toList();
      return posts;
    } else {
      throw Exception('Failed to load posts');
    }
  }

  void _refreshAction() {
    setState(() {
      posts = getPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Refresh FutureBuilder")),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            SizedBox(height: 20.0),
            FutureBuilder<List<Post>>(
              future: posts,
              builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No posts available'));
                } else {
                  return Column(
                    children: snapshot.data!.map((post) => ListTile(
                      title: Text(post.title),
                      subtitle: Text('User ID: ${post.userId}'),
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PostDetail(post: post),
                        ),
                      ),
                    )).toList(),
                  );
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _refreshAction,
        tooltip: 'Refresh',
        child: Icon(Icons.refresh),
      ),
    );
  }
}
