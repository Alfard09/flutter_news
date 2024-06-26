import 'package:finalproject2/pages/adminpanel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// class AdminProfilePage extends StatefulWidget {
//   @override
//   _AdminProfilePageState createState() => _AdminProfilePageState();
// }

// class _AdminProfilePageState extends State<AdminProfilePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Admin Profile'),
//         backgroundColor: Colors.indigo[900],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(height: 20),
//             CircleAvatar(
//               radius: 60,
//               backgroundImage: AssetImage('images/admin_avatar.jpg'),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'John Doe',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 10),
//             Text(
//               'Admin',
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.grey[600],
//               ),
//             ),
//             SizedBox(height: 30),
//             Card(
//               margin: EdgeInsets.symmetric(horizontal: 20),
//               child: Padding(
//                 padding: EdgeInsets.all(16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Personal Information',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 5),
//                     ListTile(
//                       leading: Icon(Icons.email),
//                       title: Text('john.doe@example.com'),
//                     ),
//                     ListTile(
//                       leading: Icon(Icons.phone),
//                       title: Text('+1 123 456 7890'),
//                     ),
//                     ListTile(
//                       leading: Icon(Icons.location_on),
//                       title: Text('New York, USA'),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             Card(
//               margin: EdgeInsets.symmetric(horizontal: 20),
//               child: Padding(
//                 padding: EdgeInsets.all(16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     InkWell(
//                       onTap: () {
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (context) {
//                           return AdminPanel();
//                         }));
//                       },
//                       child: ListTile(
//                         leading: Icon(Icons.newspaper),
//                         title: Text('News Lists'),
//                         trailing: Icon(Icons.arrow_circle_down),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             Card(
//               margin: EdgeInsets.symmetric(horizontal: 20),
//               child: Padding(
//                 padding: EdgeInsets.all(16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Account Settings',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     ListTile(
//                       leading: Icon(Icons.lock),
//                       title: Text('Change Password'),
//                       trailing: Icon(Icons.arrow_forward_ios),
//                     ),
//                     ListTile(
//                       leading: Icon(Icons.logout),
//                       title: Text('Logout'),
//                       trailing: Icon(Icons.arrow_forward_ios),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }
// }

class AdminProfilePage extends StatefulWidget {
  @override
  _AdminProfilePageState createState() => _AdminProfilePageState();
}

class _AdminProfilePageState extends State<AdminProfilePage> {
  String? userEmail;
  String? userName;

  @override
  void initState() {
    super.initState();
    // Fetch the currently signed-in user's email
    fetchUserEmail();
  }

  // void fetchUserEmail() async {
  //   User? user = FirebaseAuth.instance.currentUser;
  //   if (user != null) {
  //     setState(() {
  //       userEmail = user.email;
  //     });
  //   }
  // }
  void fetchUserEmail() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // Extracting name from email
      String email = user.email ?? '';
      int atIndex = email.indexOf('@');
      if (atIndex != -1) {
        String name = email.substring(0, atIndex);
        setState(() {
          userEmail = email;
          userName = name;
        });
      }
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pop(); // Go back to the previous screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Profile'),
        backgroundColor: Colors.indigo[900],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('images/avatar.png'),
            ),
            SizedBox(height: 20),
            Text(
              // 'John Doe',
              userName ?? 'Loading...',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Admin',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 30),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Personal Information',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    ListTile(
                      leading: Icon(Icons.email),
                      title: Text(userEmail ?? 'Loading...'),
                    ),
                    // Other personal information ListTile widgets here
                  ],
                ),
              ),
            ),
            // Other Card widgets here
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: logout,
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
