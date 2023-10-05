// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:subspace_flutter_assignment/models/BlogModel.dart';
import 'package:subspace_flutter_assignment/screens/MyFavoritesScreen.dart';

class DetailedBlog extends StatelessWidget {
  final BlogModel blogPost;

  DetailedBlog({super.key, required this.blogPost});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detailed Blog'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    blogPost.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Icon(
                        Icons.table_chart_rounded,
                        color: Colors.blue,
                      ),
                      SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          blogPost.title,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Container(
                     // Adjust the width of the line
                    height: 2, // Adjust the height of the line
                    color: Colors.blue, // Line color
                  ),
                  SizedBox(height: 15),

                  Text(
                    'Description:', // You can replace this with the actual description
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'This is a dummy description for the blog post. You can replace it with the actual content of the blog.', // Replace with actual description
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 18),
                  Container(
                    // Adjust the width of the line
                    height: 2, // Adjust the height of the line
                    color: Colors.blue, // Line color
                  ),
                  SizedBox(height: 18),
                  Container(

                    width: double.infinity, // Make the container span the full width of the screen
                    padding: EdgeInsets.all(8),
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
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyFavoritesScreen()),
                        );

                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.favorite,
                                color: Colors.red, // Heart icon color
                                size: 32, // Icon size
                              ),
                              SizedBox(width: 8), // Add spacing between icon and text
                              Text(
                                'Visit to Favorites',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
