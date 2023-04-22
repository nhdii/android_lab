import 'package:flutter/material.dart';

List<String> slideImg = [
  "https://picsum.photos/id/1018/1000/600",
  "https://picsum.photos/id/1025/1000/600",
  "https://picsum.photos/id/1039/1000/600",
  "https://picsum.photos/id/1041/1000/600",
  "https://picsum.photos/id/1050/1000/600",
  "https://picsum.photos/id/1074/1000/600",
  "https://picsum.photos/id/1079/1000/600",
  "https://picsum.photos/id/1084/1000/600",
  "https://picsum.photos/id/1080/1000/600",
  "https://picsum.photos/id/109/1000/600",
  "https://picsum.photos/id/111/1000/600",
  "https://picsum.photos/id/112/1000/600",
  "https://picsum.photos/id/113/1000/600",
  "https://picsum.photos/id/114/1000/600",
  "https://picsum.photos/id/115/1000/600",
  "https://picsum.photos/id/116/1000/600",
  "https://picsum.photos/id/118/1000/600",
  "https://picsum.photos/id/119/1000/600",
  "https://picsum.photos/id/12/1000/600",
  "https://picsum.photos/id/120/1000/600",
];

class PageGridView extends StatelessWidget {
  const PageGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GridView Page"),
      ),
      body: GridView.extent(
        maxCrossAxisExtent: 300,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        children: List.generate(
            slideImg.length, 
            (index) => Container(
              child: Image.network(slideImg[index], fit: BoxFit.cover,),
            )
        ).toList(),
      ),
    );
  }
}
