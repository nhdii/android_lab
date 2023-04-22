import 'dart:math';
import 'package:flutter/material.dart';

List<String> fruits = [
  "Nho", "Chom chom", "Mang cut", "Dua hau", "Dau tay", "Cam", "Quyt", "Buoi",
  "Oi", "Man", "Thanh long", "Me", "So ri", "Mit", "Dua leo", "Chanh", "Ot", "Bau",
  "Bi", "Me Ngot", "Mang Cau", "Chuoi", "Vu Sua"
];

class PageListView extends StatelessWidget {
  const PageListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ban trai cay"),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => ListTile(
          leading: Text("${index+1}"),
          title: Text(fruits[index]),
          trailing: Text("${Random().nextInt(100)} kg"),
          subtitle: Text("Gia: ${Random().nextInt(100)*1000} d"),
        ),
        separatorBuilder: (context, index) => Divider(thickness: 2,),
        itemCount: fruits.length,
      ),
    );
  }
}