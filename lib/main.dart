// import 'screens/GoalScreen/GoalScreen.dart';
import 'screens/Login%20signUp/LoginSignup.dart';
import 'screens/Login%20signUp/forgotPassword.dart';
import 'screens/OnBoardingScreen/onBoardingScreen.dart';
import 'screens/ProfilePage/profilePage.dart';
// import 'screens/activityLevelScreen/activityLevelScreen.dart';
import 'screens/homeScreen/Notifications.dart';
import 'screens/homeScreen/bottomNavigationbar.dart';
import 'screens/homeScreen/homeScreen.dart';
import 'screens/weightScreen/WeightScreen.dart';
// import 'screens/workoutCategories.dart';
import 'package:flutter/material.dart';
import 'screens/ProfilePage/SettingsPage.dart';
import 'screens/ageScreen/ageScreen.dart';
import 'screens/genderScreen/genderScreen.dart';
import 'screens/heightScreen/heightScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.black,
      routes: {
        '/onboarding': (context) => const OnBoardingScreen(),
        '/gender': (context) => const GenderPage(),
        '/age': (context) => const AgePage(),
        '/height': (context) => const HeightPage(),
        '/weight': (context) => const WeightPage(),
        // '/activity': (context) => const ActivityLevelPage(),
        // '/goal': (context) => const GoalPage(),
        '/forgotPassword': (context) => const ForgotPassword(),
        '/login': (context) => const SignUp(),
        '/home': (context) => const HomePage(),
        '/notifications': (context) => const NotificationPage(),
        // '/workoutCategories': (context) => const WorkoutCategories(),
        '/bottomNavigationbar': (context) => const HomepageNavbar(),
        '/profile': (context) => const ProfilePage(),
        '/settings': (context) => const SettingsPage(),

      },
      debugShowCheckedModeBanner: false,
      home: const HomepageNavbar(),
    );
  }
}
