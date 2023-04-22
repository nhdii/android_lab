// implementation_imports

import 'package:flutter/material.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});
  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drawer Page"),
        actions: <Widget>[
          IconButton(onPressed: () => {}, icon: const Icon(Icons.replay_outlined)),
        ],
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

            ListTile(
              leading: const Icon(
                Icons.inbox_rounded,
                size: 30,
              ),
              title: const Text(
                "Inbox",
                style: TextStyle(fontSize: 18),
              ),
              onTap: () => {},
            ),
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

            ListTile(
              leading: const Icon(Icons.settings, size: 30,),
              title: const Text("Setting", style: TextStyle(fontSize: 18),),
              onTap: () => {},
            ),

            ListTile(
              leading: const Icon(Icons.logout, size: 30,),
              title: const Text("Log out", style: TextStyle(fontSize: 18),),
              onTap: () => {},
            ),
          ],
        ),
      ),
    );
  }
}
