import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lab_android/authentication/page_home.dart';
import 'package:lab_android/firebase/widget_connect_firebase.dart';
class LoginApp extends StatelessWidget {
  const LoginApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyFirebaseConnect(
        builder: (context) => PageLogin(),
        connectingMessage: "Connecting...",
        errorMessage: "Loi");
  }
}

class PageLogin extends StatefulWidget {
  const PageLogin({Key? key}) : super(key: key);

  @override
  State<PageLogin> createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async{
                  var user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: "zduy116@gmail.com",
                      password: "123456");
                  if(user != null){
                    showSnackBar(context, "Tao thanh cong user: ${user.user?.email}");
                  }
                },
                child: Text("Dang ky Email/Pass")
            ),
            ElevatedButton(
                onPressed: () async{
                  var user = await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: "zduy116@gmail.com", password: "123456");
                  if(user!=null){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => PageHome(),)
                    );
                  }
                },
                child: Text("Dang nhap Email/Pass")
            ),
            ElevatedButton(
                onPressed: () async{
                  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
                  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

                },
                child: Text("Dang nhap bang Google")
            ),
          ],
        ),
      ),
    );
  }
}

showSnackBar(BuildContext context, String message){
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message)),
  );
}