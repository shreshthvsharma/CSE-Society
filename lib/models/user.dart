import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String name;
  final String username;
  final String email;
  final String password;
  final String uid;
  // final String photoUrl;
  final List following;
  final List followers;
  final String category;

  const User({
    required this.name,
    required this.username,
    required this.email,
    required this.password,
    required this.uid,
    // required this.photoUrl,
    required this.following,
    required this.followers, 
    required this.category,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'username': username,
        'email': email,
        'password': password,
        'category':category,
        'uid': uid,
        // 'photoUrl': photoUrl,
        'following': following,
        'followers': followers,
      };

  static User fromSnap(DocumentSnapshot snap) {
    if(snap.data() == null) {return User(
      name: "",
      username: "",
      email: "",
      category: "",
      password: "",
      uid: "",
      // photoUrl: "",
      following: [],
      followers: [],
    );
    }
    else{
    var snapshot = snap.data() as Map<String, dynamic>;


    return User(
      name: snapshot['name'],
      username: snapshot['username'],
      email: snapshot['email'],
      category: snapshot['category'],
      password: snapshot['password'],
      uid: snapshot['uid'],
      // photoUrl: snapshot['photoUrl'],
      following: snapshot['following'],
      followers: snapshot['followers'],
    );
    }
  }
}
