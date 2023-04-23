import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AnnouncementsScreen extends StatefulWidget {
  @override
  _AnnouncementsScreenState createState() => _AnnouncementsScreenState();
}

class _AnnouncementsScreenState extends State<AnnouncementsScreen> {
  late Stream<DocumentSnapshot> _announcementsStream;

  @override
  void initState() {
    super.initState();
    _announcementsStream = FirebaseFirestore.instance
        .collection('announcements')
        .doc('0rObHZX98MivEd6NWlGw') // Replace with the actual document ID
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    print(_announcementsStream);

    return Scaffold(
      appBar: AppBar(
        title: Text('Announcements'),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: _announcementsStream,
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Something went wrong'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.data() == null) {
            return Center(child: Text('No announcements found'));
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
