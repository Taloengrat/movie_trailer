import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movie_trailer/providers/movie_provider.dart';
import 'package:movie_trailer/screens/account_screen/account_screen.dart';
import 'package:movie_trailer/screens/begin_screen/begin_screen.dart';
import 'package:movie_trailer/screens/detail_screen/detail_screen.dart';
import 'package:movie_trailer/screens/main_screen/main_screen.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => MovieProvider(),
    ),
    ChangeNotifierProvider(
      create: (_) => AuthProvider(),
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      initialRoute: MainScreen.routeName,
      routes: {
        BeginScreen.routeName: (context) => const BeginScreen(),
        MainScreen.routeName: (context) => const MainScreen(),
        AccountScreen.routeName: (context) => const AccountScreen(),
        DetailScreen.routeName: (context) => DetailScreen(),
      },
    );
  }
}
