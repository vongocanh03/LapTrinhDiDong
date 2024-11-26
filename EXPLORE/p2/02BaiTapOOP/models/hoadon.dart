
import 'dienthoai.dart';

class HoaDon {
  String _maHoaDon;
  DateTime _ngayBan;
  DienThoai _dienThoai;
  int _soLuongMua;
  double _giaBanThucTe;
  String _tenKhachHang;
  String _soDienThoaiKhach;

  // Constructor đầy đủ tham số
  HoaDon(
    this._maHoaDon,
    this._ngayBan,
    this._dienThoai,
    this._soLuongMua,
    this._giaBanThucTe,
    this._tenKhachHang,
    this._soDienThoaiKhach,
  ) {
    _validate();
  }

  // Getter
  String get maHoaDon => _maHoaDon;
  DateTime get ngayBan => _ngayBan;
  DienThoai get dienThoai => _dienThoai;
  int get soLuongMua => _soLuongMua;
  double get giaBanThucTe => _giaBanThucTe;
  String get tenKhachHang => _tenKhachHang;
  String get soDienThoaiKhach => _soDienThoaiKhach;

  // Setter với validation
  set maHoaDon(String maHoaDon) {
    if (maHoaDon.isNotEmpty && RegExp(r'^HD-\d+$').hasMatch(maHoaDon)) {
      _maHoaDon = maHoaDon;
    } else {
      throw ArgumentError('Mã hóa đơn không hợp lệ! Định dạng phải là "HD-XXX".');
    }
  }

  set ngayBan(DateTime ngayBan) {
    if (ngayBan.isBefore(DateTime.now())) {
      _ngayBan = ngayBan;
    } else {
      throw ArgumentError('Ngày bán không được sau ngày hiện tại!');
    }
  }

  set soLuongMua(int soLuongMua) {
    if (soLuongMua > 0 && soLuongMua <= _dienThoai.soLuongTonKho) {
      _soLuongMua = soLuongMua;
    } else {
      throw ArgumentError('Số lượng mua phải lớn hơn 0 và không vượt quá tồn kho!');
    }
  }

  set giaBanThucTe(double giaBanThucTe) {
    if (giaBanThucTe > 0) {
      _giaBanThucTe = giaBanThucTe;
    } else {
      throw ArgumentError('Giá bán thực tế phải lớn hơn 0!');
    }
  }

  set tenKhachHang(String tenKhachHang) {
    if (tenKhachHang.isNotEmpty) {
      _tenKhachHang = tenKhachHang;
    } else {
      throw ArgumentError('Tên khách hàng không được để trống!');
    }
  }

  set soDienThoaiKhach(String soDienThoaiKhach) {
    if (RegExp(r'^\d{10,11}$').hasMatch(soDienThoaiKhach)) {
      _soDienThoaiKhach = soDienThoaiKhach;
    } else {
      throw ArgumentError('Số điện thoại khách hàng không hợp lệ!');
    }
  }

  // Phương thức tính tổng tiền
  double tinhTongTien() {
    return _soLuongMua * _giaBanThucTe;
  }

  // Phương thức tính lợi nhuận thực tế
  double tinhLoiNhuanThucTe() {
    return _soLuongMua * (_giaBanThucTe - _dienThoai.giaNhap);
  }

  // Phương thức hiển thị thông tin hóa đơn
  void hienThiThongTin() {
    print('--- Thông tin hóa đơn ---');
    print('Mã hóa đơn: $_maHoaDon');
    print('Ngày bán: ${_ngayBan.toLocal()}');
    print('Tên điện thoại: ${_dienThoai.tenDienThoai}');
    print('Hãng sản xuất: ${_dienThoai.hangSanXuat}');
    print('Số lượng mua: $_soLuongMua');
    print('Giá bán thực tế: $_giaBanThucTe');
    print('Tên khách hàng: $_tenKhachHang');
    print('Số điện thoại khách: $_soDienThoaiKhach');
    print('Tổng tiền: ${tinhTongTien()}');
    print('Lợi nhuận thực tế: ${tinhLoiNhuanThucTe()}');
  }

  // Phương thức kiểm tra dữ liệu khi khởi tạo
  void _validate() {
    maHoaDon = _maHoaDon;
    ngayBan = _ngayBan;
    soLuongMua = _soLuongMua;
    giaBanThucTe = _giaBanThucTe;
    tenKhachHang = _tenKhachHang;
    soDienThoaiKhach = _soDienThoaiKhach;
  }
  
}
