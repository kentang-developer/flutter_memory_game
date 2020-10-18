

import 'package:flutter/material.dart';
import 'package:flutter_memory_game/model/board_item_model.dart';

class BoardItem extends StatelessWidget {
  final BoardItemModel itemModel;
  BoardItem({this.itemModel});
  @override
  Widget build(BuildContext context) {
    return Image.asset(itemModel != null ? itemModel.imagePath :"assets/question.webp");
  }

}



