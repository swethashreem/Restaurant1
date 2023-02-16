import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/HomePage.dart';
import 'package:flutter_login/LoginScreen.dart';
import 'package:flutter_login/MyProvider.dart';
import 'package:provider/provider.dart';
import 'DetailPage.dart';


Future<void> main() async {
     WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
   
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
     ChangeNotifierProvider(create: (_) => MyProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Restaurant new',
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xff2b2b2b) ,
  
          appBarTheme: AppBarTheme(
            color: Color(0xff2b2b2b),
          )
               ),
        // home: LoginPage( ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (index, sncpshot) {
            if(sncpshot.hasData)       
            {
              return HomePage();
            }
            return HomePage();
    
        }),
        ),
    );
  }
}

