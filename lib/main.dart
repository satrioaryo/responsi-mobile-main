import 'package:flutter/material.dart';
import 'package:manajemen_tugas/ui/tugas_page.dart';

void main() {
  runApp(const MyApp());

  WidgetsFlutterBinding.ensureInitialized();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: TugasPage(),
    );
  }
}

