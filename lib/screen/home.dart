// import 'dart:html';
// import 'package:chess_vectors_flutter/chess_vectors_flutter.dart';
import 'package:chess/provider/allPositions.dart';
import 'package:chess/widget/box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

enum ChessCharacter {
  whitePawn,
  whiteRook,
  whiteKnight,
  whiteBishop,
  whiteQueen,
  whiteKing,
  blackPawn,
  blackRook,
  blackKnight,
  blackBishop,
  blackQueen,
  blackKing,
  empty
}

enum CharacterColor { white, black, none }

enum BoxColor {
  white,
  black,
  blue,
  red,
}

enum WhiteCharacter {
  whitePawn,
  whiteRook,
  whiteKnight,
  whiteBishop,
  whiteQueen,
  whiteKing
}

enum BlackCharacter {
  blackPawn,
  blackRook,
  blackKnight,
  blackBishop,
  blackQueen,
  blackKing,
}

class _HomeState extends State<Home> {
  List<BoxColor> getBoardColor(List<Map<String, dynamic>> position) {
    final List<BoxColor> colors = [];

    position.forEach((positionMaps) {
      switch (positionMaps['highlightColor']) {
        case 'white':
          colors.add(BoxColor.white);
          break;
        case 'black':
          colors.add(BoxColor.black);
          break;
        case 'blue':
          colors.add(BoxColor.blue);
          break;
        case 'red':
          colors.add(BoxColor.red);
          break;
        default:
      }
    });
    // int i = 0;
    // int j = 0;
    // BoxColor initialColor = BoxColor.black;
    // while (i < 64) {
    //   while (j < 8) {
    //     if (initialColor == BoxColor.black) {
    //       initialColor = BoxColor.white;
    //     } else {
    //       initialColor = BoxColor.black;
    //     }

    //     colors.add(initialColor);
    //     j = j + 1;
    //     i = i + 1;
    //   }
    //   if (initialColor == BoxColor.black) {
    //     initialColor = BoxColor.white;
    //   } else {
    //     initialColor = BoxColor.black;
    //   }
    //   // initialColor = !initialColor;
    //   j = 0;
    // }

    return colors;
  }

  List<Map<String, int>> getBoxNames() {
    List<Map<String, int>> boxNames = [];
    for (int i = 8; i >= 1; i--) {
      for (int j = 1; j <= 8; j++) {
        boxNames.add({'x': j, 'y': i});
      }
    }

    return boxNames;
  }

  // create another list that contains characters, thier index determines
  // at what position the character is. and most of the locations will be
  // empty, so a list which always have 64 locations most of them will be
  // empty and some of them will have character.

  List<ChessCharacter> characterPosition = [];
  @override
  Widget build(BuildContext context) {
    // print('position : $position');
    final position = Provider.of<OverAllPositions>(context).positions;
    print('position lenght : ${position.length}');
    List<BoxColor> boardColors = getBoardColor(position);
    print('board colors length : ${boardColors.length}');
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      // appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // SizedBox(
          //   height: 150,
          //   width: double.infinity,
          //   child: GridView.builder(
          //       itemCount: 16,
          //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //           crossAxisCount: 8, childAspectRatio: 1),
          //       itemBuilder: (ctx, index) {
          //         return Container(
          //           decoration: BoxDecoration(
          //             color: Colors.grey.shade400,
          //             borderRadius: BorderRadius.circular(2),
          //             border: Border.all(color: Colors.black, width: 1.5),
          //           ),
          //         );
          //       }),
          // ),

          GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 64,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 8, childAspectRatio: 1),
              itemBuilder: (ctx, index) {
                final boxNames = getBoxNames();

                return Box(
                  boxNames[index],
                  boardColors[index],
                  position[index]['character'] as ChessCharacter,
                );
              }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // restart the game
          Provider.of<OverAllPositions>(context, listen: false)
              .restartTheGame();
        },
        child: Icon(Icons.restart_alt_rounded),
      ),
    );
  }
}
