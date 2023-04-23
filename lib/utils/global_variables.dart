import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_app_socian/pages/add_post_screen.dart';
import 'package:social_app_socian/widgets/alumni_screen.dart';

import '../pages/feed_screen.dart';
import '../pages/profile_screen.dart';

List<Widget> homeScreenItems = [
  const FeedScreen(),
  // const AddPostScreen(),
  // const Text("Notifications Page"),
  AlumniScreen(),
  // ProfileScreen(
  //   uid: FirebaseAuth.instance.currentUser!.uid,
  // ),
];
