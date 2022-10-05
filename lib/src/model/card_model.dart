import 'package:flutter/material.dart';

class CardModel {
  int? id;
  String? name;
  Color? color;
  bool? filled;
  CardModel(this.name, this.id, this.color, {this.filled = false});

  CardModel.fromMap(Map<String, dynamic> card)
      : id = card['id'],
        name = card['name'],
        filled = false,
        color = Color(
            int.parse(card['color'].split('(0x')[1].split(')')[0], radix: 16));

  toMap() {
    return {"name": name, "color": color.toString()};
  }

  toggle() {
    filled = !filled!;
  }
}
