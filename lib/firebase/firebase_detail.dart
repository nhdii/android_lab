import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lab_android/firebase/firebase_data.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'dialogs.dart';

class PageSVDetail extends StatefulWidget {
  SinhVienSnapshot? sinhVienSnapshot;
  bool? xem;
  PageSVDetail({Key? key, this.sinhVienSnapshot, required this.xem}) : super(key: key);

  @override
  State<PageSVDetail> createState() => _PageSVDetailState();
}

class _PageSVDetailState extends State<PageSVDetail> {
  SinhVienSnapshot? svs;
  bool _imageChange = false; // Nếu chọn ảnh thì có giá trị là trie
  XFile? _xImage; // Khi chọn xong ảnh thì thông tin của ảnh sẽ được lưu trong biến này
  bool? xem;
  BuildContext? dialogContext;
  String buttonLabel = "Thêm";
  String title = "Thêm sinh viên mới";
  TextEditingController txtAnh = TextEditingController();
  TextEditingController txtId = TextEditingController();
  TextEditingController txtTen = TextEditingController();
  TextEditingController txtLop = TextEditingController();
  TextEditingController txtNamSinh = TextEditingController();
  TextEditingController txtQueQuan = TextEditingController();
  @override
  Widget build(BuildContext context) {
    dialogContext = context;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: _imageChange ? Image.file(File(_xImage!.path),):
                svs?.sinhVien!.anh != null ? Image.network(svs!.sinhVien!.anh!) : null,
              ),
              const SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(width: 20,),
                  ElevatedButton(
                      onPressed: xem != true ? () => _chonAnh(context) : null,
                      child: const Icon(Icons.image)),
                ],
              ),
              TextField(
                controller: txtId,
                decoration: InputDecoration(
                  label: Text("ID:"),
                ),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: txtTen,
                decoration: InputDecoration(
                  label: Text("Tên:"),
                ),
                keyboardType: TextInputType.text,
              ),
              TextField(
                controller: txtLop,
                decoration: InputDecoration(
                  label: Text("Lớp:"),
                ),
                keyboardType: TextInputType.text,
              ),
              TextField(
                controller: txtNamSinh,
                decoration: InputDecoration(
                  label: Text("Năm sinh:"),
                ),
                keyboardType: TextInputType.text,
              ),
              TextField(
                controller: txtQueQuan,
                decoration: InputDecoration(
                  label: Text("Quê quán:"),
                ),
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        if(xem == true)
                          Navigator.pop(context);
                        else{
                          _capNhat(context);
                          Navigator.pop(context);
                        }
                      },
                      child: Text(buttonLabel)),
                  SizedBox(width: 10,),
                  xem == true?
                  SizedBox(width: 1,):
                  ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("Huỷ")),
                  SizedBox(width: 10,),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    //TODO: implement initSate
    super.initState();
    svs = widget.sinhVienSnapshot;
    xem = widget.xem;
    if(svs != null){
      txtId.text = svs!.sinhVien!.id??"";
      txtTen.text = svs!.sinhVien!.ten??"";
      txtLop.text = svs!.sinhVien!.lop??"";
      txtQueQuan.text = svs!.sinhVien!.que_quan??"";
      txtNamSinh.text = svs!.sinhVien!.nam_sinh??"";
      if(xem! == true){
        title = "Thông tin sinh viên";
        buttonLabel = "Close";
      }else{
        title = "Cập nhật sinh viên";
        buttonLabel = "Updated";
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    txtId.dispose();
    txtTen.dispose();
    txtLop.dispose();
    txtNamSinh.dispose();
    txtQueQuan.dispose();
  }

  _chonAnh(BuildContext context) async {
    _xImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(_xImage!=null){
      setState(() {
        _imageChange = true;
      });
    }
  }

  _capNhat(BuildContext context) async {
    showSnackBar(context, "Đang cập nhật dữ liệu...", 30);
    SinhVien sv = SinhVien(
      id: txtId.text,
      ten: txtTen.text,
      lop: txtLop.text,
      que_quan: txtQueQuan.text,
      nam_sinh: txtNamSinh.text,
      anh: null,
    );
    if(_imageChange){//co su thay doi anh
      FirebaseStorage _storage = FirebaseStorage.instance;
      Reference reference = _storage.ref().child("images").child("anh_${sv.id}.jpg");

      UploadTask uploadTask = await _uploadTask(reference, _xImage!);
      uploadTask.whenComplete(() async{
        sv.anh = await reference.getDownloadURL();
        if(svs != null)
          _capNhatSV(svs, sv);
        else
          _themSV(sv);
      }).onError((error, stackTrace) {
        return Future.error("Lỗi xảy ra");
      });
    }
    else{//neu k co su thay doi anh
      if(svs != null){
        sv.anh = svs!.sinhVien!.anh;
        _capNhatSV(svs, sv);
      }
      else
        _themSV(sv);
    }
  }

  Future<UploadTask> _uploadTask(Reference reference, XFile xImage) async {
    final metadata = SettableMetadata(
        contentType: 'images/jpg',
        customMetadata: {'picker-file-path': xImage.path});
    UploadTask uploadTask;
    if(kIsWeb)
      uploadTask = reference.putData(await xImage.readAsBytes(), metadata);
    else
      uploadTask = reference.putFile(File(xImage.path), metadata);
    return Future.value(uploadTask);
  }

  _capNhatSV(SinhVienSnapshot? svs, SinhVien sv) {
    svs!.capNhat(sv).whenComplete(() =>
        showSnackBar(context, "Cập nhật dữ liệu thành công", 3))
        .onError((error, stackTrace) =>
        showSnackBar(context, "Cập nhật dữ liệu thành công", 3));
  }

  _themSV(SinhVien sv) {
    SinhVienSnapshot.themMoi(sv).whenComplete(() =>
        showSnackBar(context, "Thêm dữ liệu thành công", 3))
        .onError((error, stackTrace) {
      showSnackBar(context, "Thêm dữ liệu không thành công", 3);
      return Future.error("Lỗi khi thêm");
    });
  }
}
