void checkInput(dynamic input) {
  if (input is String) {
    print(input.toUpperCase());
  } else if (input is int) {
    print("Các ước số của $input là:");
    for (int i = 1; i <= input; i++) {
      if (input % i == 0) {
        print(i);
      }
    }
  } else if (input is double) {
    print("Phần nguyên của $input là: ${input.toInt()}");
  } else {
    print("Kiểu dữ liệu không được hỗ trợ!");
  }
}

void main()
{
  checkInput(25.982);
}
