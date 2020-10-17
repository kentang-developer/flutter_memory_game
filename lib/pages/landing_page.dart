import 'package:flutter/material.dart';
import 'package:flutter_memory_game/widgets/board_item.dart';


class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {


  //Level
  //1 : 12 items
  //2 : 16 items
  //3 : 20 items
  //4 : 24 items
  int numberItem = 16;


  @override
  void initState() {
    // TODO: implement initState
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
                children: List.generate(numberItem, (index) {
                  return BoardItem(
                    imagePath: "assets/question.webp",
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
