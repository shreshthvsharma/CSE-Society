import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_app_socian/pages/login_screen.dart';
import 'package:social_app_socian/providers/user_provider.dart';
import 'package:social_app_socian/responsive/mobile_screen_layout.dart';
import 'package:social_app_socian/responsive/responsive_layout_screen.dart';
import 'package:social_app_socian/responsive/web_screen_layout.dart';
import 'package:social_app_socian/utils/colors.dart';
import 'package:social_app_socian/widgets/about_screen.dart';
import 'package:social_app_socian/widgets/alumni_screen.dart';
import 'package:social_app_socian/widgets/announcements_screen.dart';
import 'package:social_app_socian/widgets/event_screen.dart';
import 'package:social_app_socian/widgets/faculty_screen.dart';
import 'package:social_app_socian/widgets/help_screen.dart';
import 'package:social_app_socian/widgets/recent_screen.dart';
import 'package:social_app_socian/widgets/settings_screen.dart';
import 'package:social_app_socian/widgets/suggested_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyCv84RN7u7iDBDu1LAmfNKaeEpjvOx6V6Q",
        messagingSenderId: "24056576475",
        projectId: "cse-society-8e0b3",
        storageBucket: "cse-society-8e0b3.appspot.com",
        appId: '1:24056576475:android:9203df4b0988155a714ffe',

        // <== | FOR LATER USE | ==>
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'CSE Society',
          theme: ThemeData.dark()
              .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
          routes: {
            '/events': (context) => EventsScreen(),
            '/announcements': (context) => AnnouncementsScreen(),
            '/achievements': (context) => RecentScreen(),
            '/suggested': (context) => SuggestedScreen(),
            '/alumni': (context) => AlumniScreen(),
            '/faculty': (context) => FacultyPage(),
            '/about': (context) => AboutCSESocietyScreen(),
            '/settings': (context) => SettingsScreen(),
            '/help': (context) => HelpAndFeedbackScreen(),
          },
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: primaryColor,
                  ),
                );
              } else if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  return const ResponsiveLayout(
                    webScreenLayout: WebScreenLayout(),
                    mobileScreenLayout: MobileScreenLayout(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("Error${snapshot.error}"),
                  );
                }
              }

              return const LoginScreen();
            },
          )),
    );
  }
}
