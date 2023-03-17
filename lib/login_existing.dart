// ignore_for_file: camel_case_types, missing_return

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sniff_me/login_new.dart';
import 'package:sniff_me/main2.dart';



class login extends StatefulWidget {
  const login({Key key}) : super(key: key);



  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  final _auth = FirebaseAuth.instance;

  String errorMessage;

  @override
  Widget build(BuildContext context) {

    final emailField = TextFormField(
      autofocus: false,
      controller: emailcontroller,
      keyboardType: TextInputType.emailAddress,
      validator: (value){
        if(value.isEmpty){
          return ("Please enter your Email");
        }
        if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
          return ("Please enter a valid email");
        }
        return null;
      },
      onSaved: (value)
      {
        emailcontroller.text = value;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail),
          contentPadding:  const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email Address",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )
      ),
    );

    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordcontroller,
      obscureText: true,
      onSaved: (value)
      {
        passwordcontroller.text = value;
      },
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value.isEmpty) {
          return ("Password is required for login");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Password(Min. 6 Character)");
        }
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock),
          contentPadding:  const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )
      ),
    );

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.deepOrangeAccent,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(50, 15, 50, 15),
        onPressed: (){
          signIn(emailcontroller.text, passwordcontroller.text);
        },
        child: const Text(
          "LOGIN",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 200,
                      child: Image(
                        image: AssetImage('assets/logo.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 45),
                    emailField,
                    const SizedBox(height: 35),
                    passwordField,
                    const SizedBox(height: 25),
                    loginButton,
                    const SizedBox(height: 15),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text("Don't have an account? "),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          loginNew()));
                            },
                            child: const Text(
                              "SignUp",
                              style: TextStyle(
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          )
                        ])
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

void signIn(String email, String password) async {
  if (_formKey.currentState.validate()) {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
        Fluttertoast.showToast(msg: "Login Successful"),
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const Main2())),
      });
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage = "Your email address appears to be malformed.";

          break;
        case "wrong-password":
          errorMessage = "Your password is wrong.";
          break;
        case "user-not-found":
          errorMessage = "User with this email doesn't exist.";
          break;
        case "user-disabled":
          errorMessage = "User with this email has been disabled.";
          break;
        case "too-many-requests":
          errorMessage = "Too many requests";
          break;
        case "operation-not-allowed":
          errorMessage = "Signing in with Email and Password is not enabled.";
          break;
        default:
          errorMessage = "An undefined Error happened.";
      }
      Fluttertoast.showToast(msg: errorMessage);
      print(error.code);
    }
  }
}
}