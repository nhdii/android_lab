// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:lab_android/counter_provider_app/page_counter.dart';
import 'package:lab_android/drawer_Page.dart';
import 'package:lab_android/form/page_form_mathang.dart';
import 'package:lab_android/layout/page_listview.dart';
import 'package:lab_android/page_home.dart';
import 'package:lab_android/profile/profile.dart';
import 'package:lab_android/profile/profile1.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: PageHome(),
    );
  }
}

//Vi du GetX
class Home extends StatelessWidget {
  @override
  Widget build(context) {
    final Controller c = Get.put(Controller());

    return Scaffold(
        appBar: AppBar(title: Obx(() => Text("Clicks: ${c.count}"))),
        body: Center(
            child: ElevatedButton(
                child: Text("Go to Other"), onPressed: () => Get.to(Other()))),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add), onPressed: c.increment));
  }
}

class Other extends StatelessWidget {
  final Controller c = Get.find();
  @override
  Widget build(context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Hello con de"),
        ),
        body: Center(
            child: Text(
          "${c.count}",
          style: TextStyle(fontSize: 40),
        )));
  }
}

class Controller extends GetxController {
  var count = 0.obs;
  increment() => count++;
}
