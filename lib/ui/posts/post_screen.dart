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

  final uid = FirebaseAuth.instance.currentUser!.uid;
  // final email = FirebaseAuth.instance.currentUser!.email;

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
                    // ignore: use_build_context_synchronously
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
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            children: [
              Text("Id :- $uid"),
              const SizedBox(
                height: 10,
              ),
              Text("Email :- ${auth.currentUser!.email}")
            ],
          ),
        ),
      ),
    );
  }
}
