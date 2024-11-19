import 'dart:io';
import 'dart:math';

void main() {
  double a = 0, b = 0, c = 0;

  // Nhập hệ số a (a khác 0)
  do {
    stdout.write('Nhập hệ số a (a khác 0): ');
    String? inputA = stdin.readLineSync();
    if (inputA != null) {
      a = double.tryParse(inputA) ?? 0;
    }
    if (a == 0) {
      print('Hệ số a phải khác 0. Vui lòng nhập lại.');
    }
  } while (a == 0);

  // Nhập hệ số b
  stdout.write('Nhập hệ số b: ');
  String? inputB = stdin.readLineSync();
  if (inputB != null) {
    b = double.tryParse(inputB) ?? 0;
  }

  // Nhập hệ số c
  stdout.write('Nhập hệ số c: ');
  String? inputC = stdin.readLineSync();
  if (inputC != null) {
    c = double.tryParse(inputC) ?? 0;
  }

  // Hiển thị phương trình
  print('\nPhương trình: ${a}x^2 + ${b}x + ${c} = 0');

  // Gọi hàm tính và in nghiệm
  printRoots(a, b, c);
}

// Hàm tính và in nghiệm của phương trình bậc hai
void printRoots(double a, double b, double c) {
  double delta = b * b - 4 * a * c;

  if (delta < 0) {
    print('Phương trình vô nghiệm.');
  } else if (delta == 0) {
    double root = -b / (2 * a);
    print('Phương trình có nghiệm kép: x = $root');
  } else {
    double root1 = (-b + sqrt(delta)) / (2 * a);
    double root2 = (-b - sqrt(delta)) / (2 * a);
    print('Phương trình có hai nghiệm phân biệt:');
    print('x1 = $root1');
    print('x2 = $root2');
  }
}
