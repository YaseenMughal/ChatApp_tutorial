import 'package:chatapp/pages/home.dart';
import 'package:chatapp/pages/signup.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController tfcemail = TextEditingController();
  TextEditingController tfcpassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 99, 19, 114),
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Sign-In",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: height * .02),
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50))),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 15, left: 15, right: 15, bottom: 3),
                      child: Column(
                        children: [
                          Text(
                            "Login to your account",
                            style: style(size: 23.0),
                          ),
                          SizedBox(height: height * .06),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Color.fromARGB(255, 233, 211, 238),
                                hintText: "Email Address",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12))),
                          ),
                          SizedBox(height: height * .03),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Color.fromARGB(255, 233, 211, 238),
                                hintText: "Password",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12))),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text("Forget Password?",
                                style: style(size: 17.0)),
                          ),
                          SizedBox(height: height * .05),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChatScreen()));
                            },
                            child: Container(
                              height: height * .08,
                              width: width * 1,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 99, 19, 114),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Center(
                                child: Text(
                                  "LOGIN",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 26.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: height * .03),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUp()));
                            },
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: "Don't have an account? ",
                                      style: style(size: 16.0)),
                                  TextSpan(
                                    text: "SignUp",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 195, 60, 219),
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ))
                ]),
          ),
        ),
      ),
    );
  }
}

style({required size}) {
  return TextStyle(
      color: Color.fromARGB(255, 99, 19, 114),
      fontSize: size,
      fontWeight: FontWeight.bold);
}
