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

  // Tính tổng các ước số
  int sum = sumOfDivisors(n);
  print('Tổng các ước số của $n là: $sum');
}

// Hàm tính tổng các ước số của một số nguyên
int sumOfDivisors(int n) {
  int sum = 0;
  for (int i = 1; i <= n; i++) {
    if (n % i == 0) {
      sum += i; // Cộng ước số vào tổng
    }
  }
  return sum;
}
