import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_task/provider/provider.dart';
import 'package:provider_task/view/splash_screen/splash_screen.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
    create: (context) => ShoppingAppProvider(),
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.brown),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
