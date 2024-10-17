import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasedemo/ui/auth/login_screen.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  @override
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post Screen"),
        actions: [
          IconButton(
            onPressed: () {
              auth.signOut().then((value) {
                // Check if the widget is still mounted
                if (mounted) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                }
              }).catchError((error) {
                // Handle sign out error if any
                debugPrint('Sign out failed: $error');
              });
            },
            icon: const Icon(Icons.logout),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Container(),
    );
  }
}
