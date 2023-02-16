import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/HomePage.dart';

import 'MyTextField.dart';

class LoginScreen extends StatefulWidget {
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
 bool loading = false;
 
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
  late UserCredential userCredential;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future loginAuth() async {
    try {
      userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        setState(() {
          loading = false;
        });
      }
      setState(() {
        loading = false;
      });
    }
  }

  void validation() {
    if (email.text.trim().isEmpty && password.text.trim().isEmpty  ) {
         return;
    }
    if (email.text.trim().isEmpty ) {
   
      return;
    }
    if (password.text.trim().isEmpty) {
  
      return;
    } 
    else {
      setState(() {
        loading = true;
      });
      loginAuth();
    }
  }

  @override
  Widget textField(
      {required String hintText,
      required IconData icon,
      required Color iconColor}) {
    return TextFormField(
      decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: iconColor,
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 150),
              child: Text(
                "Login In",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Column(
              children: [
                MyTextField(
                  controller: email,
                  hintText: 'Email',
                  obscureText: false,
                ),
                SizedBox(
                  height: 30,
                ),
                MyTextField(
                  controller: password,
                  hintText: 'Password',
                  obscureText: true,
                ),
              ],
            ),
            loading ? CircularProgressIndicator(): Container(
                    height: 50,
                    width: 200,
                    child: ElevatedButton(
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          backgroundColor: Colors.red),
                      onPressed: () {
                        validation();

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage()));

                      },
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                Text(
                  "New User ? ",
                  style: TextStyle(
                    color: Colors.grey),
                ),
                Text(
                  "Register Now ?",
                  style: TextStyle(
                    color: Colors.red),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
