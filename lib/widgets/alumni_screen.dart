import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_app_socian/pages/login_screen.dart';

class AlumniScreen extends StatefulWidget {
  @override
  _AlumniScreenState createState() => _AlumniScreenState();
}

class _AlumniScreenState extends State<AlumniScreen> {
  User _user = FirebaseAuth.instance.currentUser!;
  Map<String, dynamic> userData = {};
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _getProfileData();
  }
  
  // Future<void> _getProfileData() async {
  //   QuerySnapshot userQuerySnapshot = await FirebaseFirestore.instance
  //       .collection('users')
  //       .where('uid', isEqualTo: _user.uid)
  //       .get();

  //   if (userQuerySnapshot.docs.isNotEmpty) {
  //     DocumentSnapshot userSnapshot = userQuerySnapshot.docs.first;
  //     Map<String, dynamic> userData = userSnapshot.data() as Map<String, dynamic>;
  //     setState(() {
  //       _displayName = userData['name'];
  //       _category = userData['category'];
  //       _profileImageUrl = userData['photoUrl'] ?? 'https://via.placeholder.com/150';
  //       _bio = userData['bio'] ?? '';
  //     });
  //   }
  // }

  Future<void> _getProfileData() async {
    QuerySnapshot<Map<String, dynamic>> userSnapshot =
    await FirebaseFirestore.instance
    .collection('users')
        .where('uid', isEqualTo: _user.uid)
        .get();
        // await FirebaseFirestore.instance.collection('users').doc(_user.uid).get();

    setState(() {
      userData = userSnapshot.docs.first.data();
      isLoading = false;
    });
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            appBar: AppBar(
              // backgroundColor: Colors.blue,
              title: Text("Alumni" + " " +userData['name'].toString()),
              centerTitle: false,
            ),
            body: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.grey,
                            backgroundImage: NetworkImage(
                              userData['photoUrl'] ??
                                  'https://via.placeholder.com/150',
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                ElevatedButton(
                                  onPressed: _signOut,
                                  child: Text('Sign Out'),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.deepPurple,
                                    onPrimary: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0),
                                      side: BorderSide(color: Colors.blue),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(top: 18.0),
                        child: Text(
                          userData['name'].toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(top: 1.0),
                        child: Text(
                          userData['category'].toString(),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                // Add more widgets for other profile data
              ],
            ),
          );
  }
}


