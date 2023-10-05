// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:subspace_flutter_assignment/models/BlogModel.dart';
import 'package:subspace_flutter_assignment/providers/FavoriteBlogsProvider.dart';
import 'package:subspace_flutter_assignment/screens/detailed_blog.dart';
import 'package:provider/provider.dart';


class BlogItem extends StatelessWidget {
  final BlogModel blogPost;

  BlogItem({super.key, required this.blogPost});

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteBlogsProvider>(context);
    bool isFavorite = favoriteProvider.favoriteBlogs.contains(blogPost);


    return GestureDetector(
      onTap: () {
        // Navigate to the DetailedBlog screen and pass the blogPost
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailedBlog(blogPost: blogPost),
          ),
        );
      },
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.network(
              blogPost.imageUrl,
              height: 200, // Set the image height
              width: double.infinity, // Set the image width to match the card width
              fit: BoxFit.cover, // Adjust the image to cover the entire space
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${blogPost.title.split(' ').take(3).join(' ')}...',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis, // Display ellipsis (...) if the text overflows
                        maxLines: 1, // Show only one line of text
                      ),
                      GestureDetector(
                        onTap: () {
                          favoriteProvider.toggleFavorite(blogPost);
                        },
                        child: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : Colors.grey,
                          size: 32,
                        ),
                      ),


                    ],

                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
