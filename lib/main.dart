import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:krish_works/misc/theme.dart';
import 'package:krish_works/screens/home_page.dart';
import 'package:krish_works/screens/second_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.landscapeRight,DeviceOrientation.landscapeLeft]
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Themes.theme,
      home: Homepage()
    );
  }
}
