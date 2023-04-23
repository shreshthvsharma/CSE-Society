import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:social_app_socian/utils/colors.dart';
import 'package:social_app_socian/utils/dimensions.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    
  Widget _buildSectionItem({
    required String title,
    required IconData icon,
    required Function onTap,
  }) {
    return InkWell(
      onTap: () => onTap(),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Icon(icon, size:90),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildSections() {
    return [
      _buildSectionItem(
        title: 'Events',
        icon: Icons.event,
        onTap: () => Navigator.of(context).pushNamed('/events'),
      ),
      _buildSectionItem(
        title: 'Announcements',
        icon: Icons.announcement,
        onTap: () => Navigator.of(context).pushNamed('/announcements'),
      ),
      _buildSectionItem(
        title: 'Recent Achievements',
        icon: Icons.emoji_events,
        onTap: () => Navigator.of(context).pushNamed('/achievements'),
      ),
      _buildSectionItem(
        title: 'Placement Statistics',
        icon: Icons.thumb_up,
        onTap: () => Navigator.of(context).pushNamed('/suggested'),
      ),
    ];
  }

    ListTile _createDrawerItem({
      required IconData icon,
      required String text,
      required GestureTapCallback onTap,
    }) {
      return ListTile(
        title: Row(
          children: <Widget>[
            Icon(icon),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(text),
            ),
          ],
        ),
        onTap: onTap,
      );
    }

    Drawer _createDrawer() {
      return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // Modify the DrawerHeader to add a close button and set the background color
            DrawerHeader(
              decoration: BoxDecoration(
                color:mobileBackgroundColor, // dark navy blue
              ),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'CSE Society',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    
                  ),
                  
                       
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(Icons.close),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ),
            _createDrawerItem(
              icon: Icons.hub,
              text: 'Alumni',
              onTap: () {
                Navigator.of(context).pushNamed('/alumni');
              },
            ),
            _createDrawerItem(
              icon: Icons.school,
              text: 'Faculty',
              onTap: () {
                Navigator.of(context).pushNamed('/faculty');
              },
            ),
              _createDrawerItem(
              icon: Icons.abc,
              text: 'About CSE Society',
              onTap: () {
                Navigator.of(context).pushNamed('/about');
              },
            ),
                _createDrawerItem(
              icon: Icons.settings,
              text: 'Settings',
              onTap: () {
                Navigator.of(context).pushNamed('/settings');
              },
            ),
                _createDrawerItem(
              icon: Icons.help,
              text: 'Help and Feedback',
              onTap: () {
                Navigator.of(context).pushNamed('/help');
              },
            ),
            // Add more navigation items here
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: width > webScreenSize
          ? webBackgroundColor
          : mobileBackgroundColor,
      appBar: width > webScreenSize
          ? null
          : AppBar(
              backgroundColor: mobileBackgroundColor,
              centerTitle: false,
              title: const Text(
                "CSE Society",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Roboto",
                  fontStyle: FontStyle.italic,
                ),
              ),
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  );
                },
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Image.asset(
                    'assests/images/logo.png',
                    width: 64,
                    height: 64,
                  ),
                ),
              ],
            ),
      drawer: _createDrawer(),
 body: Column(
        children: [
         
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              // Set scrollDirection to vertical
              scrollDirection: Axis.vertical,
              itemCount: _buildSections().length,
              itemBuilder: (BuildContext context, int index) {
                return _buildSections()[index];
              },
            ),
          ),
        ],
      ),
    );
  }
}
