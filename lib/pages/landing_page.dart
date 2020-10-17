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

  //berisi semua board item yang ada di puzzle
  List<BoardItemModel> boardPuzzle = [];

  //berisi board item yang dipilih, tetapi belum complete
  List<BoardItemModel> chosenItem = [];

  @override
  void initState() {
    getChosenItem();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            children: <Widget>[
              GridView(
                shrinkWrap: true,
                //physics: ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    mainAxisSpacing: 0.0, maxCrossAxisExtent: 100.0),
                children: List.generate(boardPuzzle.length, (index) {
                  return BoardItem(
                    itemModel: boardPuzzle[index],
                    onTap: () {
                      onItemTap(index);
                    },
                  );
                }),
              ),
              FlatButton(
                child: Text('Play', style: TextStyle(color: Colors.white)),
                color: Colors.blue,
                onPressed: () => getChosenItem(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onItemTap(int index) {
    var selectedItem = boardPuzzle[index];
    if (!selectedItem.isCompleted) {
      closePreviousChosenItem();
      setState(() {
        selectedItem.setRevealed(true);
        chosenItem.add(selectedItem);
        if (chosenItem.length == 2) {
          //jika 2 item telah dipilih
          if (chosenItem[0].imagePath == chosenItem[1].imagePath) {
            chosenItem[0].setCompleted(true);
            chosenItem[1].setCompleted(true);
          } else {
            Future.delayed(const Duration(seconds: 2), () {
              closePreviousChosenItem();
            });
          }
        }
      });
    }
  }

  void closePreviousChosenItem(){
    if(chosenItem.length == 2) {
      setState(() {
        chosenItem[0].setRevealed(false);
        chosenItem[1].setRevealed(false);
        chosenItem.clear();
      });
    }
  }

  void getChosenItem() {
    List<BoardItemModel> allItem = [];
    for (int x = 1; x < 40; x++) {
      allItem.add(BoardItemModel(imagePath: "assets/$x.webp"));
    }
    //method untuk mngambil gambar secara acak dari arrayAllitem sebanyak numberItem

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
