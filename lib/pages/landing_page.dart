import 'package:flutter/material.dart';
import 'package:flutter_memory_game/model/board_item_model.dart';
import 'package:flutter_memory_game/widgets/board_item.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  //Level
  //1 : 6 items
  //2 : 8 items
  //3 : 10 items
  //4 : 12 items
  int numberItem = 8; // 8 numberItem akan membuat 16 items (karena pair)
  List<BoardItemModel> boardPuzzle = [];

  @override
  void initState() {
    setUpBoard();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(children: [
            GridView(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  mainAxisSpacing: 0.0, maxCrossAxisExtent: 100.0),
              children: List.generate(16, (index) {
                return BoardItem(
                  itemModel:
                      BoardItemModel(imagePath: "assets/${index + 1}.webp"),
                );
              }),
            ),
            FlatButton(
              child: Text('Play', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () => setUpBoard(),
            ),
          ]),
        ),
      ),
    );
  }

  void setUpBoard() {
    List<BoardItemModel> allItem = [];
    for (int x = 1; x < 40; x++) {
      allItem.add(BoardItemModel(imagePath: "assets/$x.webp"));
    }
    //clear choosenItem
    boardPuzzle = [];
    //Acak allItem, dan ambil numberItem teratas (misal 8 teratas)
    var randomItem = (allItem..shuffle()).take(numberItem);

    //tambahkan 2x karena item nya berpasangan.
    boardPuzzle.addAll(randomItem);
    boardPuzzle.addAll(randomItem.map((item) => item.copy()).toList());
    setState(() {
      boardPuzzle.shuffle();
    });
  }
}
