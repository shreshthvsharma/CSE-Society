import 'package:flutter/material.dart';

class AlumniScreen extends StatelessWidget {
  AlumniScreen({Key? key}) : super(key: key);

  final List<Map<String, String>> alumniMembers = [
    {
      'name': 'Nikhil Srivastava',
      'description': 'Software Engineer at Confluent | Kafka Connect',
      'photoUrl':
          'https://media.licdn.com/dms/image/D4D03AQF_4ytaG5iYnQ/profile-displayphoto-shrink_200_200/0/1672856539547?e=1687996800&v=beta&t=xTdlRtwmtxXP4p_AvK1JVckItJruNV_0Qr3YFa2mOYE',
    },
    {
      'name': 'Shobhit Srivastava',
      'description': 'Co-Founder at Shovel Company',
      'photoUrl':
          'https://media.licdn.com/dms/image/C5603AQE2jos70UTbVQ/profile-displayphoto-shrink_200_200/0/1516986433408?e=1687996800&v=beta&t=z2n0K7h3NfF3WswDxLnlrUkLbqGgGhDccSXObZY6DP4',
    },
    {
      'name': 'Ayush Chauhan',
      'description': 'DACBY | IITJ CSE 2023 | Gaming Ecommerce',
      'photoUrl':
          'https://media.licdn.com/dms/image/D4D03AQGWpgVSk2WXvw/profile-displayphoto-shrink_200_200/0/1675408416335?e=1687996800&v=beta&t=gZggqIO_m5z8_ZBKz8RV1peU4jSdxZTBhVhcahwWE5s',
    },
    {
      'name': 'Shashank Kumar',
      'description': 'Founder at PushOwl (Acquired by Sendinblue)',
      'photoUrl':
          'https://media.licdn.com/dms/image/C5103AQHnzPSLFwiciQ/profile-displayphoto-shrink_200_200/0/1534173731046?e=1687996800&v=beta&t=NvSFaBDchL1vc9RCJQGD578hLvGMhT6zcqEOM3596tI',
    },
    {
      'name': 'Aniket Parate',
      'description':
          'SDE II at Mudrex(YC W19) | Ex-Optum | CSE\'2020 IIT Jodhpur',
      'photoUrl':
          'https://media.licdn.com/dms/image/C4E03AQEYTwHMkebIbg/profile-displayphoto-shrink_200_200/0/1597411297266?e=1687996800&v=beta&t=gHKJKtHilAuIkNDLHJIy6LB149PL0qSeI-NBBOYgLAI',
    },
    {
      'name': 'Kuldeep Jangir',
      'description':
          'Big Data consultant | hadoop consultant | Analyst at Goldman Sachs',
      'photoUrl':
          'https://media.licdn.com/dms/image/C5103AQHOSGsRu_peqw/profile-displayphoto-shrink_200_200/0/1561947822573?e=1687996800&v=beta&t=cwmAbV2LUdkNXPS1mI7j35z9poWmudfFOyfG-oKvbao',
    },
  ];

  Widget _buildAlumniCard(Map<String, String> member) {
    return Card(
      color: Color.fromARGB(255, 74, 23, 163),
      child: Column(
        children: [
          Image.network(
            member['photoUrl']!,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8),
          Text(
            member['name']!,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            member['description']!,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alumni'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(8),
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        children:
            alumniMembers.map((member) => _buildAlumniCard(member)).toList(),
      ),
    );
  }
}
