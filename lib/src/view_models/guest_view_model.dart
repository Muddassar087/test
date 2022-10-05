import 'dart:math';

import 'package:sqlite_practice/src/model/card_model.dart';
import 'package:sqlite_practice/src/utills/constants.dart';

class GuestViewModel {
  factory GuestViewModel() => _this ??= GuestViewModel._();
  GuestViewModel._();
  static GuestViewModel? _this;

  List<CardModel>? _list;

  List<CardModel>? get glist => _list;
  set list(List<CardModel> m) => _list = m;

  CardModel addGuest(name) {
    CardModel m = CardModel(
        name, (_list!.last.id! + 1), kColors[Random().nextInt(kColors.length)]);
    _list!.add(m);
    return m;
  }

  void updateFilledStatus(id) {
    _list!.firstWhere((element) => element.id == id).toggle();
  }

  void delete(id) {
    _list!.removeWhere((element) => element.id == id);
  }

  CardModel updateGuest(id, name) {
    CardModel m = _list!.firstWhere((element) => element.id == id);
    m.name = name;
    return m;
  }
}
