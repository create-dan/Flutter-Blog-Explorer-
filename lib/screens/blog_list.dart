// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:subspace_flutter_assignment/screens/MyFavoritesScreen.dart';
import 'package:subspace_flutter_assignment/screens/blog_item.dart';

import '../models/BlogModel.dart'; // Import the HTTP package for making API requests

class BlogList extends StatefulWidget {
  @override
  _BlogListState createState() => _BlogListState();
}

class _BlogListState extends State<BlogList> {
  // Sample list of BlogPost objects for demonstration purposes

  Future<List<BlogModel>?> fetchBlogData() async {
    List<BlogModel> blogPosts = [];
    const url = 'https://intent-kit-16.hasura.app/api/rest/blogs';
    const adminSecret =
        '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';

    try {
      final response = await http.get(Uri.parse(url), headers: {
        'x-hasura-admin-secret': adminSecret,
      });

      if (response.statusCode == 200) {
        // Parse the JSON data
        final Map<String, dynamic>? jsonData = json.decode(response.body);

        if (jsonData != null && jsonData.containsKey('blogs')) {
          final List<dynamic> blogData = jsonData['blogs'];

          blogPosts = blogData.map((data) => BlogModel.fromJson(data)).toList();
          return blogPosts;
        } else {
          // Handle the case where 'blogs' is missing or not a valid list
          print('Invalid JSON data: Missing or invalid "blogs" property');
        }
      } else {
        // Handle the case where the API request failed
        print('Request failed with status code: ${response.statusCode}');
        print('Response data: ${response.body}');
      }
    } catch (e) {
      // Handle any errors that occurred during the request
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Blog List'),
      // ),
      appBar: AppBar(
        title: Text('Blog List'),
        actions: [
          GestureDetector(
            onTap: () {
              // Handle the "My Favorites" button tap here
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyFavoritesScreen()),
              );
            },
            child: Container(
              margin: EdgeInsets.only(right: 16), // Add margin to create spacing
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1), // Add a thin border
                borderRadius: BorderRadius.circular(8), // Add border radius
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.5), // Shadow color
                    spreadRadius: 3, // Spread radius
                    blurRadius: 5, // Blur radius
                    offset: Offset(0, 3), // Shadow offset
                  ),
                ],
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0), // Add padding to the icon
                    child: Icon(
                      Icons.favorite,
                      color: Colors.red, // Heart icon color
                      size: 24, // Icon size
                    ),
                  ),
                  Text(
                    'My Favorites',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )
      ,
      body: FutureBuilder<List<BlogModel>?>(
          future: fetchBlogData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<BlogModel> blogPosts = snapshot.data!;

              return ListView.builder(
                itemCount: blogPosts.length,
                itemBuilder: (context, index) {
                  final blogPost = blogPosts[index];
                  return BlogItem(blogPost: blogPost);
                },
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else {
              return Container();
            }
          }),
    );
  }
}
