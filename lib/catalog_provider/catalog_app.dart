//package lib
// ignore_for_file: unnecessary_string_interpolations, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lab_android/catalog_provider/cart_page.dart';
import 'package:lab_android/catalog_provider/cart_page1.dart';
import 'package:lab_android/catalog_provider/provider_catalog.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

//class
class AppCatalog extends StatelessWidget {
  const AppCatalog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Catalog(),
      lazy: true,
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PageCatalog(),
      ),
    );
  }
}

class PageCatalog extends StatelessWidget {
  const PageCatalog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Danh sach san pham"),
        actions: [
          Consumer<Catalog>(
            builder: (context, value, child) => GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Cart_Page(),
                    )
                );
                print("${value.slMHTrongGH}");
              },
              child: badges.Badge(
                position: badges.BadgePosition.topEnd(top: 0, end: 0),
                badgeAnimation: const badges.BadgeAnimation.scale(),
                showBadge: value.slMHTrongGH>0,
                badgeContent: Text(
                  "${value.slMHTrongGH}",
                  style: const TextStyle(fontSize: 12),
                ),
                child: Icon(
                  Icons.shopping_cart_outlined,
                  size: 40,
                ),
              ),
            ),
          )
        ],
      ),
      body: Consumer<Catalog>(
        builder: (context, value, child) {
          var list = value.matHangs;
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) => Container(
              color: index % 2 == 0 ? Colors.red : Colors.white,
              child: ListTile(
                  contentPadding: const EdgeInsets.all(10),
                  leading: const Icon(
                    Icons.shopping_cart,
                    color: Colors.green,
                    size: 40,
                  ),
                  title: Center(child: Text("${list[index].tenMH}")),
                  subtitle: Center(
                      child: Text(
                    "${list[index].gia}đ",
                    style: TextStyle(color: Colors.red[300]),
                  )
                  ),
                  trailing: value.kiemtraMHCoTrongGH(index) == true
                      ? const Icon(
                          Icons.check,
                          color: Colors.blue,
                        )
                      : Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.blue,
                          ),
                          child: IconButton(
                              onPressed: () {
                                value.themVaoGioHang(index);
                              },
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                              )
                          ),
                        )
              ),
            ),
          );
        },
      ),
    );
  }
}
