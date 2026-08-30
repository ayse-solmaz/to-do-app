import "package:flutter/material.dart";
import 'package:to_do_app/pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/util/app_style.dart';
void main() async{
WidgetsFlutterBinding.ensureInitialized();
  // initialize hive
  await Hive.initFlutter();

  // open a box
  var box = await Hive.openBox('mybox');




  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp (
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        primaryColor: kNavy,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: kNavy,
          brightness: Brightness.light,
        ).copyWith(primary: kNavy, surface: Colors.white),
        splashFactory: InkSparkle.splashFactory,
      ),
      home: const ToDoApp(),
      );
    }
  }