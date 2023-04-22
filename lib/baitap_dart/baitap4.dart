import 'dart:math';

void main()
{
  List<String> s = ["Ca", "Ca Map", "Chuoi", "Dua"];
  List<int> lens = s.map((e) => e.length).toList();
  print(s);
  print(lens);
  lens.forEach((element) {
    print(pow(element, 2));
  });
}