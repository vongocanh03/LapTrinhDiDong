import 'dienthoai.dart';
import 'hoadon.dart';
class CuaHang {
  String _tenCuaHang;
  String _diaChi;
  List<DienThoai> _danhSachDienThoai = [];
  List<HoaDon> _danhSachHoaDon = [];

  // Constructor
  CuaHang(this._tenCuaHang, this._diaChi);
  // Getters
  String get tenCuaHang => _tenCuaHang;
  String get diaChi => _diaChi;  
  List<HoaDon> get danhSachHoaDon =>_danhSachHoaDon;
  List<DienThoai> get danhSachDienThoai =>_danhSachDienThoai;

  //Setters
    set tenCuaHang(String tenCuaHang) {
    if (tenCuaHang.isNotEmpty) {
      _tenCuaHang = tenCuaHang;
    }
  }
    set diaChi(String diaChi) {
    if (diaChi.isNotEmpty) {
      _diaChi = diaChi;
    }
  }
  // Thêm điện thoại mới
  void themDienThoai(DienThoai dienThoai) {
    _danhSachDienThoai.add(dienThoai);
    print("Thêm điện thoại thành công!");
  }

  // Cập nhật thông tin điện thoại
  void capNhatDienThoai(String maDienThoai, DienThoai thongTinMoi) {
    for (var dt in _danhSachDienThoai) {
      if (dt.maDienThoai == maDienThoai) {
        dt.tenDienThoai = thongTinMoi.tenDienThoai;
        dt.hangSanXuat = thongTinMoi.hangSanXuat;
        dt.giaNhap = thongTinMoi.giaNhap;
        dt.giaBan = thongTinMoi.giaBan;
        dt.soLuongTonKho = thongTinMoi.soLuongTonKho;
        dt.trangThai = thongTinMoi.trangThai;
        print("Cập nhật thông tin thành công!");
        return;
      }
    }
    print("Không tìm thấy điện thoại với mã: $maDienThoai");
  }

  // Ngừng kinh doanh điện thoại
  void ngungKinhDoanh(String maDienThoai) {
    for (var dt in _danhSachDienThoai) {
      if (dt.maDienThoai == maDienThoai) {
        dt.trangThai = false;
        print("Điện thoại mã $maDienThoai đã ngừng kinh doanh.");
        return;
      }
    }
    print("Không tìm thấy điện thoại với mã: $maDienThoai");
  }

  // Tìm kiếm điện thoại (theo mã, tên, hãng)
  List<DienThoai> timKiemDienThoai({String? ma, String? ten, String? hang}) {
    return _danhSachDienThoai.where((dt) {
      return (ma != null && dt.maDienThoai == ma) ||
          (ten != null && dt.tenDienThoai.contains(ten)) ||
          (hang != null && dt.hangSanXuat == hang);
    }).toList();
  }

  // Hiển thị danh sách điện thoại
  void hienThiDanhSachDienThoai() {
    print("--- Danh sách điện thoại ---");
    for (var dt in _danhSachDienThoai) {
      dt.hienThiThongTin();
      print("---");
    }
  }

  // Tạo hóa đơn mới
  void taoHoaDon(HoaDon hoaDon) {
    var dienThoai = _danhSachDienThoai.firstWhere(
        (dt) => dt.maDienThoai == hoaDon.dienThoai.maDienThoai,
        orElse: () => throw ArgumentError("Không tìm thấy điện thoại."));
    if (dienThoai.soLuongTonKho >= hoaDon.soLuongMua) {
      dienThoai.soLuongTonKho -= hoaDon.soLuongMua;
      _danhSachHoaDon.add(hoaDon);
      print("Tạo hóa đơn thành công!");
    } else {
      print("Số lượng tồn kho không đủ!");
    }
  }

  // Tìm kiếm hóa đơn (theo mã, ngày, khách hàng)
  List<HoaDon> timKiemHoaDon(
      {String? ma, DateTime? ngay, String? khachHang}) {
    return _danhSachHoaDon.where((hd) {
      return (ma != null && hd.maHoaDon == ma) ||
          (ngay != null && hd.ngayBan == ngay) ||
          (khachHang != null && hd.tenKhachHang.contains(khachHang));
    }).toList();
  }

  // Hiển thị danh sách hóa đơn
  void hienThiDanhSachHoaDon() {
    print("--- Danh sách hóa đơn ---");
    for (var hd in _danhSachHoaDon) {
      hd.hienThiThongTin();
      print("---");
    }
  }

  // Tính tổng doanh thu theo khoảng thời gian
  double tinhTongDoanhThu(DateTime tuNgay, DateTime denNgay) {
    return _danhSachHoaDon
        .where((hd) => hd.ngayBan.isAfter(tuNgay) && hd.ngayBan.isBefore(denNgay))
        .fold(0, (tong, hd) => tong + hd.tinhTongTien());
  }

  // Tính tổng lợi nhuận theo khoảng thời gian
  double tinhTongLoiNhuan(DateTime tuNgay, DateTime denNgay) {
    return _danhSachHoaDon
        .where((hd) => hd.ngayBan.isAfter(tuNgay) && hd.ngayBan.isBefore(denNgay))
        .fold(0, (tong, hd) => tong + hd.tinhLoiNhuanThucTe());
  }

  // Thống kê top điện thoại bán chạy
  List<DienThoai> thongKeTopBanChay(int top) {
    var thongKe = <String, int>{};
    for (var hd in _danhSachHoaDon) {
      thongKe.update(
          hd.dienThoai.maDienThoai, (sl) => sl + hd.soLuongMua,
          ifAbsent: () => hd.soLuongMua);
    }
    var topBanChay = thongKe.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    return topBanChay.take(top).map((e) => _danhSachDienThoai.firstWhere((dt) => dt.maDienThoai == e.key)).toList();
  }

  // Thống kê tồn kho
  void thongKeTonKho() {
    print("--- Thống kê tồn kho ---");
    for (var dt in _danhSachDienThoai) {
      print(
          "Điện thoại: ${dt.tenDienThoai}, Số lượng tồn kho: ${dt.soLuongTonKho}");
    }
  }
  void themHoaDon(HoaDon hd) {
    if (hd.dienThoai.soLuongTonKho >= hd.soLuongMua) {
      hd.dienThoai.soLuongTonKho -= hd.soLuongMua;
      danhSachHoaDon.add(hd);
    } else {
      throw ArgumentError("Số lượng tồn kho không đủ để tạo hóa đơn!");
    }
  }
}
