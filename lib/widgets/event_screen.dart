import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EventsScreen extends StatefulWidget {
  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  late Stream<DocumentSnapshot> _eventsStream;
  User? _currentUser = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    _eventsStream = FirebaseFirestore.instance
        .collection('events')
        .doc('sHccgceD822Sd0zwmEZ9') // Replace 'eventDocument' with the actual document ID
        .snapshots();
  }

  Future<void> _participate(String eventId) async {
    await FirebaseFirestore.instance
        .collection('register')
        .add({'userId': _currentUser!.uid, 'eventId': eventId});
  }

  Future<void> _volunteer(String eventId) async {
    await FirebaseFirestore.instance
        .collection('volunteer')
        .add({'userId': _currentUser!.uid, 'eventId': eventId});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events'),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: _eventsStream,
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Something went wrong'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.data() == null) {
            return Center(child: Text('No events found'));
          }

          Map<String, dynamic> data = snapshot.data!.data()! as Map<String, dynamic>;

          return ListView.builder(
            itemCount: data.entries.length,
            itemBuilder: (context, index) {
              MapEntry<String, dynamic> entry = data.entries.elementAt(index);
              String title = entry.key;
              String description = entry.value as String;
              String eventId = snapshot.data!.id;

              return ListTile(
                title: Text(title),
                subtitle: Text(description),
                trailing: Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () => _participate(eventId),
                        child: Text('Participate'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          onPrimary: Colors.white,
                          textStyle: TextStyle(fontSize: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () => _volunteer(eventId),
                        child: Text('Volunteer'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          onPrimary: Colors.white,
                          textStyle: TextStyle(fontSize: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
