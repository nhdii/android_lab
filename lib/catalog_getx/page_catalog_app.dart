import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;
import 'package:lab_android/catalog_getx/catalog_controller.dart';
import 'package:lab_android/catalog_getx/page_catalog_cart_getx.dart';
class PageCatalogGetX extends StatelessWidget {
  PageCatalogGetX({Key? key}) : super(key: key);
  CatalogController controller = Get.put(CatalogController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog GetX"),
        actions: [
          Obx(() => GestureDetector(
            onTap: () {
              Get.to(PageCatalogGetXCart());
            },
            child: badges.Badge(
              showBadge: controller.slMHTrongGH > 0,
              badgeContent: Text(
                  "${controller.slMHTrongGH}"
              ),
              child: Icon(
                Icons.shopping_cart,
                size: 40,
              ),
              position: badges.BadgePosition.topEnd(top: -3,end: 2),
            ),
          ))
        ],
      ),
      body: GetX<CatalogController>(
        init: controller,
        builder: (controller) {
          var list = controller.matHangs;
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) => Container(
              color: index % 2 == 0 ? Colors.blue[100] : Colors.white,
              child: ListTile(
                  title: Text("${list[index].tenMH}"),
                  subtitle: Text("${list[index].gia}"),
                  leading: Text("${index + 1}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  trailing: controller.kiemTraMH_TrongGH(index) == true ? Icon(Icons.check, color: Colors.blueAccent,):
                  IconButton(
                      onPressed: () {
                        controller.themVaoGioHang(index);
                      },
                      icon: Icon(Icons.add, color: Colors.blueAccent,))
              ),
            ),
          );
        },
      ),
    );
  }
}