import '../models/cuahang.dart';
import '../models/dienthoai.dart';
import '../models/hoadon.dart';

void main() {
  // Khởi tạo cửa hàng
  var cuaHang = CuaHang("Cửa hàng ABC", "123 Đường XYZ");

  // **1. Quản lý thông tin điện thoại**
  print("1. Quản lý thông tin điện thoại:");
  try {
    var dt1 = DienThoai("DT-001", "iPhone 15", "Apple", 20000000, 25000000, 10, true);
    var dt2 = DienThoai("DT-002", "Galaxy S23", "Samsung", 15000000, 20000000, 5, true);
    cuaHang.themDienThoai(dt1);
    cuaHang.themDienThoai(dt2);

    // Hiển thị danh sách
    print("\nDanh sách điện thoại:");
    for (var dt in cuaHang.danhSachDienThoai) {
      dt.hienThiThongTin();
    }

    // Cập nhật thông tin
    print("\nCập nhật thông tin điện thoại:");
    cuaHang.capNhatDienThoai("DT-001", DienThoai("DT-001", "iPhone 15 Pro", "Apple", 22000000, 27000000, 8, true));
    cuaHang.danhSachDienThoai[0].hienThiThongTin();
  } catch (e) {
    print("Lỗi: $e");
  }

  // **2. Quản lý hóa đơn**
  print("\n2. Quản lý hóa đơn:");
  try {
    var hd1 = HoaDon("HD-001", DateTime.now(), cuaHang.danhSachDienThoai[0], 2, 25000000, "Nguyễn Văn A", "0912345678");
    cuaHang.themHoaDon(hd1);

    print("\nDanh sách hóa đơn:");
    for (var hd in cuaHang.danhSachHoaDon) {
      print("- Hóa đơn ${hd.maHoaDon}: ${hd.soLuongMua} x ${hd.giaBanThucTe} = ${hd.tinhTongTien()}");
    }

    print("\nKiểm tra tồn kho:");
    cuaHang.thongKeTonKho();
  } catch (e) {
    print("Lỗi: $e");
  }

  // **3. Thống kê báo cáo**
  print("\n3. Thống kê báo cáo:");
  try {
    var doanhThu = cuaHang.tinhTongDoanhThu(DateTime.now().subtract(Duration(days: 30)), DateTime.now());
    var loiNhuan = cuaHang.tinhTongLoiNhuan(DateTime.now().subtract(Duration(days: 30)), DateTime.now());

    print("Doanh thu trong 30 ngày: $doanhThu");
    print("Lợi nhuận trong 30 ngày: $loiNhuan");

    print("\nBáo cáo tồn kho:");
    cuaHang.thongKeTonKho();
  } catch (e) {
    print("Lỗi: $e");
  }
}
