import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/post_model.dart';

class PostProvider with ChangeNotifier {
  List<Post> _posts = [];
  final Dio _dio = Dio();

  List<Post> get posts => _posts;

  Future<void> getPosts() async {
    try {
      final response =
          await _dio.get('http://jsonplaceholder.typicode.com/posts');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        _posts = data.map((post) => Post.fromJson(post)).toList();
        notifyListeners();
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (error) {
      throw Exception('Failed to load posts');
    }
  }

  Future<void> createPost() async {
    try {
      final response = await _dio.post(
        'http://jsonplaceholder.typicode.com/posts',
        data: {
          'title': 'New Post Title',
          'body': 'New Post Body',
        },
      );
      if (response.statusCode == 201) {
        final newPost = Post.fromJson(response.data);
        _posts.add(newPost);
        notifyListeners();
      } else {
        throw Exception('Failed to create post');
      }
    } catch (error) {
      throw Exception('Failed to create post');
    }
  }

  Future<void> updatePost() async {
    try {
      final response = await _dio.put(
        'http://jsonplaceholder.typicode.com/posts/1',
        data: {
          'title': 'Updated Post Title',
          'body': 'Updated Post Body',
        },
      );
      if (response.statusCode == 200) {
        final updatedPost = Post.fromJson(response.data);
        final index = _posts.indexWhere((post) => post.id == updatedPost.id);
        _posts[index] = updatedPost;
        notifyListeners();
      } else {
        throw Exception('Failed to update post');
      }
    } catch (error) {
      throw Exception('Failed to update post');
    }
  }

  Future<void> deletePost() async {
    try {
      final response =
          await _dio.delete('http://jsonplaceholder.typicode.com/posts/1');
      if (response.statusCode == 200) {
        _posts.removeWhere((post) => post.id == 1);
        notifyListeners();
      } else {
        throw Exception('Failed to delete post');
      }
    } catch (error) {
      throw Exception('Failed to delete post');
    }
  }
}
