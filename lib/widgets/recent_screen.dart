import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RecentScreen extends StatefulWidget {
  @override
  _RecentScreenState createState() => _RecentScreenState();
}

class _RecentScreenState extends State<RecentScreen> {
  late Stream<DocumentSnapshot> _recentStream;

  @override
  void initState() {
    super.initState();
    _recentStream = FirebaseFirestore.instance
        .collection('recent')
        .doc('ID2TQoG2kBnMWy9I9ZeY') // Replace with the actual document ID
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    print(_recentStream);

    return Scaffold(
      appBar: AppBar(
        title: Text('Recent'),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: _recentStream,
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Something went wrong'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.data() == null) {
            return Center(child: Text('No recent items found'));
          }

          Map<String, dynamic> data = snapshot.data!.data()! as Map<String, dynamic>;

          return ListView.builder(
            itemCount: data.entries.length,
            itemBuilder: (context, index) {
              MapEntry<String, dynamic> entry = data.entries.elementAt(index);
              String title = entry.key;
              String description = entry.value as String;

              return ListTile(
                title: Text(title),
                subtitle: Text(description),
              );
            },
          );
        },
      ),
    );
  }
}
