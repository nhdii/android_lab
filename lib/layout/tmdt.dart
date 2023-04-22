import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lab_android/layout/page_gridview.dart';

List<String> Img = [
  "assets/Images/ram1.jpg",
  "assets/Images/ram2.jpg",
  "assets/Images/ram3.jpg",
  "assets/Images/ram4.jpg",
];
int imgPos = 0;

class PageTMDT extends StatefulWidget {
  const PageTMDT({Key? key}) : super(key: key);

  @override
  State<PageTMDT> createState() => _PageTMDTState();
}

class _PageTMDTState extends State<PageTMDT> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ban RAM"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CarouselSlider.builder(
                itemCount: Img.length,
                itemBuilder: (context, index, realIndex) => Container(
                  child: Image.asset(Img[index]),
                ),
                options: CarouselOptions(
                  autoPlay: true,
                  enableInfiniteScroll: true,
                  initialPage: imgPos,
                  onPageChanged: (index, reason) {
                    setState(() {
                      imgPos = index;
                    }
                    );
                  },
                )
              ),
              SizedBox(height: 30,),

              Row(
                children: [
                  SizedBox(width: 350,),
                  Text("${imgPos+1}/${Img.length}",
                    style: TextStyle(
                      fontSize: 15, backgroundColor: Colors.grey,
                      ),
                  ),
                ],
              ),
              SizedBox(height: 30,),

              Text("[Chính hãng] Ram laptop ASUS 8G DDR4 32000GHz", style: TextStyle(fontSize: 17),),
              SizedBox(height: 20,),

              Row(
                children: [
                  Text("850.000đ ", style: TextStyle(fontSize: 18, color: Colors.red), ),
                  SizedBox(width: 10),
                  Text("125.000đ", style: TextStyle(decoration: TextDecoration.lineThrough, fontSize: 18),),
                ],
              ),
              SizedBox(height: 20,),

              Row(
                children: [
                  Text("4.8", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  Icon(Icons.star, color: Colors.yellow,),
                  Icon(Icons.star, color: Colors.yellow,),
                  Icon(Icons.star, color: Colors.yellow,),
                  Icon(Icons.star, color: Colors.yellow,),
                  Icon(Icons.star_half, color: Colors.yellow,),
                  SizedBox(width: 20,),
                  Text("Xem 100 đánh giá", style: TextStyle(color: Colors.blue),),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
