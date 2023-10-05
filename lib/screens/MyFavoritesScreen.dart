// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:subspace_flutter_assignment/providers/FavoriteBlogsProvider.dart';
import 'package:provider/provider.dart';
import 'package:subspace_flutter_assignment/screens/blog_item.dart';

class MyFavoritesScreen extends StatefulWidget {
  const MyFavoritesScreen({super.key});

  @override
  State<MyFavoritesScreen> createState() => _MyFavoritesScreenState();
}

class _MyFavoritesScreenState extends State<MyFavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteBlogsProvider>(context);
    final favoriteBlogs = favoriteProvider.favoriteBlogs;
    final totalCount = favoriteBlogs.length;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('My Favorites'),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 24.0,
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      '$totalCount Blogs',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: favoriteBlogs.isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'No Blogs Added in Favorite',
              style: TextStyle(
                fontSize: 24.0, // Increase the font size
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0), // Add vertical spacing

          ],
        ),
      )
          : ListView.builder(
        itemCount: favoriteBlogs.length,
        itemBuilder: (context, index) {
          final blogPost = favoriteBlogs[index];
          return BlogItem(blogPost: blogPost);
        },
      ),
    );
  }
}
