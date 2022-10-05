import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqlite_practice/src/controllers/guest_controller.dart';
import 'package:sqlite_practice/src/controllers/theme_controller.dart';
import 'package:sqlite_practice/src/view/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GuestController(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeContoller(),
        )
      ],
      child: MaterialApp(
          theme: ThemeData.dark(),
          title: 'Flutter Demo',
          home: const HomePage()),
    );
  }
}
