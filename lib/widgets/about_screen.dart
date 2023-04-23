import 'package:flutter/material.dart';

class AboutCSESocietyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About CSE Society'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Text(
            'About CSE Society',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.0),
          Text(
            'The CSE Society is a student-led organization focused on the growth and development of computer science and engineering students. We aim to provide opportunities for learning, networking, and collaboration among our members.',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 16.0),
          Text(
            'Mission',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          Text(
            'Our mission is to empower computer science and engineering students to achieve academic and professional success, and to inspire a passion for technology and innovation.',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 16.0),
          Text(
            'Vision',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          Text(
            'We envision a thriving community of students, educators, and professionals working together to advance the field of computer science and engineering, and to create a better future through technology.',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 16.0),
          Text(
            'Values',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          Text(
            'Our core values are inclusivity, collaboration, innovation, and excellence.',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 16.0),
          Text(
            'Membership',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          Text(
            'Membership in the CSE Society is open to all students pursuing computer science and engineering degrees. To join the CSE Society, please visit our registration page.',
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
