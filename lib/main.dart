import 'package:finalproject2/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:aws_sdk/aws_sdk.dart';

import 'pages/auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

          // useMaterial3: true,
          ),
      home: Home(),
    );
  }
}




//https://ruql47yn5bnqvnysuspepne6qy0baacf.lambda-url.ap-south-1.on.aws: This endpoint is used to fetch news articles, delete articles, and update their status.
//https://j65otwrltcbxssk2juw6j24nka0mveie.lambda-url.ap-south-1.on.aws: This endpoint is used to fetch ads based on their position.