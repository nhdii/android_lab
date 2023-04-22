
class SinhVien{
  String id, ten;
  String? ngaySinh, queQuan;

  SinhVien({
    required this.id,
    required this.ten,
    this.ngaySinh,
    this.queQuan,
  });

  @override
  String toString() {
    return "id: $id\nHo Ten: $ten\n Ngay Sinh: $ngaySinh\nQue Quan: $queQuan";
  }

}

class QLSV{
  List<SinhVien> _ds = [];

  List<SinhVien> get ds => _ds;
  void add(SinhVien sv){
    for(SinhVien s in ds)
    {
      if(s.id == sv.id)
      {
        return;
      }
      ds.add(sv);
    }
  }
  void inDS()
  {
    ds.forEach((element) {
      print(element.toString());
    });
  }
}

void main(){
  QLSV ql_sv = QLSV();
  ql_sv.add(SinhVien(id: "001", ten: "Hoai Duy", ngaySinh: "11/06/2002",queQuan: "Ninh Hoa"));
  ql_sv.add(SinhVien(id: "002", ten: "Truc Ly", ngaySinh: "11/06/2002",queQuan: "Ninh Hoa"));
  ql_sv.add(SinhVien(id: "003", ten: "Mai Anh", ngaySinh: "11/06/2002",queQuan: "Ninh Hoa"));
  ql_sv.add(SinhVien(id: "004", ten: "Long Nu", ngaySinh: "11/06/2002",queQuan: "Ninh Hoa"));
  ql_sv.add(SinhVien(id: "005", ten: "Phuong Cay", ngaySinh: "11/06/2002",queQuan: "Ninh Hoa"));
  ql_sv.inDS();
}