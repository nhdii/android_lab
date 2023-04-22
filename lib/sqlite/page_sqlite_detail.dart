import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab_android/sqlite/provider_data.dart';
import 'package:lab_android/sqlite/sqlite_data.dart';
import 'package:provider/provider.dart';

class PageUserSQLiteDetail extends StatefulWidget {
  bool? xem;
  User? user;
  PageUserSQLiteDetail({Key? key, this.xem, this.user}) : super(key: key);

  @override
  State<PageUserSQLiteDetail> createState() => _PageUserSQLiteDetailState();
}

class _PageUserSQLiteDetailState extends State<PageUserSQLiteDetail> {
  bool? xem;
  User? user;
  String title = 'User Info';
  String buttonTitle = 'Close';
  TextEditingController txtTen = TextEditingController();
  TextEditingController txtPhone = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          TextField(
            controller: txtTen,
            decoration: const InputDecoration(
              label: Text('Name:'),
            ),
          ),
          const SizedBox(height: 10,),
          TextField(
            controller: txtPhone,
            decoration: const InputDecoration(
              label: Text('Phone:'),
            ),
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 10,),
          TextField(
            controller: txtEmail,
            decoration: const InputDecoration(
              label: Text('Email:'),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                  onPressed: () => _capNhat(context),
                  child: Text(buttonTitle)
              ),
              const SizedBox(height: 10,),
              xem == true ? const SizedBox(height: 1,):
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Close'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void initState(){
    //TODO: implement innitState
    super.initState();
    xem = widget.xem;
    user = widget.user;

    if(user != null){
      if(xem != true){
        buttonTitle = 'Update';
        title = 'Infomation edited';
      }
      txtTen.text = user!.name!;
      txtPhone.text = user!.phone!;
      txtEmail.text = user!.email!;
    }
    else{
      buttonTitle = 'Add';
      title = 'Add User';
    }
  }

  @override
  void dispose(){
    //TODO: implement dispose
    super.dispose();
    txtTen.dispose();
    txtPhone.dispose();
    txtEmail.dispose();
  }

  _capNhat(BuildContext context) async{
    if(xem == true){
      Navigator.of(context).pop();
    }else{
      DatabaseProvider provider = context.read<DatabaseProvider>();
      User nUser = User(
        name: txtTen.text,
        phone: txtPhone.text,
        email: txtEmail.text,
      );
      if(user == null){
        int id = -1;
        id = await provider.insertUser(nUser);
        if(id > 0 ){
          showSnackBar(context, '${nUser!.name!} ADDED',3);
        }else{
          showSnackBar(context, 'CANNOT ADD ${nUser!.name!}',3);
        }
      }else{
        int count = 0;
        count = await provider.updateUser(nUser, user!.id!);
        if(count > 0){
          showSnackBar(context, '${user!.name!} UPDATED',3);
        }
        else{
          showSnackBar(context, 'UPDATED CANCEL',3);
        }
      }
    }
  }

  void showSnackBar(BuildContext context, String message, int second) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: second),
      ),
    );
  }
}
