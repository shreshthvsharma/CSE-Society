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
        .doc(
            'F3Y8MBBCtsDhFYBPsFv5') // Replace 'eventDocument' with the actual document ID
        .snapshots();
  }

  Future<void> _participate(BuildContext context, String eventId) async {
    await FirebaseFirestore.instance
        .collection('register')
        .add({
          'userId': _currentUser!.uid,
          'eventId': eventId,
          'userName': _currentUser!.displayName,
          'userEmail': _currentUser!.email,
        })
        .then((value) => showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                  title: Text('Success!'),
                  content:
                      Text('You have successfully registered for the event.'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Close'),
                    ),
                  ],
                )))
        .catchError((error) => showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                  title: Text('Error'),
                  content:
                      Text('There was an error registering for the event.'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Close'),
                    ),
                  ],
                )));
  }

  Future<void> _volunteer(BuildContext context, String eventId) async {
    await FirebaseFirestore.instance
        .collection('volunteer')
        .add({
          'userId': _currentUser!.uid,
          'eventId': eventId,
          'userName': _currentUser!.displayName,
          'userEmail': _currentUser!.email,
        })
        .then((value) => showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                  title: Text('Success!'),
                  content:
                      Text('You have successfully volunteered for the event.'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Close'),
                    ),
                  ],
                )))
        .catchError((error) => showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                  title: Text('Error'),
                  content:
                      Text('There was an error volunteering for the event.'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Close'),
                    ),
                  ],
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events'),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: _eventsStream,
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Something went wrong'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.data() == null) {
            return Center(child: Text('No events found'));
          }
          Map<String, dynamic> data =
              snapshot.data!.data()! as Map<String, dynamic>;

          return ListView.builder(
            itemCount: data.entries.length,
            itemBuilder: (context, index) {
              MapEntry<String, dynamic> entry = data.entries.elementAt(index);
              String title = entry.key;
              String description = entry.value as String;
              String eventId = snapshot.data!.id;

              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 42, 21, 231),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          description,
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          onPressed: () => _participate(context, eventId),
                          child: Text('Participate'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.lightBlue,
                            onPrimary: Colors.white,
                            textStyle: TextStyle(fontSize: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () => _volunteer(context, eventId),
                          child: Text('Volunteer'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.lightBlue,
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
                ),
              );
            },
          );
        },
      ),
    );
  }
}
