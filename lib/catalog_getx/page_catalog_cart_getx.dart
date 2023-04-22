import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_android/catalog_getx/catalog_controller.dart';
class PageCatalogGetXCart extends StatelessWidget {
  const PageCatalogGetXCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: GetX<CatalogController>(
        init: Get.find<CatalogController>(),
        builder: (controller) {
          final gioHang = controller.gioHang;
          final matHang = controller.matHangs;
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: gioHang.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.delete,
                          size: 30,
                          color: Colors.blue,
                        ),
                        onPressed: () {
                          controller.XoaMatHangKhoiGH(index);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Đã xóa thành công"),duration: Duration(seconds: 2),),
                          );
                        },
                      ),
                      title: Row(
                        children: [
                          Text(matHang[gioHang[index]].tenMH,),
                          Spacer(),
                          Row(
                            children: [
                              Text(matHang[gioHang[index]].gia.toString()+ "đ"),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                color: Colors.grey[300],
                padding: const EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Spacer(),
                    const Text("Tổng tiền: "),
                    Text(
                      "${controller.tienMuaHang}đ",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(width: 20,),
                    ElevatedButton(
                        onPressed: () {

                          gioHang.clear();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Đơn hàng đã được đặt thành công"),duration: Duration(seconds: 2),),
                          );
                        },
                        child: Text("Đặt hàng")
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}