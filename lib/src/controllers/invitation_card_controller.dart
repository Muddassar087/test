import 'package:sqlite_practice/src/model/card_model.dart';
import 'package:sqlite_practice/src/model/domain/inv_card_list_holder.dart';
import 'package:sqlite_practice/src/model/invitaion_model.dart';

class InvitationCardController {
  factory InvitationCardController() => _this ??= InvitationCardController._();
  static InvitationCardController? _this;
  InvitationCardController._() : _cardListolder = InvCardListolder();
  InvCardListolder? _cardListolder;

  void addList(CardModel m) {
    InvCardModel model = InvCardModel(m.name, m.id, m.color);
    _cardListolder!.addList(model);
  }

  List<InvCardModel> getList() {
    return _cardListolder!.list;
  }

  updateList(filled, id) {
    print(filled);
    if (!filled) {
      _cardListolder!.deleteList(id);
    }
  }
}
