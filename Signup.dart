import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';


import 'package:cloud_firestore/cloud_firestore.dart';

import 'MyTextField.dart';

class SignUp extends StatefulWidget {
  static Pattern pattern =  
 r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
bool loading=false;
late UserCredential userCredential;
   

  // RegExp regExp = RegExp(SignUp.pattern);
  TextEditingController firstName=TextEditingController();
  TextEditingController lastName=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();

  GlobalKey<ScaffoldState> globalKey=GlobalKey<ScaffoldState>();
Future sendData() async {
  try {
  UserCredential userCredential = await FirebaseAuth.instance
  .createUserWithEmailAndPassword(
    email: email.text,
    password: password.text
  );
  await FirebaseFirestore.instance.collection('userData').doc(userCredential.user?.uid).set({
   'firstname':firstName.text.trim(),
  'lastname':lastName.text.trim(),
  'email':email.text.trim(),
  'password':password.text.trim(),
  'userid':userCredential.user?.uid,

  });
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }
} catch (e) {
  print(e);
}

//  await FirebaseFirestore.instance.collection('userData').doc().set({
// 'firstname':firstName.text,
// 'lastname':lastName.text,
// 'email':email.text,
// 'password':password.text,

//  });
 

}

void validation(){
  if(firstName.text.trim().isEmpty ){
    print('Terror');
// globalKey.currentState?.show(const SnackBar(content: Text("first name is empty")));
return;
  }
  if(lastName.text.trim().isEmpty ){
    print('Terror');
//  globalKey.currentState?.showSnackBar(const SnackBar(content: Text("lastName is empty")));
return;
  }
  if(password.text.trim().isEmpty){
        print('Terror');

//  globalKey.currentState?.showSnackBar(const SnackBar(content: Text("password is empty")));
return;
  }
    if(email.text.trim().isEmpty){
    print('Terror');
             return;}
//               else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email.text))
//               {
    
    
 
// // globalKey.currentState.showSnackBar1(const SnackBar(content: Text("password is empty")));
      // return;
      //   }
else{
  setState(() {
  loading=true;  
  });
  sendData();
}
}

  Widget button( 
    {
      required String buttonName,
      required Color color,
      required Color textColor,
      required Function ontap}){
    return Container(
        width: 120,
        child: ElevatedButton(
            style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              ),
            backgroundColor:color
    ),
       child: Text(buttonName,
       style: TextStyle(fontSize: 20,color: textColor),
       ),
    //  onPressed: () { },
        onPressed:() {ontap();},
  
  ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[
              Text("Sign Up",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 40),
              ),
              Container(
                height:300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
              MyTextField(controller: firstName, obscureText:false,hintText:"FirstName"),
              MyTextField(controller: lastName,obscureText:false,hintText:"LastName"),
              MyTextField(controller: email,obscureText:false,hintText:"Email"),
              MyTextField(controller: password, obscureText:true,hintText:"Password"),
           ],
          ),
              ),
    loading? Row (
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
        CircularProgressIndicator(),
      ],):
      Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          button(
           buttonName: "Cancel",
           color: Colors.grey ,
            textColor: Colors.red,
           ontap:(){ validation();},
           ),

           SizedBox(width: 10,),
          button(
          
            buttonName: "Register",
            color: Colors.red,
            textColor: Colors.white,
          ontap:(){ validation();},
             
            ),
                           
      ],)   
             
              ], ),
          ),
        ),
      ),

    );
  }
}