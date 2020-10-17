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
                children: List.generate(chosenItem.length, (index) {
                  return BoardItem(
                    itemModel: chosenItem[index],
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
    setState(() {
      chosenItem[index].setCompleted(true);
    });
  }

  void getAllItem() {
    //ambil semua gambar yang ada dan masukan ke array
  }

  void getChosenItem() {
    List<BoardItemModel> allItem = [];
    for (int x = 1; x < 40; x++) {
      allItem.add(BoardItemModel(imagePath: "assets/$x.webp"));
    }
    //method untuk mngambil gambar secara acak dari arrayAllitem sebanyak numberItem

    //clear choosenItem
    chosenItem = [];

    //Acak allItem, dan ambil numberItem teratas (misal 8 teratas)
    var randomItem = (allItem..shuffle()).take(numberItem);

    //tambahkan 2x karena item nya berpasangan.
    chosenItem.addAll(randomItem);
    chosenItem.addAll(randomItem.map((item) => item.copy()).toList());

    setState(() {
      chosenItem.shuffle();
    });
  }
}
