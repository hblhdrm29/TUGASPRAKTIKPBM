import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';
import 'main.dart';
import 'halu.dart';
import 'db_helper.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _selectedTheme = ThemeData.dark().copyWith(primaryColor: Colors.black);

  ThemeData light = ThemeData.light().copyWith(primaryColor: Colors.white);
  ThemeData dark = ThemeData.dark().copyWith(primaryColor: Colors.black);

  ThemeProvider({bool? isDarkMode}){
    _selectedTheme = isDarkMode! ? dark : light;
  }

  Future<void> swapTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (_selectedTheme == dark) {
      _selectedTheme = light;
      prefs.setBool("isDarkTheme", false);
      print(prefs.getBool("isDarkTheme"));
      print("LIGHT MODE");
    } else {
      _selectedTheme = dark;
      prefs.setBool("isDarkTheme", true);
      print(prefs.getBool("isDarkTheme"));
      print("DARK MODE");
    }
    notifyListeners();
  }

  ThemeData get getTheme => _selectedTheme;
}

class DbProvider extends ChangeNotifier {
  late DatabaseHelper _dbHelper;

  List<Halu> _halus = [];

  List<Halu> get halus => _halus;

  DbProvider() {
    _dbHelper = DatabaseHelper();
    _getAllHalus();
  }
  

  void _getAllHalus() async {
    _halus = await _dbHelper.gethalus();
    notifyListeners();
  }

  Future<void> addHalus(Halu halu) async {
    await _dbHelper.insertHalu(halu);
    _getAllHalus();
  }

  Future<void> deleteHalus(int id) async {
    await _dbHelper.deleteHalu(id);
    _getAllHalus();
  }

  Future<void> updateHalus(Halu halu) async {
    await _dbHelper.updateHalu(halu);
    _getAllHalus();
  }
}