import 'package:flutter/material.dart';
import 'package:lab_android/on_thi/qlweather.dart';
import 'package:provider/provider.dart';

class WeatherPage extends StatelessWidget {
  WeatherPage({Key? key}) : super(key: key);

  QLThoiTiet qlThoiTiet = QLThoiTiet();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => QLThoiTiet(),
      lazy: true,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Page Weather"),
        ),
        body: Consumer<QLThoiTiet>(
          builder: (context, value, child) {
            var list = value.listThoiTiet;
            return Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Image.asset(
                    "assets/Images/sun.png",
                    width: 250,
                    height: 200,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    "26",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    "Clear",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 35),
                  ),
                  const Text(
                    "Saturday, 02 April",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    color: Colors.grey[200],
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 50,
                          height: 100,
                        ),
                        Column(
                          children: [
                            Image.asset(
                              "assets/Images/sun.png",
                              width: 50,
                              height: 40,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text("26"),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text("Wind")
                          ],
                        ),
                        const SizedBox(
                          width: 70,
                        ),
                        Column(
                          children: [
                            Image.asset(
                              "assets/Images/sun.png",
                              width: 50,
                              height: 40,
                            ),
                            const Text("50km/h"),
                            const Text("Humidity")
                          ],
                        ),
                        const SizedBox(
                          width: 70,
                        ),
                        Column(
                          children: [
                            Image.asset(
                              "assets/Images/sun.png",
                              width: 50,
                              height: 40,
                            ),
                            const Text("50km/h"),
                            const Text("Rain")
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                        onPressed: () {
                          ThoiTiet thoiTiet = ThoiTiet(
                            nhietDo: 25,
                            gio: 50,
                            doAm: 80,
                            mua: false,
                            ngay: DateTime.now(),
                          );
                          QLThoiTiet qlThoiTiet = Provider.of<QLThoiTiet>(context, listen: false);
                          qlThoiTiet.addThoiTiet(thoiTiet);
                        },
                        child: const Text("Save")),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
