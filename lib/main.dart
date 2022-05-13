import 'package:flutter/material.dart';
import './screens/kalkulator.dart';
import './utils/tema.dart';



void main(List<String> args) {
  runApp(const MyApp()); 
}


class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Warna.warnaGelap,
        scaffoldBackgroundColor: Warna.warnaGelap,
        appBarTheme: AppBarTheme(
          backgroundColor: Warna.warnaGelap,
        ),
      ),
      routes: {
        '/': (context) => Kalkulator(),
      },
    );
  }
}
