import 'package:cooking_app/pages/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cooking_app/provider/time_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: TimeProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: const TextTheme(
            headline1: TextStyle(
                fontSize: 23.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
            headline2: TextStyle(fontSize: 17.0, color: Colors.black),
            bodyText1: TextStyle(
                fontSize: 14.0, fontFamily: 'Hind', color: Colors.grey),
            bodyText2: TextStyle(
                fontSize: 11.0, fontFamily: 'Hind', color: Colors.grey),
          ),
        ),
        home: const MainScreen(),
      ),
    );
  }
}
