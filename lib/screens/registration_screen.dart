import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:travelapp/screens/login.dart';

import '../components/loading_button.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  final formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  bool obscureText = true;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Center(
                child: Container(
                  height: 200,
                  width: 400,
                  // child: Lottie.asset(
                  //   'assets/animations/lottie2.json',
                  // ),
                ),
              ),
              Text(
                "Sign Up",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.yellow[300]),
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  "Use proper information",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 10),
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: 'Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 2, color: Colors.yellow),
                    ),
                    prefixIcon: Icon(
                      Icons.person,
                    ),
                    prefixIconColor: Colors.black,
                    suffixIcon: emailController.text.isEmpty
                        ? Container(
                            width: 0,
                          )
                        : IconButton(
                            onPressed: () {
                              emailController.clear();
                            },
                            icon: Icon(
                              Icons.close,
                              color: Colors.black,
                            ),
                          ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 10),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 2, color: Colors.yellow),
                    ),
                    prefixIcon: Icon(
                      Icons.email,
                    ),
                    prefixIconColor: Colors.black,
                    suffixIcon: emailController.text.isEmpty
                        ? Container(
                            width: 0,
                          )
                        : IconButton(
                            onPressed: () {
                              emailController.clear();
                            },
                            icon: Icon(
                              Icons.close,
                              color: Colors.black,
                            ),
                          ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  autofillHints: [AutofillHints.email],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 10),
                child: TextFormField(
                  obscureText: obscureText,
                  obscuringCharacter: '*',
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(width: 2, color: Colors.yellow),
                    ),
                    prefixIcon: Icon(
                      Icons.lock,
                    ),
                    prefixIconColor: Colors.black,
                    suffixIcon: emailController.text.isEmpty
                        ? Container(
                            width: 0,
                          )
                        : GestureDetector(
                            child: Icon(
                              Icons.remove_red_eye_outlined,
                              color: Colors.black,
                            ),
                            onLongPress: () {},
                            onLongPressUp: () {},
                          ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: LoadingAnimatedButton(
                  child: Text(
                    "Register",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    print('object');
                    // registerUser();
                    final form = formkey.currentState!;
                    String email = emailController.text;
                    String password = passwordController.text;
                    String name = nameController.text;
                    print('$email is email');
                    print('$password is password');
                    print('$name is name');
                    if (form.validate()) {
                      final email = emailController.text;
                      final password = passwordController.text;
                    } else {}
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => LoginScreen()));
                    },
                    child: Text(
                      "Sign In !",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.yellow[300],
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // void registerUser() {
  //   if (passwordController.text == "") {
  //     Fluttertoast.showToast(
  //         msg: 'Password cannot be blank', backgroundColor: Colors.red);
  //   } else if (emailController.text == "") {
  //     Fluttertoast.showToast(
  //         msg: 'Email cannot be blank', backgroundColor: Colors.red);
  //   } else if (nameController.text == "") {
  //     Fluttertoast.showToast(
  //         msg: 'Name cannot be blank', backgroundColor: Colors.red);
  //   } else {
  //     String email = emailController.text;
  //     String password = passwordController.text;
  //     FirebaseAuth.instance
  //         .createUserWithEmailAndPassword(email: email, password: password)
  //         .then((value) {
  //       if (value != null) {
  //         var user = value.user;
  //         var uid = user!.uid;
  //         addUserData(uid);
  //       }
  //     }).catchError((e) {
  //       Fluttertoast.showToast(msg: '$e', backgroundColor: Colors.red);
  //     });
  //   }
  // }

  // void addUserData(String uid) {
  //   Map<String, dynamic> usersData = {
  //     'name': nameController.text,
  //     'password': passwordController.text,
  //     'email': emailController.text,
  //     'uid': uid,
  //   };
  //   FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(uid)
  //       .set(usersData)
  //       .then((value) {
  //     Fluttertoast.showToast(
  //         msg: 'Registration Successful', backgroundColor: Colors.green);
  //     Navigator.pushReplacement(
  //         context, MaterialPageRoute(builder: (_) => HomeScreen()));
  //   }).catchError((e) {
  //     Fluttertoast.showToast(msg: '$e', backgroundColor: Colors.red);
  //   });
  // }
}
