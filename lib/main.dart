import 'package:connector/screens/splash_sxreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

late Size mq;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  _initializeFirebase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          elevation: 1,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontSize: 18,
          ),
          backgroundColor: Colors.white,
        ),
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}

_initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
