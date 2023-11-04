import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:travelapp/screens/registration_screen.dart';

import '../components/loading_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    // TODO: implement initState
    emailController.addListener(() {
      listener:
      (context);
    });
    passwordController.addListener(() {
      listener:
      (context);
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.removeListener(() {
      listener:
      (context);
    });
    passwordController.removeListener(() {
      listener:
      (context);
    });
    super.dispose();
  }

  @override
  final formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
                  height: 300,
                  width: 300,
                  child: Lottie.asset(
                    'assets/animations/1.json',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Sign In",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.yellow[300]),
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  "Enter valid Email & password",
                  style: TextStyle(fontSize: 15, color: Colors.white),
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
                    "Login",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    print("Button pressed");
                    //loginUser();
                    final form = formkey.currentState!;
                    String email = emailController.text;
                    String password = passwordController.text;
                    print('$email is the mail');
                    print('$password is the password');
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
                    "Don't have an account?",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => RegistrationScreen()));
                    },
                    child: Text(
                      "Sign Up !",
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

  // void loginUser() {
  //   if (passwordController.text == "") {
  //     Fluttertoast.showToast(
  //         msg: 'Password cannot be blank', backgroundColor: Colors.red);
  //   } else {
  //     String email = emailController.text;
  //     String password = passwordController.text;
  //     FirebaseAuth.instance
  //         .signInWithEmailAndPassword(email: email, password: password)
  //         .then((value) {
  //       Navigator.pushReplacement(
  //           context, MaterialPageRoute(builder: (_) => HomeScreen()));
  //     }).catchError((e) {
  //       Fluttertoast.showToast(msg: '$e', backgroundColor: Colors.red);
  //     });
  //   }
  // }
}
