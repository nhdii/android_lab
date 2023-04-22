// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lab_android/catalog_provider/provider_catalog.dart';
import 'package:provider/provider.dart';

class Cart_Page extends StatefulWidget {
  const Cart_Page({Key? key}) : super(key: key);

  @override
  State<Cart_Page> createState() => _Cart_PageState();
}

class _Cart_PageState extends State<Cart_Page> {
  @override
  Widget build(BuildContext context) {
    var cart = context.watch<Catalog>();
    var matHangs = cart.matHangs;
    var gioHang = cart.gioHang;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: gioHang.length,
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  title: Text(matHangs[gioHang[index]].tenMH),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete,
                      size: 30,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      cart.xoaMatHangKhoiGH(index);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Đã xóa thành công"),duration: Duration(seconds: 2),),
                      );
                    },
                  ),
                  subtitle: Column(
                    children: [
                      Row(
                        children: [
                          const Text("Số lượng: "),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                cart.giamSoLuongMH();
                              });
                            },
                            icon: Icon(Icons.remove),
                          ),
                          Text("${cart.count}", style: TextStyle(fontSize: 16)),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                cart.tangSoLuongMH();
                              });
                            },
                            icon: Icon(Icons.add),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Tổng tiền: "),
                Text(
                  "${cart.tienMuaHang}đ",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(width: 20,),
                ElevatedButton(
                    onPressed: () {
                      cart.gioHang.clear();
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
      ),
    );
  }
}
