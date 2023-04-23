import 'package:flutter/material.dart';

class HelpAndFeedbackScreen extends StatefulWidget {
  @override
  _HelpAndFeedbackScreenState createState() => _HelpAndFeedbackScreenState();
}

class _HelpAndFeedbackScreenState extends State<HelpAndFeedbackScreen> {
  TextEditingController _subjectController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  void _submitForm() {
    // Submit the help and feedback form to your backend
    print('Subject: ${_subjectController.text}');
    print('Description: ${_descriptionController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help & Feedback'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          TextFormField(
            controller: _subjectController,
            decoration: InputDecoration(
              labelText: 'Subject',
            ),
          ),
          SizedBox(height: 8.0),
          TextFormField(
            controller: _descriptionController,
            decoration: InputDecoration(
              labelText: 'Description',
            ),
            maxLines: 5,
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: _submitForm,
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
