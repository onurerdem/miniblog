import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:miniblog/models/blog.dart';
import 'package:http/http.dart' as http;

class BlogDetail extends StatefulWidget {
  final String? id;

  const BlogDetail({super.key, required this.id});

  @override
  State<BlogDetail> createState() => _BlogDetailState();
}

class _BlogDetailState extends State<BlogDetail> {
  Blog? blog;

  @override
  void initState() {
    super.initState();
    fetchBlog();
  }

  fetchBlog() async {
    Uri url = Uri.parse(
        "https://tobetoapi.halitkalayci.com/api/Articles/${widget.id}");
    final response = await http.get(url);
    final jsonData = json.decode(response.body);

    setState(() {
      blog = Blog.fromJson(jsonData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(blog?.title ?? ""),
      ),
      body: blog == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  Image.network(blog?.thumbnail ?? ""),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text(blog?.title ?? ""),
                        Text(blog?.content ?? ""),
                        Text(blog?.author ?? ""),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
