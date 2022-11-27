import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hiveapp/pages/home_page.dart';
import 'package:hiveapp/pages/login_page.dart';

void main(List<String> args) async {
  await Hive.initFlutter();
  await Hive.openBox("nem_nig");
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool isLogin = false;
  login() {
    var box = Hive.box("nem_nig");

    setState(() {
      isLogin = box.get("isLogin") ?? false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    login();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: isLogin ? HomePage() : LoginPage(),
    );
  }
}
