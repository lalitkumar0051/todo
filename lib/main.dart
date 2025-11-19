import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider_learn/Pages/home_page.dart';
import 'package:provider_learn/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,

        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color(0xff03045e),
          foregroundColor: Color(0xffcaf0f8),
        ),
        appBarTheme: AppBarThemeData(
          backgroundColor: Color(0xff03045e),
          foregroundColor: Color(0xffcaf0f8),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
