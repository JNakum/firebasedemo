import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasedemo/firebase_services/authservices.dart';
import 'package:firebasedemo/ui/auth/signup_screen.dart';
import 'package:firebasedemo/ui/posts/post_screen.dart';
import 'package:firebasedemo/utils/utils.dart';
import 'package:firebasedemo/widget/round_button.dart';
import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;
  final _fromKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

//login with google account!.
  Future<void> loginwithgoogle() async {
    setState(() {
      loading = true;
    });
    try {
      UserCredential userCredential = await Authservices().loginInWithGoogle();
      if (userCredential.user != null) {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const PostScreen()));
      } else {
        showDialog(
            // ignore: use_build_context_synchronously
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Error"),
                content: const Text("Google login failed No user information"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Ok")),
                ],
              );
            });
      }
    } catch (error) {
      log("Error During Google Login => $error");
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  void login() {
    setState(() {
      loading = true;
    });
    _auth
        .signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text.toString(),
    )
        .then((value) {
      Utils().toastMessage(value.user!.email.toString());
      setState(() {
        loading = false;
      });
      // Check if widget is still mounted before using context
      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PostScreen(),
          ),
        ).then((_) {
          emailController.clear();
          passwordController.clear();
        });
      }
    }).onError(
      (error, stackTrace) {
        // Utils().toastMessage(error.toString());
        showDialog(
            // ignore: use_build_context_synchronously
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text(
                  "Error",
                  style: TextStyle(fontSize: 50, color: Colors.red),
                ),
                content: const Text("Login Failed No User Information"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Ok")),
                ],
              );
            });
        setState(() {
          loading = false;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Login.",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _fromKey,
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: const InputDecoration(
                      hintText: "Email",
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Email";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: "Password",
                      prefixIcon: Icon(Icons.lock_open),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Password";
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            RoundButton(
              title: "Login",
              loading: loading,
              ontap: () {
                if (_fromKey.currentState!.validate()) {
                  login();
                }
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignupScreen(),
                      ),
                    );
                  },
                  child: const Text("Register"),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Login With Google "),
                TextButton(
                    onPressed: () {
                      log("Button Pressed");
                      loading
                          ? const CircularProgressIndicator()
                          : loginwithgoogle();
                    },
                    child: const Icon(Icons.login))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
