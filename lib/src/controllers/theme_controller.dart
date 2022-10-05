import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqlite_practice/src/model/theme_model.dart';

class ThemeContoller with ChangeNotifier {
  factory ThemeContoller() => _this ??= ThemeContoller._();
  ThemeContoller._() : _model = ThemeModel();
  static ThemeContoller? _this;
  final ThemeModel? _model;

  void toggleTheme() {
    _model!.toggle();
    notifyListeners();
  }

  void light() {
    _model!.light = true;
    notifyListeners();
  }

  void dark() {
    _model!.light = false;
    notifyListeners();
  }

  bool isLight() {
    return _model!.light;
  }
}
