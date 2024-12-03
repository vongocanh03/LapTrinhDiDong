import 'package:flutter/material.dart';


class TemperatureConverter extends StatelessWidget {
  TemperatureConverter({super.key});

  // Tạo TextEditingController như biến tĩnh
  static final TextEditingController _celsiusController = TextEditingController();
  static final TextEditingController _fahrenheitController = TextEditingController();

  // Hàm chuyển đổi từ C sang F
  void _convertCToF() {
    if (_celsiusController.text.isNotEmpty) {
      try {
        double celsius = double.parse(_celsiusController.text);
        double fahrenheit = (celsius * 9 / 5) + 32;
        _fahrenheitController.text = fahrenheit.toStringAsFixed(2);
      } catch (e) {
        _fahrenheitController.text = 'Lỗi: Vui lòng nhập số';
      }
    } else {
      _fahrenheitController.text = '';
    }
  }

  // Hàm chuyển đổi từ F sang C
  void _convertFToC() {
    if (_fahrenheitController.text.isNotEmpty) {
      try {
        double fahrenheit = double.parse(_fahrenheitController.text);
        double celsius = (fahrenheit - 32) * 5 / 9;
        _celsiusController.text = celsius.toStringAsFixed(2);
      } catch (e) {
        _celsiusController.text = 'Lỗi: Vui lòng nhập số';
      }
    } else {
      _celsiusController.text = '';
    }
  }

  // Hàm xóa giá trị
  void _clearAll() {
    _celsiusController.clear();
    _fahrenheitController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chuyển đổi nhiệt độ'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Input độ C
            TextField(
              controller: _celsiusController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Nhiệt độ (°C)',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: _clearAll,
                ),
              ),
              onChanged: (value) => _convertCToF(),
            ),

            SizedBox(height: 20),

            Icon(
              Icons.arrow_downward,
              size: 40,
              color: Colors.blue,
            ),

            SizedBox(height: 20),

            // Input độ F
            TextField(
              controller: _fahrenheitController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Nhiệt độ (°F)',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: _clearAll,
                ),
              ),
              onChanged: (value) => _convertFToC(),
            ),

            SizedBox(height: 30),

            // Nút xóa tất cả
            ElevatedButton.icon(
              onPressed: _clearAll,
              icon: Icon(Icons.refresh),
              label: Text('Xóa tất cả'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),

            SizedBox(height: 20),

            // Container hiển thị công thức
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Text(
                    'Công thức chuyển đổi:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('°F = (°C × 9/5) + 32'),
                  Text('°C = (°F - 32) × 5/9'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}