//Ham cho biet song bao nhieu nam nua de duoc 100 tuoi
int tuoi100(String name, int birthYear) {
  int currentYear = DateTime.now().year;
  int age = currentYear - birthYear;
  int yearsLeft = 100 - age;
  if (yearsLeft > 0) {
    print('$name cần sống thêm $yearsLeft năm nữa để đến tuổi 100.');
    return yearsLeft;
  } else {
    print('$name đã qua tuổi 100.');
    return 0;
  }
}

//Hamf tra ve danh sach cac so du cua cac phan tu trong phep chia cho 5
List<int> soDu(List<int> li) {
  List<int> result = [];
  for (int item in li) {
    result.add(item % 5);
  }
  return result;
}

//Ham tra ve danh sach cac phan tu xuat hien o ca 2 danh sach
List<int> commonItems(List<int> li1, List<int> li2) {
  Set<int> set1 = Set.from(li1);
  Set<int> set2 = Set.from(li2);
  List<int> common = [];
  for (int item in set1) {
    if (set2.contains(item)) {
      common.add(item);
    }
  }
  return common;
}

void main(){
  tuoi100("Nguyen Hoai Duy", 2002);
}