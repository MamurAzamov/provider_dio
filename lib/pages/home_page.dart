import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/dio_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dio Provider'),
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          postProvider.getPosts();
                        },
                        child: const Row(
                          children: [
                            Icon(Icons.get_app),
                            SizedBox(
                              width: 5,
                            ),
                            Text('GET Posts'),
                          ],
                        )),
                    const SizedBox(height: 5),
                    ElevatedButton(
                        onPressed: () {
                          postProvider.createPost();
                        },
                        child: const Row(
                          children: [
                            Icon(Icons.create),
                            SizedBox(
                              width: 5,
                            ),
                            Text('New Post'),
                          ],
                        )),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(height: 5),
                    ElevatedButton(
                        onPressed: () {
                          postProvider.updatePost();
                        },
                        child: const Row(
                          children: [
                            Icon(Icons.update),
                            SizedBox(
                              width: 5,
                            ),
                            Text('Update Post'),
                          ],
                        )),
                    const SizedBox(height: 5),
                    ElevatedButton(
                        onPressed: () {
                          postProvider.deletePost();
                        },
                        child: const Row(
                          children: [
                            Icon(Icons.delete),
                            SizedBox(
                              width: 5,
                            ),
                            Text('DELETE Post'),
                          ],
                        )),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: postProvider.posts.length,
                itemBuilder: (ctx, index) {
                  return ListTile(
                    title: Text(postProvider.posts[index].title),
                    subtitle: Text(postProvider.posts[index].body),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
