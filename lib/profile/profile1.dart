import 'package:flutter/material.dart';

class PageProfile extends StatefulWidget {
  const PageProfile({Key? key}) : super(key: key);

  @override
  State<PageProfile> createState() => _PageProfileState();
}

class _PageProfileState extends State<PageProfile> {
  String gioiTinh = "Nam";
  String phepTinh = "Cong";
  List<String> phepTinhs = ["Cong", "Tru", "Nhan", "Chia", "Tich Phan", "Dao Ham", "Biet Tuot"];

  int _currentIndex = 0;
  final tabs = [
    Container(
      child: Center(
        child: Text("Home", style: TextStyle(fontSize: 30),),
      ),
    ),
    Container(
      child: Center(
        child: Text("DRAFT", style: TextStyle(fontSize: 30),),
      ),
    ),
    Container(
      child: Center(
        child: Text("PERSON", style: TextStyle(fontSize: 30),),
      ),
    ),
    Container(
      child: Center(
        child: Text("CALENDER", style: TextStyle(fontSize: 30),),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
    ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("hoaidii"),
              accountEmail: Text("duy.nh.62cntt@ntu.edu.vn"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.green,
                child: Text(
                  "D",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            ListTile(
                leading: const Icon(
                  Icons.home_outlined, size: 30,
                ),
                title: const Text(
                    "Home",
                    style: TextStyle(fontSize: 18)),
                onTap: () => {Navigator.pop(context)}
            ),
            SizedBox(height: 15,),

            ListTile(
              leading: const Icon(
                Icons.inbox_rounded,
                size: 30,
              ),
              title: const Text(
                "Inbox",
                style: TextStyle(fontSize: 18),
              ),
              trailing: Text("10"),
              onTap: () => {},
            ),
            SizedBox(height: 15,),

            ListTile(
              leading: const Icon(
                Icons.send_rounded,
                size: 30,
              ),
              title: const Text(
                "Send",
                style: TextStyle(fontSize: 18),
              ),
              trailing: Icon(Icons.more_vert),
              onTap: () => {},
            ),
            SizedBox(height: 15,),

            ListTile(
              leading: const Icon(
                Icons.drafts_sharp,
                size: 30,
              ),
              title: const Text(
                "Drafts",
                style: TextStyle(fontSize: 18),
              ),
              onTap: () => {},
            ),
            SizedBox(height: 15,),

            ListTile(
              leading: const Icon(Icons.settings, size: 30,),
              title: const Text("Setting", style: TextStyle(fontSize: 18),),
              onTap: () => {},
            ),
            SizedBox(height: 330),
            ListTile(
              leading: const Icon(Icons.logout, size: 30,),
              title: const Text("Log out", style: TextStyle(fontSize: 18),),
              onTap: () => {},
            ),
          ],
        ),
      ),
      body: Padding(
        child: tabs[_currentIndex],
        padding: const EdgeInsets.all(8.0),
        // child: SingleChildScrollView(
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Container(
        //         width: MediaQuery.of(context).size.width,
        //         height: MediaQuery.of(context).size.height * 0.35,
        //         child: Image.asset("assets/Images/avt.jpg", fit: BoxFit.fill),
        //       ),
        //       SizedBox(height: 18,),
        //       Text("Ho Ten: "),
        //       Text("Nguyen Hoai Duy", style: TextStyle(fontSize: 20, color: Colors.blue),),
        //       SizedBox(height: 13,),
        //
        //       Text("Ngay sinh: "),
        //       Text("11/06/2002", style: TextStyle(fontSize: 20, color: Colors.blue),),
        //       SizedBox(height: 13,),
        //
        //       Row(
        //         children: [
        //           Expanded(
        //               child: ListTile(
        //                 leading: Radio(
        //                   value: "Nam",
        //                   groupValue: gioiTinh,
        //                   onChanged: (value){
        //                     setState(() {
        //                       gioiTinh = value!;
        //                     });
        //                   },
        //                 ),
        //                 title: Text("Nam"),
        //               ),
        //           ),
        //
        //           Expanded(
        //             child: ListTile(
        //               leading: Radio(
        //                 value: "Nu",
        //                 groupValue: gioiTinh,
        //                 onChanged: (value){
        //                   setState(() {
        //                     gioiTinh = value!;
        //                   });
        //                 },
        //               ),
        //               title: Text("Nu"),
        //             ),
        //           ),
        //         ],
        //       ),
        //
        //       SizedBox(height: 13,),
        //       Text("Que Quan:"),
        //       Text("Ninh Hoa - Khanh Hoa", style: TextStyle(fontSize: 18),),
        //       SizedBox(height: 13,),
        //
        //       Text("So thich: "),
        //       Text("Nghe nhac", style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),),
        //
        //       SizedBox(height: 15,),
        //       Text("Phep tinh ban gioi nhat la gi?"),
        //       DropdownButton<String>(
        //         value: phepTinh,
        //         isExpanded: true,
        //           items: phepTinhs.map(
        //             (e) => DropdownMenuItem(
        //               child: Text(e),
        //               value: e,
        //             ),
        //           ).toList(),
        //           onChanged: (value){
        //             setState(() {
        //               phepTinh = value!;
        //             }
        //             );
        //           }
        //           )
        //     ],
        //   ),
        // ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        selectedFontSize: 15,

        items:[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            backgroundColor: Colors.blue,
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inbox_rounded),
            backgroundColor: Colors.blue,
            label: 'Inbox'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              backgroundColor: Colors.blue,
              label: 'Contacts'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              backgroundColor: Colors.blue,
              label: 'Calender'
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (value){
          setState(() {
            _currentIndex = value;
          });
        },
      ),
    );
  }
}