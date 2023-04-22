// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:lab_android/form/form_model.dart';

class PageFormMatHang extends StatelessWidget {
  PageFormMatHang({Key? key}) : super(key: key);
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  MatHang mh = MatHang();
  TextEditingController txtName = TextEditingController();
  TextEditingController txtSoLuong = TextEditingController();
  String? dropdownValue;

  //BottomNavigationBar
  int _currentIndex = 0;
  static const List<Widget> _list = <Widget>[
    Text(
      "Home Page",
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
    ),
    Text(
      "Search Page",
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
    ),
    Text(
      "Profile Page",
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formState,
          autovalidateMode: AutovalidateMode.disabled,
          child: Column(
            children: [
              TextFormField(
                controller: txtName,
                onSaved: (newValue) => mh.name = newValue,
                validator: (value) => validateString(value),
                decoration: InputDecoration(
                  labelText: "Tên mặt hàng",
                ),
              ),
              DropdownButtonFormField<String>(
                onChanged: (value) => dropdownValue = value,
                onSaved: (newValue) => mh.loaiMH = newValue,
                value: dropdownValue,
                validator: (value) => validateString(value),
                decoration: InputDecoration(labelText: "Loại mặt hàng"),
                items: loaiMHs
                    .map((loaiMH) => DropdownMenuItem<String>(
                          child: Text("${loaiMH}"),
                          value: loaiMH,
                        ))
                    .toList(),
              ),
              TextFormField(
                controller: txtSoLuong,
                keyboardType: TextInputType.number,
                onSaved: (newValue) => mh.soLuong = int.parse(newValue!),
                validator: (value) => validateSoLuong(value),
                // ignore: prefer_const_constructors
                decoration: InputDecoration(
                  labelText: "Số lượng",
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      // ignore: prefer_const_constructors
                      onPressed: () => _save(context),
                      child: Text("Save"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _save(BuildContext context) {
    if (formState.currentState!.validate()) {
      formState.currentState!.save();
      hienThiDialog(context);
    }
  }

  validateString(String? value) {
    return value == null || value.isEmpty ? "Bạn chưa nhập dữ liệu" : null;
  }

  validateSoLuong(String? value) {
    if (value == null || value.isEmpty) {
      return "Bạn chưa nhập số lượng";
    } else
      return int.parse(value) < 0 ? "Số lượng không được bé hơn 0" : null;
  }

  void hienThiDialog(BuildContext context) {
    var dialog = AlertDialog(
      title: Text("Thông báo"),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Bạn đã nhập mặt hàng: ${mh.name}"),
          Text("Loại MH: ${mh.loaiMH}"),
          Text("Số lượng: ${mh.soLuong}"),
        ],
      ),
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("OK"))
      ],
    );
    showDialog(
      context: context,
      builder: (context) => dialog,
    );
  }
}
