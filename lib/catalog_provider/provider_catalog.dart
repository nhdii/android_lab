// ignore_for_file: prefer_final_fields

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MatHang {
  String tenMH;
  int gia;

  MatHang({
    required this.tenMH,
    required this.gia,
  });
}

class Catalog extends ChangeNotifier {
  List<MatHang> _matHangs = [
    MatHang(tenMH: "Sầu riêng", gia: 50000),
    MatHang(tenMH: "Bưởi", gia: 35000),
    MatHang(tenMH: "Xoài", gia: 25000),
    MatHang(tenMH: "Dưa hấu", gia: 30000),
    MatHang(tenMH: "Cam", gia: 18000),
    MatHang(tenMH: "Chuối", gia: 8000),
    MatHang(tenMH: "Nho", gia: 22000),
    MatHang(tenMH: "Kiwi", gia: 35000),
    MatHang(tenMH: "Mít", gia: 10000),
    MatHang(tenMH: "Mận", gia: 12000),
    MatHang(tenMH: "Dâu tây", gia: 45000),
    MatHang(tenMH: "Lê", gia: 22000),
    MatHang(tenMH: "Quýt", gia: 8000),
    MatHang(tenMH: "Ổi thơm", gia: 20000),
    MatHang(tenMH: "Dưa lưới", gia: 12000),
    MatHang(tenMH: "Táo", gia: 17000),
    MatHang(tenMH: "Dừa xiêm", gia: 15000),
    MatHang(tenMH: "Bí đỏ", gia: 9000),
    MatHang(tenMH: "Chôm chôm", gia: 45000),
    MatHang(tenMH: "Đu đủ", gia: 20000),
  ];

  List<int> _gioHang = [];

  int count = 1;

  List<MatHang> get matHangs => _matHangs;
  List<int> get gioHang => _gioHang;
  int get slMHTrongGH => _gioHang.length;
  int get tienMuaHang => _gioHang.fold(
      0,
      (previousValue, element) => previousValue + _matHangs[element].gia * count);

  void themVaoGioHang(int index) {
    if (kiemtraMHCoTrongGH(index) == true) {
      return;
    }
    _gioHang.add(index);
    notifyListeners();
  }

  void xoaMatHangKhoiGH(int index) {
    _gioHang.removeAt(index);
    notifyListeners();
  }

  bool kiemtraMHCoTrongGH(int index) {
    for (int i in _gioHang) {
      if (i == index) {
        return true;
      }
    }
    return false;
  }

  void tangSoLuongMH() {
    count++;
  }
  void giamSoLuongMH() {
    count--;
  }
}
