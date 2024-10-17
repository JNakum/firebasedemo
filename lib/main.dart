import 'package:firebasedemo/ui/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // Add this block to globally set AppBar theme
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepPurple, // Set AppBar background color
          foregroundColor: Colors.white, // Set AppBar text/icon color
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
