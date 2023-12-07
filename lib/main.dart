import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:news_app_getx/view/screens/home_screen.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final box = GetStorage();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    debugPrint(box.read("theme"));
    return GetMaterialApp(
      home: HomeScreen(),
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      //|| box.read("theme")!="light"
      themeMode: box.read("theme") == null  || box.read("theme")!="light"
      ? ThemeMode.light 
      : ThemeMode.dark,

      debugShowCheckedModeBanner: false,
    );
  }
}
