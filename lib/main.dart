import "package:flutter/material.dart";
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:to_do_app/util/app_style.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:to_do_app/pages/auth_page.dart';
void main() async{
WidgetsFlutterBinding.ensureInitialized();

//  firebase'i başlatıyoruz
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // initialize hive_ce
  await Hive.initFlutter();

  // open a box
  await Hive.openBox('mybox');




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
      home:const AuthPage(),
      );
    }
  }