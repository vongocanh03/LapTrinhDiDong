import 'dart:io';

void main() {
  int n = 0;

  // Nhập số nguyên dương từ bàn phím
  do {
    stdout.write('Nhập một số nguyên (n >= 1): ');
    String? input = stdin.readLineSync();
    if (input != null) {
      n = int.tryParse(input) ?? 0;
    }
    if (n < 1) {
      print('Số vừa nhập phải lớn hơn hoặc bằng 1. Vui lòng nhập lại.');
    }
  } while (n < 1);

  // Gọi hàm chuyển đổi sang nhị phân và in kết quả
  String binary = toBinary(n);
  print('Số nhị phân của $n là: $binary');
}

// Hàm chuyển đổi số nguyên thành nhị phân
String toBinary(int n) {
  String binary = '';
  while (n > 0) {
    binary = '${n % 2}$binary'; // Lấy phần dư và ghép vào chuỗi kết quả
    n ~/= 2; // Chia n cho 2 lấy phần nguyên
  }
  return binary;
}
