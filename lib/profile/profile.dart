import 'package:flutter/material.dart';

class PageMyProfile extends StatefulWidget {
  const PageMyProfile({Key? key}) : super(key: key);

  @override
  State<PageMyProfile> createState() => _PageMyProfileState();
}

class _PageMyProfileState extends State<PageMyProfile> {
  String gioiTinh = "Nam";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ignore: avoid_unnecessary_containers, sized_box_for_whitespace
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                child: Image.asset("assets/Images/avt.jpg"),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Họ Tên: ",
                style: TextStyle(fontSize: 18),
              ),
              Text("Nguyễn Hoài Duy",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue[800],
                      fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 15,
              ),

              const Text(
                "Ngày Sinh: ",
                style: TextStyle(fontSize: 18),
              ),

              const Text(
                "11/06/2002",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Giới tính: ",
                style: TextStyle(fontSize: 18),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ListTile(
                      leading: Text("Nam", style: TextStyle(fontSize: 18),),
                      title: Radio(
                        value: "Nam",
                        groupValue: gioiTinh,
                        onChanged: (value) {
                          setState(() {
                            gioiTinh = value as String;
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: ListTile(
                      leading: Text("Nữ", style: TextStyle(fontSize: 18),),
                      title: Radio(
                        value: "Nữ",
                        groupValue: gioiTinh,
                        onChanged: (value) {
                          gioiTinh = value as String;
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const Text(
                "Quê quán: ",
                style: TextStyle(fontSize: 18),
              ),
              const Text(
                "Ninh Hòa - Khánh Hòa",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 15,
              ),

              const Text(
                "Sở thích: ",
                style: TextStyle(fontSize: 18),
              ),
              const Text(
                "Nghe nhạc, chơi game và đi du lịch",
                style: TextStyle(
                    fontSize: 20, fontStyle: FontStyle.italic, color: Color.fromARGB(255, 108, 9, 35)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
