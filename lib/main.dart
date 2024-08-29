import 'screens/GoalScreen/GoalScreen.dart';
import 'screens/Login%20signUp/LoginSignup.dart';
import 'screens/Login%20signUp/forgotPassword.dart';
import 'screens/OnBoardingScreen/onBoardingScreen.dart';
import 'screens/ProfilePage/profilePage.dart';
import 'screens/activityLevelScreen/activityLevelScreen.dart';
import 'screens/homeScreen/Notifications.dart';
import 'screens/homeScreen/bottomNavigationbar.dart';
import 'screens/homeScreen/homeScreen.dart';
import 'screens/weightScreen/WeightScreen.dart';
import 'screens/workoutCategories.dart';
import 'package:flutter/material.dart';
import 'screens/ProfilePage/SettingsPage.dart';
import 'screens/ageScreen/ageScreen.dart';
import 'screens/genderScreen/genderScreen.dart';
import 'screens/heightScreen/heightScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.black,
      routes: {
        '/onboarding': (context) => OnBoardingScreen(),
        '/gender': (context) => GenderPage(),
        '/age': (context) => AgePage(),
        '/height': (context) => HeightPage(),
        '/weight': (context) => WeightPage(),
        '/activity': (context) => ActivityLevelPage(),
        '/goal': (context) => GoalPage(),
        '/forgotPassword': (context) => ForgotPassword(),
        '/login': (context) => SignUp(),
        '/home': (context) => HomePage(),
        '/notifications': (context) => NotificationPage(),
        '/workoutCategories': (context) => WorkoutCategories(),
        '/bottomNavigationbar': (context) => HomepageNavbar(),
        '/profile': (context) => ProfilePage(),
        '/settings': (context) => SettingsPage(),
        
      },
      debugShowCheckedModeBanner: false,
      home: HomepageNavbar(),
    );
  }
}
