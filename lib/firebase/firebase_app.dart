import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lab_android/firebase/firebase_data.dart';
import 'package:lab_android/firebase/firebase_detail.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lab_android/firebase/widget_connect_firebase.dart';

import 'dialogs.dart';

class FirebaseApp extends StatefulWidget {
  const FirebaseApp({Key? key}) : super(key: key);

  @override
  State<FirebaseApp> createState() => _FirebaseAppState();
}

class _FirebaseAppState extends State<FirebaseApp> {
  @override
  Widget build(BuildContext context) {
    return MyFirebaseConnect(builder: (context) => PageSVs(),
        connectingMessage: "quay deu quay deu quay deu",
        errorMessage: "Loi");
  }
}

class PageSVs extends StatelessWidget {
  BuildContext? dialogContext;
  PageSVs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Danh sách sinh viên"),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PageSVDetail(xem: false),),
            ),
            icon: Icon(Icons.add_circle_outline, color: Colors.white,),
          ),
        ],
      ),
      body: StreamBuilder<List<SinhVienSnapshot>>(
        stream: SinhVienSnapshot.getALL(),
        builder: (context, snapshot) {
          if(snapshot.hasError){
            print(snapshot.error);
            return Center(
              child: Text ("Lỗi hiển thị", style: TextStyle(color: Colors.red),),
            );
          }
          else
          if(!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );
          else {
            return ListView.separated(
                separatorBuilder: (context, index) => Divider(thickness: 1.5,),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  dialogContext = context;
                  return Slidable(
                    child: ListTile(
                      leading: Text("${snapshot.data![index].sinhVien!.id}",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      title: Text("${snapshot.data![index].sinhVien!.ten}"),
                      subtitle: Text("${snapshot.data![index].sinhVien!.lop}"),
                    ),
                    startActionPane: ActionPane(
                      motion: ScrollMotion(),
                      children: [],
                    ),
                    endActionPane: ActionPane(
                      motion: ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) => Navigator.push(
                              context,
                              MaterialPageRoute(builder:
                                  (context) => PageSVDetail(sinhVienSnapshot: snapshot.data![index] ,xem: true),)),
                          icon: Icons.details,
                          foregroundColor: Colors.green,
                        ),
                        SlidableAction(
                          onPressed: (context) => Navigator.push(
                              context,
                              MaterialPageRoute(builder:
                                  (context) => PageSVDetail(sinhVienSnapshot: snapshot.data![index] ,xem: false),)),
                          icon: Icons.edit,
                          foregroundColor: Colors.blue,
                        ),
                        SlidableAction(
                          onPressed: (context) {
                            // _xoa(dialogContext!, snapshot.data![index]);
                          },
                          icon: Icons.delete_forever,
                          foregroundColor: Colors.red,
                          backgroundColor: Colors.red[50]!,
                        ),
                      ],
                    ),
                  );
                }
            );
          }
        },
      ),
    );
  }

  void _xoa(BuildContext context, SinhVienSnapshot svs) async {
    String? confirm = await showConfirmDialog(context, 'Confirm Delete ${svs!.sinhVien!.ten}?');
    if(confirm == 'ok'){
      FirebaseStorage _storage = FirebaseStorage.instance;
      Reference reference = _storage.ref().child("images").child("anh_${svs!.sinhVien!.id}.jpg");
      reference.delete();
      svs!.xoa().whenComplete(() => showSnackBar(context, "Deleted successful", 3)).onError(
              (error, stackTrace) => (error, stackTrace) {
            showSnackBar(context, "Deleted unsuccessful", 3);
            return Future.error("Deleted unsuccessful");
          });
    }
  }
}
