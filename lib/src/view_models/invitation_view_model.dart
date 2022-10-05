import 'package:sqlite_practice/src/model/invitaion_model.dart';

class InvitationViewModel {
  factory InvitationViewModel() => _this ??= InvitationViewModel._();
  InvitationViewModel._();
  static InvitationViewModel? _this;

  final List<InvCardModel> _list = [];

  void addList(InvCardModel model) {
    _list.add(model);
  }

  void deleteList(id) {
    _list.removeWhere((element) => element.id == id);
  }

  get list => _list;
}
