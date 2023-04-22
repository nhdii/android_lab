import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';


class SinhVien{
  String? id, ten, lop, nam_sinh, que_quan, anh;

  SinhVien({
    required this.id,
    required this.ten,
    this.lop,
    this.nam_sinh,
    this.que_quan,
    this.anh,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'ten': this.ten,
      'lop': this.lop,
      'nam_sinh': this.nam_sinh,
      'que_quan': this.que_quan,
      'anh': this.anh,
    };
  }

  factory SinhVien.fromJson(Map<String, dynamic> map) {
    return SinhVien(
      id: map['id'] as String,
      ten: map['ten'] as String,
      lop: map['lop'] as String,
      nam_sinh: map['nam_sinh'] as String,
      que_quan: map['que_quan'] as String,
      anh: map['anh'] as String,
    );
  }
}

class SinhVienSnapshot{
  SinhVien? sinhVien;   //du lieu
  DocumentReference? documentReference;   //nay` se tham chieu voi tung document tren firebase

  SinhVienSnapshot({
    required this.sinhVien,
    required this.documentReference,
  });

  //lam viec voi du lieu bat dong bo thi chung ta phai co Future
  //trong DocumentSnapshot se gom 2 thanh phan la data va reference
  factory SinhVienSnapshot.fromSnapshot(DocumentSnapshot docSnapSV){
    return SinhVienSnapshot(
        sinhVien: SinhVien.fromJson(docSnapSV.data() as Map<String, dynamic>),
        documentReference: docSnapSV.reference);
  }

  Future<void> capNhat(SinhVien sv) async{
    return documentReference?.update(sv.toJson());
  }

  Future<void> xoa() async{
    return documentReference?.delete();
  }

  //phai co static boi vi de khoi tao 1 doi tuong moi khi goi phuogn thuc themMoi
  static Future<DocumentReference> themMoi(SinhVien sv) async{
    return  FirebaseFirestore.instance.collection("SinhVien").add(sv.toJson());
  }

  static Stream<List<SinhVienSnapshot>> dsSVTuFirebase() {
    Stream<QuerySnapshot> streamQS = FirebaseFirestore.instance.collection("SinhVien").snapshots();
    // chuyển Stream<QS> --> Stream<List<DS>>
    //ket qua tra ve 1 streamquerysnaphot
    Stream<List<DocumentSnapshot>> StreamListDocSnap = streamQS.map((querySn) => querySn.docs);
    //map 1: Chuyển Stream<List> --> Stream<List khác hiểu>
    //map 2: Chuyển List<DS> --> List<SVS>

    //ta map listDocSnap thi ben trong map ta bo list con docSnap
    return StreamListDocSnap.map(
            (listDocSnap) =>
            listDocSnap.map((docSnap) => SinhVienSnapshot.fromSnapshot(docSnap))
                .toList()
    );
  }

  //phuong thuc map cai gi thi phan vo nhu cu, thay doi ruot

  static Stream<List<SinhVienSnapshot>> getALL(){
    Stream<QuerySnapshot> streamQS = FirebaseFirestore.instance.collection("SinhVien").snapshots();
      return streamQS.map((qs) => qs.docs.map((doc) => SinhVienSnapshot.fromSnapshot(doc)).toList());   //toList la cai map thu 2
  }

  static Future<List<SinhVienSnapshot>> dsSVTuFirebaseOneTime() async{
    QuerySnapshot qs = await FirebaseFirestore.instance.collection("SinhVien").get();
    return qs.docs.map((doc) => SinhVienSnapshot.fromSnapshot(doc)).toList();
  }

}