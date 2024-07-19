import 'package:shared_preferences/shared_preferences.dart'; // Import untuk Shared Preferences
import 'dart:convert'; // Import untuk mengubah data ke format JSON

class Data {
  // Membaca data dari SharedPreferences
  static Future<List<dynamic>> getData() async {
    final prefs = await SharedPreferences.getInstance();
    
    // Mengambil data dari SharedPreferences dengan key tertentu
    final String? savedData = prefs.getString('ID.NGASTURI.TUTORIAL.PREF');
    
    // Menyediakan nilai default jika data belum ada
    if (savedData == null) {
      return [];
    }

    // Mengembalikan data sebagai List dari format JSON
    return json.decode(savedData) as List<dynamic>;
  }

  // Menyimpan data ke SharedPreferences
  static Future<void> saveData(List<dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    
    // Mengubah data menjadi format JSON string sebelum disimpan
    await prefs.setString('ID.NGASTURI.TUTORIAL.PREF', json.encode(data));
  }
}
