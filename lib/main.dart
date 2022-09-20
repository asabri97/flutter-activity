import 'package:flutter/material.dart';
import 'package:flutter_activity/features/random_activity/display/pages/landing_page.dart';
import 'package:flutter_activity/features/random_activity/display/provider/random_activity_provider.dart';
import 'package:flutter_activity/features/random_activity/display/provider/selected_page_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RandomActivityProvider()),
        ChangeNotifierProvider(create: (context) => SelectedPageProvider())
      ],
      child: MaterialApp(debugShowCheckedModeBanner: false,
      title: 'The Boring App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(titleTextStyle: TextStyle(
          color: Colors.black87,
          fontSize: 30,
        ))
      ),
      home: const Home(),
      )
    );}
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const LandingPage();
  }
}