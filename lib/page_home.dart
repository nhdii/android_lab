import 'package:flutter/material.dart';
import 'package:lab_android/authentication/page_login.dart';
import 'package:lab_android/catalog_getx/page_catalog_app.dart';
import 'package:lab_android/catalog_provider/catalog_app.dart';
import 'package:lab_android/device_info/url_launcher.dart';
import 'package:lab_android/firebase/firebase_app.dart';
import 'package:lab_android/form/page_form_mathang.dart';
import 'package:lab_android/json_list/page_list_photo.dart';
import 'package:lab_android/layout/page_gridview.dart';
import 'package:lab_android/layout/page_listview.dart';
import 'package:lab_android/layout/tmdt.dart';
import 'package:lab_android/on_thi/weather.dart';
import 'package:lab_android/profile/profile.dart';
import 'package:lab_android/profile/profile1.dart';
import 'package:lab_android/sqlite/page_sqlite_app.dart';

class PageHome extends StatelessWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: Column(
          children: [
            buildButton(context, title: "My Profile" ,destionation: PageMyProfile()),
            buildButton(context, title: "Button NavigationBar", destionation: PageProfile()),
            buildButton(context, title: "ListView Page", destionation: PageListView()),
            buildButton(context, title: "GridView Page", destionation: PageGridView()),
            buildButton(context, title: "Form", destionation: PageFormMatHang()),
            buildButton(context, title: "TMDT", destionation: PageTMDT()),
            buildButton(context, title: "Catalog", destionation: AppCatalog()),
            buildButton(context, title: "Page List Photo", destionation: PageListPhoto()),
            buildButton(context, title: "SQLite", destionation: SQLiteApp()),
            buildButton(context, title: "Firebase", destionation: FirebaseApp()),
            buildButton(context, title: "Page Catalog GetX", destionation: PageCatalogGetX()),
            buildButton(context, title: "Phone Contact", destionation: MyHomePage(title: "Contact Phone")),
            buildButton(context, title: "Weather", destionation: WeatherPage()),
            buildButton(context, title: "Login", destionation: LoginApp()),
          ],
        ),
      ),
    );
  }

  Container buildButton(BuildContext context, {required String title, required Widget destionation}) {
    return Container(
            width: 200,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(150, 40),
              ),
              child: Text(title),
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => destionation));
              },
            ),
          );
  }
}
