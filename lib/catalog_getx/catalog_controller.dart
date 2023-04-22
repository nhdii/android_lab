import 'package:get/get.dart';
import '../catalog_provider/provider_catalog.dart';

class CatalogController extends GetxController{
  final _matHangs = <MatHang>[
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
  ].obs;  //khai bao bien RXList<MatHang> cua ds mat hang

  final _gioHang = <int>[].obs;   //Khai bao bien RXListInt<giohang>
  List<MatHang> get matHangs => _matHangs.value;
  List<int> get gioHang => _gioHang.value;
  int get slMHTrongGH => _gioHang.value.length;

  int get tienMuaHang {
    return _gioHang.fold(0, (total, index) => total + _matHangs[index].gia);
  }

  void themVaoGioHang(int index){
    gioHang.add(index);
    _gioHang.refresh();
    _matHangs.refresh();
  }

  void XoaMatHangKhoiGH(int index){
    gioHang.removeAt(index);
    _gioHang.refresh();
    _matHangs.refresh();
  }

  bool kiemTraMH_TrongGH(int index){
    for(int value in gioHang)
      if(value == index)
      {
        return true;
      }
      return false;
  }
}