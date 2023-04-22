import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThoiTiet {
  double nhietDo;
  double gio;
  double doAm;
  bool mua;
  DateTime ngay;

  ThoiTiet({
    required this.nhietDo,
    required this.gio,
    required this.doAm,
    required this.mua,
    required this.ngay,
  });
}

class QLThoiTiet extends ChangeNotifier {
  List<ThoiTiet> _listThoiTiet = [];

  List<ThoiTiet> get listThoiTiet => _listThoiTiet;

  void addThoiTiet(ThoiTiet thoiTiet) {
    _listThoiTiet.add(thoiTiet);
    notifyListeners();
  }
}