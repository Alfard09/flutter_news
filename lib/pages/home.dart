import 'package:carousel_slider/carousel_slider.dart';
import 'package:finalproject2/models/category_models.dart';
import 'package:finalproject2/models/slider_model.dart';
import 'package:finalproject2/pages/AdminProfilePage.dart';

import 'package:finalproject2/services/data.dart';
import 'package:finalproject2/services/slider_data.dart';
import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<sliderModel> sliders = [];

  int activeIndex = 0;

  @override
  void initState() {
    categories = getCategories();
    sliders = getSliders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Flutter'),
              Text('News',
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold))
            ],
          ),
          centerTitle: true,
          elevation: 0.0,
          actions: [
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AdminProfilePage();
                }));
              },
            ),
          ],
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20.0),
                  height: 70,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return CategoryTile(
                        image: categories[index].image,
                        categoryName: categories[index].categoryName,
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  "Breaking News",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontFamily: 'Pacifico'),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: CarouselSlider.builder(
                    itemCount: sliders.length,
                    itemBuilder: (context, index, realIndex) {
                      String? res = sliders[index].image;
                      String? res1 = sliders[index].name;
                      return buildImage(res!, index, res1!);
                    },
                    options: CarouselOptions(
                        height: 250,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                        onPageChanged: (index, reason) {
                          setState(() {
                            activeIndex = index;
                          });
                        }),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Center(child: buildIndicator()),
                SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Trending News",
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        "View All",
                        style: TextStyle(color: Colors.blue),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                "images/sports.jpg",
                                height: 130,
                                width: 130,
                                fit: BoxFit.cover,
                              ))),
                      SizedBox(
                        width: 8.0,
                      ),
                      Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 2.2,
                            child: Text(
                                "Virat Kohli’s slow strike rate against KKR adds fuel to fire",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.0)),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget buildImage(String image, int index, String name) => Container(
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  image,
                  height: 250,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                )),
            Container(
                height: 250,
                padding: EdgeInsets.only(left: 10.0),
                margin: EdgeInsets.only(top: 170.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: Text(name,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold)))
          ],
        ),
      );
  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: sliders.length,
        effect: SlideEffect(
            dotWidth: 10, dotHeight: 10, activeDotColor: Colors.blue),
      );
}

class CategoryTile extends StatelessWidget {
  final image, categoryName;

  CategoryTile({this.categoryName, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 16),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                image,
                width: 120,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: 120,
              height: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.black38),
              child: Center(
                  child: Text(
                categoryName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              )),
            )
          ],
        ));
  }
}

// //3
// import 'dart:convert';

// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:finalproject2/models/category_models.dart';
// import 'package:finalproject2/models/slider_model.dart';
// import 'package:finalproject2/pages/AdminProfilePage.dart';
// import 'package:finalproject2/services/data.dart';
// import 'package:finalproject2/services/slider_data.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   List<CategoryModel> categories = [];
//   List<sliderModel> sliders = [];
//   List<BreakingNewsItem> breakingNews = [];
//   bool loading = true;

//   int activeIndex = 0;

//   @override
//   void initState() {
//     print('initState called');
//     categories = getCategories();
//     sliders = getSliders();
//     fetchBreakingNews();
//     super.initState();
//   }

//   Future<void> fetchBreakingNews() async {
//     final categoryName = "Popular";
//     final limitval = 4;
//     final url =
//         'https://ruql47yn5bnqvnysuspepne6qy0baacf.lambda-url.ap-south-1.on.aws/?category=$categoryName&limit=$limitval';

//     try {
//       final response = await http.get(Uri.parse(url));
//       print('Response body: ${response.body}');

//       if (response.statusCode == 200) {
//         print('Received successful response');

//         // Check if the response body is a valid JSON object
//         if (_isValidJson(response.body)) {
//           final data = json.decode(response.body);
//           print('Decoded data: $data');

//           if (data['Items'] != null && data['Items'].length > 0) {
//             final items = (data['Items'] as List)
//                 .map((item) => BreakingNewsItem.fromJson(item))
//                 .toList();
//             print('Parsed items: $items');

//             setState(() {
//               print('Setting state with breakingNews: $breakingNews');
//               breakingNews = items;
//               loading = false;
//             });
//           } else {
//             print('No items found in the response data');
//           }
//         } else {
//           print('Response body is not a valid JSON object');
//           // Handle the case when the response is not a valid JSON
//           // For example, you can display an error message or take appropriate action
//         }
//       } else {
//         print(
//             'Failed to fetch breaking news with status code: ${response.statusCode}');
//         throw Exception('Failed to fetch breaking news');
//       }
//     } catch (e) {
//       print('Error fetching breaking news: $e');
//     }
//   }

// // Helper function to check if a string is a valid JSON object
//   bool _isValidJson(String value) {
//     try {
//       json.decode(value);
//       return true;
//     } catch (_) {
//       return false;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Flutter'),
//             Text('News',
//                 style:
//                     TextStyle(color: Colors.blue, fontWeight: FontWeight.bold))
//           ],
//         ),
//         centerTitle: true,
//         elevation: 0.0,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.account_circle),
//             onPressed: () {
//               Navigator.push(context, MaterialPageRoute(builder: (context) {
//                 return AdminProfilePage();
//               }));
//             },
//           ),
//         ],
//       ),
//       body: Container(
//         child: Column(
//           children: [
//             Container(
//               margin: EdgeInsets.only(left: 20.0),
//               height: 70,
//               child: ListView.builder(
//                 shrinkWrap: true,
//                 scrollDirection: Axis.horizontal,
//                 itemCount: categories.length,
//                 itemBuilder: (context, index) {
//                   return CategoryTile(
//                     image: categories[index].image,
//                     categoryName: categories[index].categoryName,
//                   );
//                 },
//               ),
//             ),
//             SizedBox(
//               height: 30.0,
//             ),
//             Text(
//               "Breaking News",
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 20.0,
//                 fontFamily: 'Pacifico',
//               ),
//             ),
//             if (loading)
//               CircularProgressIndicator()
//             else
//               Expanded(
//                 child: GridView.builder(
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     childAspectRatio: 0.7,
//                   ),
//                   itemCount: breakingNews.length,
//                   itemBuilder: (context, index) {
//                     final item = breakingNews[index];
//                     return GestureDetector(
//                       onTap: () {
//                         // Navigate to news details page
//                       },
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: Colors.grey[100],
//                           borderRadius: BorderRadius.circular(8.0),
//                           border: Border.all(color: Colors.grey[200]!),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.withOpacity(0.5),
//                               spreadRadius: 1,
//                               blurRadius: 4,
//                               offset: Offset(0, 2),
//                             ),
//                           ],
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Expanded(
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.vertical(
//                                   top: Radius.circular(8.0),
//                                 ),
//                                 child: Image.network(
//                                   item.imgUrl['med']!,
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                             Container(
//                               padding: EdgeInsets.all(8.0),
//                               decoration: BoxDecoration(
//                                 color: Colors.black87,
//                                 borderRadius: BorderRadius.vertical(
//                                   bottom: Radius.circular(8.0),
//                                 ),
//                               ),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     item.title.length > 40
//                                         ? '${item.title.substring(0, 39)}...'
//                                         : item.title,
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                     maxLines: 2,
//                                     overflow: TextOverflow.ellipsis,
//                                   ),
//                                   SizedBox(height: 4.0),
//                                   Text(
//                                     item.category,
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             SizedBox(
//               height: 30.0,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 10.0, right: 10.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Trending News",
//                     style: TextStyle(color: Colors.black),
//                   ),
//                   Text(
//                     "View All",
//                     style: TextStyle(color: Colors.blue),
//                   )
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 10.0,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                       child: ClipRRect(
//                           borderRadius: BorderRadius.circular(20),
//                           child: Image.asset(
//                             "images/sports.jpg",
//                             height: 130,
//                             width: 130,
//                             fit: BoxFit.cover,
//                           ))),
//                   SizedBox(
//                     width: 8.0,
//                   ),
//                   Column(
//                     children: [
//                       Container(
//                         width: MediaQuery.of(context).size.width / 2.2,
//                         child: Text(
//                             "Virat Kohli's slow strike rate against KKR adds fuel to fire",
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 16.0)),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildImage(String image, int index, String name) => Container(
//         margin: EdgeInsets.symmetric(horizontal: 5.0),
//         child: Stack(
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(10),
//               child: Image.asset(
//                 image,
//                 height: 250,
//                 fit: BoxFit.cover,
//                 width: MediaQuery.of(context).size.width,
//               ),
//             ),
//             Container(
//               height: 250,
//               padding: EdgeInsets.only(left: 10.0),
//               margin: EdgeInsets.only(top: 170.0),
//               width: MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(
//                 color: Colors.black26,
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(10),
//                   bottomRight: Radius.circular(10),
//                 ),
//               ),
//               child: Text(
//                 name,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 20.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             )
//           ],
//         ),
//       );

//   Widget buildIndicator() => AnimatedSmoothIndicator(
//         activeIndex: activeIndex,
//         count: sliders.length,
//         effect: SlideEffect(
//             dotWidth: 10, dotHeight: 10, activeDotColor: Colors.blue),
//       );
// }

// class CategoryTile extends StatelessWidget {
//   final image, categoryName;

//   CategoryTile({this.categoryName, this.image});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         margin: const EdgeInsets.only(right: 16),
//         child: Stack(
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(6),
//               child: Image.asset(
//                 image,
//                 width: 120,
//                 height: 70,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Container(
//               width: 120,
//               height: 70,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(6),
//                   color: Colors.black38),
//               child: Center(
//                   child: Text(
//                 categoryName,
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 15,
//                     fontWeight: FontWeight.bold),
//               )),
//             )
//           ],
//         ));
//   }
// }

// class BreakingNewsItem {
//   final Map<String, String> imgUrl;
//   final String createdAt;
//   final String contentUrl;
//   final String authorName;
//   final String id;
//   final String category;
//   final String authorId;
//   final String newsStatus;
//   final String categoryDate;
//   final String title;
//   final List<String> tags;

//   BreakingNewsItem({
//     required this.imgUrl,
//     required this.createdAt,
//     required this.contentUrl,
//     required this.authorName,
//     required this.id,
//     required this.category,
//     required this.authorId,
//     required this.newsStatus,
//     required this.categoryDate,
//     required this.title,
//     required this.tags,
//   });

//   factory BreakingNewsItem.fromJson(Map<String, dynamic> json) {
//     final imgUrlMap = Map<String, String>.from(json['imgUrl']);
//     final tagsList = List<String>.from(json['tags'] ?? []);

//     return BreakingNewsItem(
//       imgUrl: imgUrlMap,
//       createdAt: json['createdAt'],
//       contentUrl: json['contentUrl'],
//       authorName: json['authorName'],
//       id: json['id'],
//       category: json['category'],
//       authorId: json['authorId'],
//       newsStatus: json['news_status'],
//       categoryDate: json['categoryDate'],
//       title: json['title'],
//       tags: tagsList,
//     );
//   }
// }
