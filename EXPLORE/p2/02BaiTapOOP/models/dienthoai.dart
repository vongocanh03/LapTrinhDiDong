class DienThoai {
  String _maDienThoai;
  String _tenDienThoai;
  String _hangSanXuat;
  double _giaNhap;
  double _giaBan;
  int _soLuongTonKho;
  bool _trangThai; // true: còn kinh doanh, false: ngừng kinh doanh

  // Constructor
  DienThoai(
    this._maDienThoai,
    this._tenDienThoai,
    this._hangSanXuat,
    this._giaNhap,
    this._giaBan,
    this._soLuongTonKho,
    this._trangThai,
  );

  // Getter
  String get maDienThoai => _maDienThoai;
  String get tenDienThoai => _tenDienThoai;
  String get hangSanXuat => _hangSanXuat;
  double get giaNhap => _giaNhap;
  double get giaBan => _giaBan;
  int get soLuongTonKho => _soLuongTonKho;
  bool get trangThai => _trangThai;

  // Setter
  set maDienThoai(String maDienThoai) {
    if (maDienThoai.isNotEmpty && RegExp(r'^DT-\d+$').hasMatch(maDienThoai)) {
      _maDienThoai = maDienThoai;
    }
  }

  set tenDienThoai(String tenDienThoai) {
    if (tenDienThoai.isNotEmpty) {
      _tenDienThoai = tenDienThoai;
    }
  }

  set hangSanXuat(String hangSanXuat) {
    if (hangSanXuat.isNotEmpty) {
      _hangSanXuat = hangSanXuat;
    }
  }

  set giaNhap(double giaNhap) {
    if (giaNhap > 0) {
      _giaNhap = giaNhap;
    }
  }

  set giaBan(double giaBan) {
    if (giaBan > 0 && giaBan > _giaNhap) {
      _giaBan = giaBan;
    }
  }

  set soLuongTonKho(int soLuongTonKho) {
    if (soLuongTonKho >= 0) {
      _soLuongTonKho = soLuongTonKho;
    }
  }

  set trangThai(bool trangThai) {
    _trangThai = trangThai;
  }

  // Phương thức tính lợi nhuận dự kiến
  double tinhLoiNhuan() {
    return _giaBan - _giaNhap;
  }

  // Phương thức kiểm tra có thể bán không
  bool coTheBan() {
    return _soLuongTonKho > 0 && _trangThai;
  }

  // Phương thức hiển thị thông tin
  void hienThiThongTin() {
    print('--- Thông tin điện thoại ---');
    print('Mã điện thoại: $_maDienThoai');
    print('Tên điện thoại: $_tenDienThoai');
    print('Hãng sản xuất: $_hangSanXuat');
    print('Giá nhập: $_giaNhap');
    print('Giá bán: $_giaBan');
    print('Số lượng tồn kho: $_soLuongTonKho');
    print('Trạng thái: ${_trangThai ? "Còn kinh doanh" : "Ngừng kinh doanh"}');
    print('Lợi nhuận dự kiến: ${tinhLoiNhuan()}');
    print('Có thể bán: ${coTheBan() ? "Có" : "Không"}');
  }
}
