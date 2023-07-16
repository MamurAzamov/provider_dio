import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_dio/pages/home_page.dart';
import 'package:provider_dio/services/dio_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
        create: (_) => PostProvider(),
        child: const HomePage(),
      ),
    );
  }
}
