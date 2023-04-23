import 'package:flutter/material.dart';

class FacultyPage extends StatefulWidget {
  @override
  _FacultyPageState createState() => _FacultyPageState();
}

class _FacultyPageState extends State<FacultyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Faculty'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          buildFacultySection('Staff', 'Sample data for Profession'),
          buildFacultySection('Associate', 'Sample data for Associate'),
          buildFacultySection('Assistant', 'Sample data for Assistant'),
          buildFacultySection('Guest', 'Sample data for Guest'),
        ],
      ),
    );
  }

  Widget buildFacultySection(String title, String data) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          SizedBox(height: 8.0),
          Text(data),
          SizedBox(height: 16.0),
          Divider(),
        ],
      ),
    );
  }
}
