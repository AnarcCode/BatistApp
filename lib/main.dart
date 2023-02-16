import 'package:batistapp/bindings/main_binding.dart';
import 'package:batistapp/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Batistapp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: AppPages.pages,
      initialRoute: Routes.MAIN,
      initialBinding: MainBinding(),
      debugShowCheckedModeBanner: false,
    );
  }
}
