// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class BreakingNewsItem {
//   final String id;
//   final String category;
//   final String title;
//   final String imgUrl;

//   BreakingNewsItem({
//     required this.id,
//     required this.category,
//     required this.title,
//     required this.imgUrl,
//   });

//   factory BreakingNewsItem.fromJson(Map<String, dynamic> json) {
//     return BreakingNewsItem(
//       id: json['id'] ?? '',
//       category: json['category'] ?? '',
//       title: json['title'] ?? '',
//       imgUrl: json['imgUrl'] ?? '',
//     );
//   }
// }

// class BreakingNewsService {
//   static const String apiUrl =
//       'https://ruql47yn5bnqvnysuspepne6qy0baacf.lambda-url.ap-south-1.on.aws';

//   static Future<List<BreakingNewsItem>> fetchBreakingNews() async {
//     try {
//       print('Fetching breaking news...');
//       final response =
//           await http.get(Uri.parse('$apiUrl/?category=Popular&limit=4'));

//       print('Response status code: ${response.statusCode}');

//       if (response.statusCode == 200) {
//         final resultData = json.decode(response.body);
//         final List<dynamic> items = resultData['Items'];
//         print('Received ${items.length} items of breaking news');
//         return items.map((item) => BreakingNewsItem.fromJson(item)).toList();
//       } else {
//         print('Failed to load data: ${response.statusCode}');
//         throw Exception('Failed to load data');
//       }
//     } catch (error) {
//       print('Error fetching breaking news: $error');
//       throw error;
//     }
//   }
// }
import 'dart:convert';
import 'package:http/http.dart' as http;

class BreakingNewsItem {
  final String id;
  final String title;
  final String category;
  final Map<String, String> imgUrl;

  BreakingNewsItem({
    required this.id,
    required this.title,
    required this.category,
    required this.imgUrl,
  });

  factory BreakingNewsItem.fromJson(Map<String, dynamic> json) {
    return BreakingNewsItem(
      id: json['id'],
      title: json['title'],
      category: json['category'],
      imgUrl: Map<String, String>.from(json['imgUrl']),
    );
  }
}
