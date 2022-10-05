import 'package:flutter/material.dart';

class InvCardModel {
  int? id;
  String? name;
  Color? color;
  InvCardModel(this.name, this.id, this.color);

  InvCardModel.fromMap(Map<String, dynamic> card)
      : id = card['id'],
        name = card['name'],
        color = Color(
            int.parse(card['color'].split('(0x')[1].split(')')[0], radix: 16));

  toMap() {
    return {"name": name, "color": color.toString()};
  }
}
