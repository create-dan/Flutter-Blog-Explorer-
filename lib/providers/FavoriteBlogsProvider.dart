import 'package:flutter/material.dart';
import 'package:subspace_flutter_assignment/models/BlogModel.dart';

class FavoriteBlogsProvider extends ChangeNotifier {
  List<BlogModel> _favoriteBlogs = [];

  List<BlogModel> get favoriteBlogs => _favoriteBlogs;

  void toggleFavorite(BlogModel blogPost) {
    if (_favoriteBlogs.contains(blogPost)) {
      _favoriteBlogs.remove(blogPost);
    } else {
      _favoriteBlogs.add(blogPost);
    }
    notifyListeners(); // Notify listeners of the change
  }
}
