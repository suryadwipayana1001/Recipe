import 'package:flutter/material.dart';

class DrawerProvider with ChangeNotifier {
  GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();

  int _selectedIndex = 0;
  bool _introduction = false;
  bool _types = false;
  bool _features = false;
  bool _frequently = false;
  bool _troubleshooting = false;
  String _drawerType = "";
  set setSelectedIndex(val) {
    _selectedIndex = val;
    notifyListeners();
  }

  set setIntroduction(bool val) {
    _introduction = val;
    notifyListeners();
  }

  set setTypes(bool val) {
    _types = val;
    notifyListeners();
  }

  set setFeatures(bool val) {
    _features = val;
    notifyListeners();
  }

  set setFrequently(bool val) {
    _frequently = val;
    notifyListeners();
  }

  set setTroubleShooting(bool val) {
    _troubleshooting = val;
    notifyListeners();
  }

  set setDrawerType(String val) {
    _drawerType = val;
    notifyListeners();
  }

  int get selectedIndex => _selectedIndex;
  bool get introduction => _introduction;
  bool get types => _types;
  bool get features => _features;
  bool get frequently => _frequently;
  bool get troubleShooting => _troubleshooting;
  String get drawerType => _drawerType;

  void toogleDrawer() {
    drawerKey.currentState!.isDrawerOpen
        ? drawerKey.currentState!.closeDrawer()
        : drawerKey.currentState!.openDrawer();
  }
}
