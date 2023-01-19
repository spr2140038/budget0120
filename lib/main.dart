import 'package:budget/budget_main.dart';
import 'package:budget/budget_setting.dart';
import 'package:flutter/material.dart';
import '../model/budgets.dart';
import '../model/budget_db_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      // home: const MyHomePage(title: '', id: null,),
      routes: <String, WidgetBuilder>{
        '/': (_) => BudgetMain(title: '', ),
      },
    );
  }
}

