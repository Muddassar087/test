import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:sqlite_practice/src/model/card_model.dart';
import 'package:sqlite_practice/src/utills/db_helper.dart';
import 'package:sqlite_practice/src/view_models/guest_view_model.dart';

class GuestController with ChangeNotifier {
  GuestController._()
      : _guestViewModel = GuestViewModel(),
        _repository = Repository();

  /// private static instance for this controller
  factory GuestController() => _this ??= GuestController._();
  static GuestController? _this;
  final GuestViewModel? _guestViewModel;
  final Repository? _repository;

  void addGuest(String name) {
    CardModel m = _guestViewModel!.addGuest(name);
    _repository!.add(m);
    notifyListeners();
  }

  Future<List<CardModel>> getList() async {
    if (_guestViewModel!.glist == null) {
      _guestViewModel!.list = await _repository!.read();
      await Future.delayed(const Duration(seconds: 1));
    }
    return _guestViewModel!.glist!;
  }

  void updateFilledStatus(id) {
    _guestViewModel!.updateFilledStatus(id);
    notifyListeners();
  }

  void deleteGuest(id) {
    _guestViewModel!.delete(id);
    _repository!.delete(id);
    notifyListeners();
  }

  void updateGuest(id, name) {
    CardModel model = _guestViewModel!.updateGuest(id, name);
    _repository!.update(model);
    notifyListeners();
  }
}
