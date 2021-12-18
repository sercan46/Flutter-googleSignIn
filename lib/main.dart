import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_methods/widgets/home/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.pink[400]),
            ),
          ),
          appBarTheme: AppBarTheme(backgroundColor: Colors.pink[400])),
      title: 'Login Methodları',
      home: HomeView(),
    ),
  );
}
