import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lab_android/authentication/page_login.dart';

class PageHome extends StatelessWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${FirebaseAuth.instance.currentUser?.toString()}"),
            ElevatedButton(
              onPressed: () async{
                FirebaseAuth.instance.signOut();
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                  builder: (context) => PageLogin(),),
                        (route) => false);

              },
              child: Text("Sign out"),
            ),
          ],
        ),
      ),
    );
  }
}


