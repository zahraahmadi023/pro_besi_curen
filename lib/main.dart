import 'package:flutter/material.dart';
import 'package:pro_besi_curen/provider/theme_provider.dart';
import 'package:provider/provider.dart';

import 'UI/ui_switcht/theme_swicht.dart';

void main() {
  runApp(
    MultiProvider(
      providers:[
      ChangeNotifierProvider(create:(context) => ThemeProvider()),
      ],
      child: const MyMaterialApp(),

    ),
  );
}
class MyMaterialApp extends StatefulWidget {
  const MyMaterialApp(
    {super.key});

  @override
  State<MyMaterialApp> createState() => _MyMaterialAppState();
}

class _MyMaterialAppState extends State<MyMaterialApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder:(contexe ,themeProvider,childe) {
      return  MaterialApp(

      themeMode: themeProvider.themeMode,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,

      debugShowCheckedModeBanner: false,
      home: Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          appBar: AppBar(
            actions: [
              ThemeSwithc(),
            ],
            title: Center(child: Text("Exchandebs")),
          ),
          body: Container(
          ),
        ),
      ),
    );
      }
    );

  }
}


