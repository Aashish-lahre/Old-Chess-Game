import 'package:chess/provider/allPositions.dart';
import 'package:chess/screen/home.dart';
import 'package:chess_vectors_flutter/chess_vectors_flutter.dart';
import 'package:chess_vectors_flutter/vector_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Box extends StatefulWidget {
  final Map<String, int> boxName;
  final BoxColor boxColor;
  final ChessCharacter chessCharacter;
  const Box(this.boxName, this.boxColor, this.chessCharacter, {super.key});

  @override
  State<Box> createState() => _BoxState();
}

class _BoxState extends State<Box> {
  List<ChessCharacter> whiteCharacter = [
    ChessCharacter.whitePawn,
    ChessCharacter.whiteRook,
    ChessCharacter.whiteKnight,
    ChessCharacter.whiteBishop,
    ChessCharacter.whiteQueen,
    ChessCharacter.whiteKing
  ];

  List<ChessCharacter> blackCharacter = [
    ChessCharacter.blackPawn,
    ChessCharacter.blackRook,
    ChessCharacter.blackKnight,
    ChessCharacter.blackBishop,
    ChessCharacter.blackQueen,
    ChessCharacter.blackKing,
  ];

  VectorBase? transformChessCharacterToVectorBase(ChessCharacter character) {
    switch (character) {
      case ChessCharacter.whiteRook:
        return WhiteRook();
      case ChessCharacter.whiteKnight:
        return WhiteKnight();
      case ChessCharacter.whiteBishop:
        return WhiteBishop();
      case ChessCharacter.whiteQueen:
        return WhiteQueen();
      case ChessCharacter.whiteKing:
        return WhiteKing();
      case ChessCharacter.whitePawn:
        return WhitePawn();
      case ChessCharacter.empty:
        return null;
      case ChessCharacter.blackRook:
        return BlackRook();
      case ChessCharacter.blackKnight:
        return BlackKnight();
      case ChessCharacter.blackBishop:
        return BlackBishop();
      case ChessCharacter.blackQueen:
        return BlackQueen();
      case ChessCharacter.blackKing:
        return BlackKing();
      case ChessCharacter.blackPawn:
        return BlackPawn();
    }
  }

  Color checkColor(BoxColor boxColor) {
    if (boxColor == BoxColor.white) {
      return Colors.white;
    }
    if (boxColor == BoxColor.black) {
      return Colors.grey.shade600;
    }
    if (boxColor == BoxColor.blue) {
      return Colors.blue.shade300.withOpacity(0.3);
    }
    if (boxColor == BoxColor.red) {
      return Colors.red.shade300;
    }
    // print('boxColor : $boxColor');
    // print('boxcolor name : ${boxColor.name}');

    return Colors.transparent;
  }

  bool checkPositionAvailable(
      Map<String, int> location, List<Map<String, dynamic>> allLocations) {
    Map<String, dynamic> takenLocation = allLocations.lastWhere((element) =>
        element['x'] == location['x'] && element['y'] == location['y']);

    if (takenLocation['color'] == CharacterColor.none) {
      return true;
    } else {
      return false;
    }
  }

  bool checkLocationExists(Map<String, int> location) {
    if (location.values.first <= 0 ||
        location.values.first >= 9 ||
        location.values.last <= 0 ||
        location.values.last >= 9) {
      return false;
    }

    if (location['x'] == widget.boxName['x'] &&
        location['y'] == widget.boxName['y']) {
      return false;
      // pathways.removeWhere((element) =>
      //     element['x'] == boxName['x'] && element['y'] == boxName['y']);
    } else {
      return true;
    }
  }

  Map<String, List<Map<String, int>>> getAvailableBoxes(
      List<Map<String, dynamic>> positions,
      Map<String, int> boxName,
      ChessCharacter chessCharacter) {
    // List<Map<String, int>> pathways = [];
    Map<String, List<Map<String, int>>> pathways = {};
    // List<String> availableBoxes = [];

    if (chessCharacter == ChessCharacter.blackPawn) {
      if (boxName['y'] == 2 && chessCharacter == ChessCharacter.blackPawn) {
        // pathWays
        // boxName.update('y', (value) => value + 1);
        // boxName.update('y', (value) => value + 2);

        Map<String, List<Map<String, int>>> entry = {
          'top': [
            {'x': boxName.values.first, 'y': 3},
            {'x': boxName.values.first, 'y': 4}
          ],
          if (checkLocationExists(
              {'x': boxName.values.first + 1, 'y': boxName.values.last + 1}))
            'right': [
              {'x': boxName.values.first + 1, 'y': boxName.values.last + 1}
            ],
          if (checkLocationExists(
              {'x': boxName.values.first - 1, 'y': boxName.values.last + 1}))
            'left': [
              {'x': boxName.values.first - 1, 'y': boxName.values.last + 1}
            ]
        };
        pathways.addEntries(entry.entries);

        // print('pathways at method : $pathways');

        // pathways.addAll([
        //   {'x': boxName.values.first, 'y': 3},
        //   {'x': boxName.values.first, 'y': 4},
        //   if (checkLocationExists(
        //       {'x': boxName.values.first + 1, 'y': boxName.values.last + 1}))
        //     {'x': boxName.values.first + 1, 'y': boxName.values.last + 1},
        //   if (checkLocationExists(
        //       {'x': boxName.values.first - 1, 'y': boxName.values.last + 1}))
        //     {'x': boxName.values.first - 1, 'y': boxName.values.last + 1}
        // ]);
        // check if someone is already there
      }
      if (boxName['y'] != 2) {
        if (boxName['y'] == 8) {
          // no more boxes to visit
          // later, once we get to the top you have a pop up
          // or something that gives you an option to choose
          // the characters you want to transform to
          //like(queen, rook, knight, bishop).
          // print('At Top');
        } else {
          // String box = '${int.parse(boxName[1]) + 1}';
          // pathways.add(boxName.replaceRange(1, 1, box));
          Map<String, List<Map<String, int>>> entry = {
            'top': [
              {'x': boxName.values.first, 'y': boxName.values.last + 1}
            ],
            if (checkLocationExists(
                {'x': boxName.values.first + 1, 'y': boxName.values.last + 1}))
              'right': [
                {'x': boxName.values.first + 1, 'y': boxName.values.last + 1}
              ],
            if (checkLocationExists(
                {'x': boxName.values.first - 1, 'y': boxName.values.last + 1}))
              'left': [
                {'x': boxName.values.first - 1, 'y': boxName.values.last + 1}
              ]
          };
          pathways.addEntries(entry.entries);

          // pathways.addAll([
          //   {'x': boxName.values.first, 'y': boxName.values.last + 1},
          //   if (checkLocationExists(
          //       {'x': boxName.values.first + 1, 'y': boxName.values.last + 1}))
          //     {'x': boxName.values.first + 1, 'y': boxName.values.last + 1},
          //   if (checkLocationExists(
          //       {'x': boxName.values.first - 1, 'y': boxName.values.last + 1}))
          //     {'x': boxName.values.first - 1, 'y': boxName.values.last + 1}
          // ]);
        }
      }

      // return pathways;
    }

    if (chessCharacter == ChessCharacter.whitePawn) {
      if (boxName['y'] == 7) {
        Map<String, List<Map<String, int>>> entry = {
          'bottom': [
            {'x': boxName.values.first, 'y': 6},
            {'x': boxName.values.first, 'y': 5},
          ],
          if (checkLocationExists(
              {'x': boxName.values.first + 1, 'y': boxName.values.last - 1}))
            'right': [
              {'x': boxName.values.first + 1, 'y': boxName.values.last - 1}
            ],
          if (checkLocationExists(
              {'x': boxName.values.first - 1, 'y': boxName.values.last - 1}))
            'left': [
              {'x': boxName.values.first - 1, 'y': boxName.values.last - 1}
            ],
        };
        pathways.addEntries(entry.entries);

        // pathways.addAll([
        //   {'x': boxName.values.first, 'y': 6},
        //   {'x': boxName.values.first, 'y': 5},
        //   if (checkLocationExists(
        //       {'x': boxName.values.first + 1, 'y': boxName.values.last - 1}))
        //     {'x': boxName.values.first + 1, 'y': boxName.values.last - 1},
        //   if (checkLocationExists(
        //       {'x': boxName.values.first - 1, 'y': boxName.values.last - 1}))
        //     {'x': boxName.values.first - 1, 'y': boxName.values.last - 1}
        // ]);
      }

      if (boxName['y'] != 7) {
        if (boxName['y'] == 1) {
          // no more boxes to visit
          // print('At Top');
        } else {
          // String box = '${int.parse(boxName[1]) + 1}';
          // pathways.add(boxName.replaceRange(1, 1, box));

          Map<String, List<Map<String, int>>> entry = {
            'bottom': [
              {'x': boxName.values.first, 'y': boxName.values.last - 1},
            ],
            if (checkLocationExists({
              'x': boxName.values.first + 1,
              'y': boxName.values.last - 1
            })
                // &&
                // checkPositionAvailable({
                //   'x': boxName.values.first + 1,
                //   'y': boxName.values.last - 1
                // }, positions)
                )
              'right': [
                {'x': boxName.values.first + 1, 'y': boxName.values.last - 1}
              ],
            if (checkLocationExists({
              'x': boxName.values.first - 1,
              'y': boxName.values.last - 1
            })
                // &&
                // checkPositionAvailable({
                //   'x': boxName.values.first - 1,
                //   'y': boxName.values.last - 1
                // }, positions)
                )
              'left': [
                {'x': boxName.values.first - 1, 'y': boxName.values.last - 1}
              ],
          };
          pathways.addEntries(entry.entries);

          // pathways.addAll([
          //   {'x': boxName.values.first, 'y': boxName.values.last - 1},
          //   if (checkLocationExists(
          //       {'x': boxName.values.first + 1, 'y': boxName.values.last - 1}))
          //     {'x': boxName.values.first + 1, 'y': boxName.values.last - 1},
          //   if (checkLocationExists(
          //       {'x': boxName.values.first - 1, 'y': boxName.values.last - 1}))
          //     {'x': boxName.values.first - 1, 'y': boxName.values.last - 1}
          // ]);
        }
      }
    }

    if (chessCharacter == ChessCharacter.blackRook ||
        chessCharacter == ChessCharacter.whiteRook) {
      // Map<String, List<Map<String, int>>> entry = {
      //   'bottom': [
      //     {'x': boxName.values.first, 'y': 6},
      //     {'x': boxName.values.first, 'y': 5},
      //   ],
      //   if (checkLocationExists(
      //       {'x': boxName.values.first + 1, 'y': boxName.values.last - 1}))
      //     'right': [
      //       {'x': boxName.values.first + 1, 'y': boxName.values.last - 1}
      //     ],
      //   if (checkLocationExists(
      //       {'x': boxName.values.first - 1, 'y': boxName.values.last - 1}))
      //     'left': [
      //       {'x': boxName.values.first - 1, 'y': boxName.values.last - 1}
      //     ],
      // };
      // pathways.addEntries(entry.entries);

      // for (int i = boxName.values.last; i <= 8; i++) {
      // pathways.add({'x': i, 'y': boxName.values.last});
      // pathways.add({'x': boxName.values.first, 'y': i});
      pathways.addEntries({
        // bottom key has ordered values
        'bottom': [
          for (int i = boxName.values.last; i >= 1; i--)
            {'x': boxName.values.first, 'y': i}
        ],
      }.entries);
      pathways.addEntries({
        // top key has ordered values
        'top': [
          for (int i = boxName.values.last; i <= 8; i++)
            {'x': boxName.values.first, 'y': i}
        ],
      }.entries);
      pathways.addEntries({
        // right key has ordered values
        'right': [
          for (int i = boxName.values.first; i <= 8; i++)
            {'x': i, 'y': boxName.values.last}
        ],
      }.entries);
      pathways.addEntries({
        // left key has ordered values
        'left': [
          for (int i = boxName.values.first; i >= 1; i--)
            {'x': i, 'y': boxName.values.last}
        ],
      }.entries);

      // code to remove the current box from pathway
      pathways.forEach((key, value) {
        value.removeWhere((element) =>
            element['x'] == boxName['x'] && element['y'] == boxName['y']);
      });

      // }
      // for (int i = 1; i <= 8; i++) {
      //   pathways.add({'x': i, 'y': boxName.values.last});
      //   pathways.add({'x': boxName.values.first, 'y': i});
      // }
      // pathways.removeWhere((element) =>
      //     element['x'] == boxName['x'] && element['y'] == boxName['y']);
      // return pathways;
    }
    if (chessCharacter == ChessCharacter.blackKnight ||
        chessCharacter == ChessCharacter.whiteKnight) {
      // NO ORDER NEED IN KNIGHT
      if (checkLocationExists(
          {'x': boxName.values.first + 1, 'y': boxName.values.last + 2})) {
        pathways.addEntries({
          'topRight': [
            {'x': boxName.values.first + 1, 'y': boxName.values.last + 2}
          ],
        }.entries);

        // pathways
        //     .add({'x': boxName.values.first - 2, 'y': boxName.values.last + 1});
      }
      ;
      if (checkLocationExists(
          {'x': boxName.values.first - 1, 'y': boxName.values.last + 2})) {
        pathways.addEntries({
          'topLeft': [
            {'x': boxName.values.first - 1, 'y': boxName.values.last + 2}
          ],
        }.entries);

        // pathways
        //     .add({'x': boxName.values.first - 2, 'y': boxName.values.last - 1});
      }
      ;
      if (checkLocationExists(
          {'x': boxName.values.first + 2, 'y': boxName.values.last + 1})) {
        pathways.addEntries({
          'rightTop': [
            {'x': boxName.values.first + 2, 'y': boxName.values.last + 1}
          ],
        }.entries);

        // pathways
        //     .add({'x': boxName.values.first + 2, 'y': boxName.values.last + 1});
      }
      ;
      if (checkLocationExists(
          {'x': boxName.values.first + 2, 'y': boxName.values.last - 1})) {
        pathways.addEntries({
          'rightBottom': [
            {'x': boxName.values.first + 2, 'y': boxName.values.last - 1}
          ],
        }.entries);

        // pathways
        //     .add({'x': boxName.values.first + 2, 'y': boxName.values.last - 1});
      }
      ;
      // if (checkLocationExists(
      //     {'x': boxName.values.first + 1, 'y': boxName.values.last + 2})) {

      //       pathways.addEntries({
      //         'rightBottom': [
      //           {'x': boxName.values.first + 1, 'y': boxName.values.last + 2}
      //         ],
      //       }.entries);

      //   pathways
      //       .add({'x': boxName.values.first + 1, 'y': boxName.values.last + 2});
      // }
      // ;
      // if (checkLocationExists(
      //     {'x': boxName.values.first - 1, 'y': boxName.values.last + 2})) {
      //   pathways
      //       .add({'x': boxName.values.first - 1, 'y': boxName.values.last + 2});
      // }
      ;
      if (checkLocationExists(
          {'x': boxName.values.first + 1, 'y': boxName.values.last - 2})) {
        pathways.addEntries({
          'bottomRight': [
            {'x': boxName.values.first + 1, 'y': boxName.values.last - 2}
          ],
        }.entries);

        // pathways
        //     .add({'x': boxName.values.first + 1, 'y': boxName.values.last - 2});
      }
      ;
      if (checkLocationExists(
          {'x': boxName.values.first - 1, 'y': boxName.values.last - 2})) {
        pathways.addEntries({
          'bottomLeft': [
            {'x': boxName.values.first - 1, 'y': boxName.values.last - 2}
          ],
        }.entries);

        // pathways
        //     .add({'x': boxName.values.first - 1, 'y': boxName.values.last - 2});
      }
      ;
      if (checkLocationExists(
          {'x': boxName.values.first - 2, 'y': boxName.values.last + 1})) {
        pathways.addEntries({
          'leftTop': [
            {'x': boxName.values.first - 2, 'y': boxName.values.last + 1}
          ],
        }.entries);

        // pathways
        //     .add({'x': boxName.values.first - 1, 'y': boxName.values.last - 2});
      }
      ;
      if (checkLocationExists(
          {'x': boxName.values.first - 2, 'y': boxName.values.last - 1})) {
        pathways.addEntries({
          'leftBottom': [
            {'x': boxName.values.first - 2, 'y': boxName.values.last - 1}
          ],
        }.entries);

        // pathways
        //     .add({'x': boxName.values.first - 1, 'y': boxName.values.last - 2});
      }
      ;

      // return pathways;
    }
    if (chessCharacter == ChessCharacter.blackBishop ||
        chessCharacter == ChessCharacter.whiteBishop) {
      // Bishop is totally ordered
      for (int i = 1; i <= 8; i++) {
        if (checkLocationExists(
            {'x': boxName.values.first - i, 'y': boxName.values.last - i})) {
          pathways.addEntries({
            'bottomLeft': [
              for (int i = 1; i <= 8; i++)
                if (checkLocationExists({
                  'x': boxName.values.first - i,
                  'y': boxName.values.last - i
                }))
                  {'x': boxName.values.first - i, 'y': boxName.values.last - i}
            ],
          }.entries);
        }
      }

      for (int i = 1; i <= 8; i++) {
        if (checkLocationExists(
            {'x': boxName.values.first + i, 'y': boxName.values.last - i})) {
          pathways.addEntries({
            'bottomRight': [
              for (int i = 1; i <= 8; i++)
                if (checkLocationExists({
                  'x': boxName.values.first + i,
                  'y': boxName.values.last - i
                }))
                  {'x': boxName.values.first + i, 'y': boxName.values.last - i}
            ],
          }.entries);
        }
      }

      for (int i = 1; i <= 8; i++) {
        if (checkLocationExists(
            {'x': boxName.values.first - i, 'y': boxName.values.last + i})) {
          pathways.addEntries({
            'topLeft': [
              for (int i = 1; i <= 8; i++)
                if (checkLocationExists({
                  'x': boxName.values.first - i,
                  'y': boxName.values.last + i
                }))
                  {'x': boxName.values.first - i, 'y': boxName.values.last + i}
            ],
          }.entries);
        }
      }

      for (int i = 1; i <= 8; i++) {
        if (checkLocationExists(
            {'x': boxName.values.first + i, 'y': boxName.values.last + i})) {
          pathways.addEntries({
            'topRight': [
              for (int i = 1; i <= 8; i++)
                if (checkLocationExists({
                  'x': boxName.values.first + i,
                  'y': boxName.values.last + i
                }))
                  {'x': boxName.values.first + i, 'y': boxName.values.last + i}
            ],
          }.entries);
        }
      }

      // pathways.add(
      //     {'x': boxName.values.first - i, 'y': boxName.values.last - i});

      // if (checkLocationExists(
      //     {'x': boxName.values.first + i, 'y': boxName.values.last + i})) {
      //   pathways.add(
      //       {'x': boxName.values.first + i, 'y': boxName.values.last + i});
      // }

      // if (checkLocationExists(
      //     {'x': boxName.values.first - i, 'y': boxName.values.last + i})) {
      //   pathways.add(
      //       {'x': boxName.values.first - i, 'y': boxName.values.last + i});
      // }

      // if (checkLocationExists(
      //     {'x': boxName.values.first + i, 'y': boxName.values.last - i})) {
      //   pathways.add(
      //       {'x': boxName.values.first + i, 'y': boxName.values.last - i});
      // }
      // return pathways;
    }
    if (chessCharacter == ChessCharacter.blackQueen ||
        chessCharacter == ChessCharacter.whiteQueen) {
      // Ordered!

      // for (int i = 1; i <= 8; i++) {
      //   if (checkLocationExists(
      //       {'x': boxName.values.first - i, 'y': boxName.values.last - i})) {
      //     pathways.add(
      //         {'x': boxName.values.first - i, 'y': boxName.values.last - i});
      //   }

      //   if (checkLocationExists(
      //       {'x': boxName.values.first + i, 'y': boxName.values.last + i})) {
      //     pathways.add(
      //         {'x': boxName.values.first + i, 'y': boxName.values.last + i});
      //   }

      //   if (checkLocationExists(
      //       {'x': boxName.values.first - i, 'y': boxName.values.last + i})) {
      //     pathways.add(
      //         {'x': boxName.values.first - i, 'y': boxName.values.last + i});
      //   }

      //   if (checkLocationExists(
      //       {'x': boxName.values.first + i, 'y': boxName.values.last - i})) {
      //     pathways.add(
      //         {'x': boxName.values.first + i, 'y': boxName.values.last - i});
      //   }
      // }

      //Bishop Part
      for (int i = 1; i <= 8; i++) {
        if (checkLocationExists(
            {'x': boxName.values.first - i, 'y': boxName.values.last - i})) {
          pathways.addEntries({
            'bottomLeft': [
              for (int i = 1; i <= 8; i++)
                if (checkLocationExists({
                  'x': boxName.values.first - i,
                  'y': boxName.values.last - i
                }))
                  {'x': boxName.values.first - i, 'y': boxName.values.last - i}
            ],
          }.entries);
        }
      }

      for (int i = 1; i <= 8; i++) {
        if (checkLocationExists(
            {'x': boxName.values.first + i, 'y': boxName.values.last - i})) {
          pathways.addEntries({
            'bottomRight': [
              for (int i = 1; i <= 8; i++)
                if (checkLocationExists({
                  'x': boxName.values.first + i,
                  'y': boxName.values.last - i
                }))
                  {'x': boxName.values.first + i, 'y': boxName.values.last - i}
            ],
          }.entries);
        }
      }

      for (int i = 1; i <= 8; i++) {
        if (checkLocationExists(
            {'x': boxName.values.first - i, 'y': boxName.values.last + i})) {
          pathways.addEntries({
            'topLeft': [
              for (int i = 1; i <= 8; i++)
                if (checkLocationExists({
                  'x': boxName.values.first - i,
                  'y': boxName.values.last + i
                }))
                  {'x': boxName.values.first - i, 'y': boxName.values.last + i}
            ],
          }.entries);
        }
      }

      for (int i = 1; i <= 8; i++) {
        if (checkLocationExists(
            {'x': boxName.values.first + i, 'y': boxName.values.last + i})) {
          pathways.addEntries({
            'topRight': [
              for (int i = 1; i <= 8; i++)
                if (checkLocationExists({
                  'x': boxName.values.first + i,
                  'y': boxName.values.last + i
                }))
                  {'x': boxName.values.first + i, 'y': boxName.values.last + i}
            ],
          }.entries);
        }
      }

      // for (int i = 1; i <= 8; i++) {
      //   if (checkLocationExists({'x': i, 'y': boxName.values.last})) {
      //     pathways.add({'x': i, 'y': boxName.values.last});
      //   }
      //   if (checkLocationExists({'x': boxName.values.first, 'y': i})) {
      //     pathways.add({'x': boxName.values.first, 'y': i});
      //   }
      // }

      // Rook Part
      pathways.addEntries({
        'bottom': [
          for (int i = boxName.values.last; i >= 1; i--)
            {'x': boxName.values.first, 'y': i}
        ],
      }.entries);
      pathways.addEntries({
        'top': [
          for (int i = boxName.values.last; i <= 8; i++)
            {'x': boxName.values.first, 'y': i}
        ],
      }.entries);
      pathways.addEntries({
        'right': [
          for (int i = boxName.values.first; i <= 8; i++)
            {'x': i, 'y': boxName.values.last}
        ],
      }.entries);
      pathways.addEntries({
        'left': [
          for (int i = boxName.values.first; i >= 1; i--)
            {'x': i, 'y': boxName.values.last}
        ],
      }.entries);

      pathways.forEach((key, value) {
        value.removeWhere((element) =>
            element['x'] == boxName['x'] && element['y'] == boxName['y']);
      });

      // return pathways;
    }
    if (chessCharacter == ChessCharacter.blackKing ||
        chessCharacter == ChessCharacter.whiteKing) {
      // King

      if (checkLocationExists(
          {'x': boxName.values.first + 1, 'y': boxName.values.last})) {
        // pathways.add({'x': boxName.values.first + 1, 'y': boxName.values.last});
        pathways.addEntries({
          'right': [
            {'x': boxName.values.first + 1, 'y': boxName.values.last}
          ]
        }.entries);
      }

      if (checkLocationExists(
          {'x': boxName.values.first - 1, 'y': boxName.values.last})) {
        // pathways.add({'x': boxName.values.first - 1, 'y': boxName.values.last});
        pathways.addEntries({
          'left': [
            {'x': boxName.values.first - 1, 'y': boxName.values.last}
          ]
        }.entries);
      }

      if (checkLocationExists(
          {'x': boxName.values.first + 1, 'y': boxName.values.last + 1})) {
        // pathways
        //     .add({'x': boxName.values.first + 1, 'y': boxName.values.last + 1});
        pathways.addEntries({
          'topRight': [
            {'x': boxName.values.first + 1, 'y': boxName.values.last + 1}
          ]
        }.entries);
      }

      if (checkLocationExists(
          {'x': boxName.values.first - 1, 'y': boxName.values.last - 1})) {
        // pathways
        //     .add({'x': boxName.values.first - 1, 'y': boxName.values.last - 1});
        pathways.addEntries({
          'bottomLeft': [
            {'x': boxName.values.first - 1, 'y': boxName.values.last - 1}
          ]
        }.entries);
      }

      if (checkLocationExists(
          {'x': boxName.values.first, 'y': boxName.values.last + 1})) {
        // pathways.add({'x': boxName.values.first, 'y': boxName.values.last + 1});
        pathways.addEntries({
          'top': [
            {'x': boxName.values.first, 'y': boxName.values.last + 1}
          ]
        }.entries);
      }
      if (checkLocationExists(
          {'x': boxName.values.first, 'y': boxName.values.last - 1})) {
        // pathways.add({'x': boxName.values.first, 'y': boxName.values.last - 1});
        pathways.addEntries({
          'bottom': [
            {'x': boxName.values.first, 'y': boxName.values.last - 1}
          ]
        }.entries);
      }

      if (checkLocationExists(
          {'x': boxName.values.first + 1, 'y': boxName.values.last - 1})) {
        // pathways
        //     .add({'x': boxName.values.first + 1, 'y': boxName.values.last - 1});
        pathways.addEntries({
          'bottomRight': [
            {'x': boxName.values.first + 1, 'y': boxName.values.last - 1}
          ]
        }.entries);
      }

      if (checkLocationExists(
          {'x': boxName.values.first - 1, 'y': boxName.values.last + 1})) {
        // pathways
        //     .add({'x': boxName.values.first - 1, 'y': boxName.values.last + 1});
        pathways.addEntries({
          'topLeft': [
            {'x': boxName.values.first - 1, 'y': boxName.values.last + 1}
          ]
        }.entries);
      }

      // return pathways;
    }
    // print('pathways : $pathways');

    Map<String, List<Map<String, int>>> allPathways = pathways;
    // print('all pathways : $allPathways');

    return listAvailableOnes(boxName, allPathways, positions, chessCharacter);
    // return pathways;
  }

  bool checkIfCharacterIsOursOrNot(Map<String, int> targetPosition,
      List<Map<String, dynamic>> allPosition, CharacterColor targetColor) {
    Map<String, dynamic> takenPosition = allPosition.firstWhere((element) =>
        element['x'] == targetPosition['x'] &&
        element['y'] == targetPosition['y']);

    if (takenPosition['color'] == targetColor) {
      return true;
    } else {
      // print('check color : ${takenPosition['color']}');
      // print('target color : $targetColor');
      return false;
    }
  }

  CharacterColor getCharacterColor(
      Map<String, int> boxName, List<Map<String, dynamic>> positions) {
    Map<String, dynamic> takenPosition = positions.firstWhere((element) =>
        element['x'] == boxName['x'] && element['y'] == boxName['y']);

    CharacterColor getColor = takenPosition['color'];
    return getColor;
  }

  void attackOrLeave() {}

  // click the character
  // check- when inplace of character user press empty or opponent character then nothing happens-vibration happens
  // highlight the available boxes
  // checks-
  // when click on outside of highlight boxes-do not move and give a vibration(signaling the error)
  // when click on the same(current) position-do not move and un-highlight the boxes
  // on the last available box(that is also the last highlighted box) check if there is a character or the box is empty
  // if character(must be opponent) is there-highlight the box with red color
  // if empty - do nothing-just highlight normally
  // when changing the place-
  //checks-
  // if there is a character or not.
  // if yes- delete that character and put current character into opponent character place in position list
  // if not- update the position list

  // when click the character=check if it is protecting the king or not
  // if protecting - then it cannot be moved, move some other same team character
  // if not protecting - then it can move as normal
  //
  //
  //when moving king check if that desired boxname is safe or not
  // safe means - some opponent is attacking that boxname or not
  //if attacking then can not move king to that place
  //if not attacking, can move to that place.
  //
  //check mate
  // press a character
  //check if this character is king or not
  //if king -
  //  check if targetting boxname(a boxname where king wants to go) is in kill range of any opponent character.(even if in that boxname some opponent character is present, king cannot move to kill that opponent if any opponent character has that boxname in its kill range.)
  //  same thing in other words - check if pathway boxnames are in kill range of any opponent character then that boxname must not be available to move.
  //  if true-
  //    king cannot go to that boxname.(remove that boxName from kings available pathways)
  //  if not-
  //    king can move to that boxname. (do not remove that boxName from kings available pathways)
  //
  //
  //
  //if not -
  //  check if this character protecting its king or not
  //  if yes -
  //    then it cannot be moved, move some other same team character then check again if it is protecting or not
  //  if not-
  //    then it can move as normal
  //    after moving a character one method should run that check the king of different color
  //    checks if king is in kill range of any opponent character or not.
  //    if yes -
  //      check if king has any safe boxnames to travel
  //      if true-
  //        then king is free to move to those places
  //      if not -
  //        king cannot move anywhere
  //
  //      check if someones from king team can block the kill range
  //      if true -
  //        that someones can only move to the blocking boxname
  //        no other same team character can move
  //      if not -
  //        if king also can't move - then it is check mate
  //
  //
  //
  //    if not -
  //      do nothing... go normal...

  List<Map<String, int>> getAllAvailablePositions(
      List<Map<String, int>> positionsToCheck,
      List<Map<String, dynamic>> allPosition,
      CharacterColor colorToCheck) {
    List<Map<String, int>> fetchedPositions = [];
    final checkPositionEmptyOrNot =
        Provider.of<OverAllPositions>(context, listen: false)
            .checkPositionEmptyOrNot;

    for (var position in positionsToCheck) {
      // print('single positions are : $position');
      if (checkPositionEmptyOrNot(position)) {
        // position is empty
        // print('position : $position : empty');
        fetchedPositions.add(position);
      } else {
        // position is not available
        // check if this position is ours or not
        if (checkIfCharacterIsOursOrNot(position, allPosition, colorToCheck)) {
          // matched - do nothing and break the loop
          // print('position : $position : ours');
          break;
        } else {
          // not matched
          fetchedPositions.add(position);
          break;
        }
      }
    }

    return fetchedPositions;
  }

  void logicForAllAvailablePositions(
      Map<String, List<Map<String, int>>> pathways,
      Map<String, List<Map<String, int>>> availablePositions,
      List<Map<String, dynamic>> positions,
      CharacterColor color) {
    pathways.forEach((key, value) {
      availablePositions.addEntries(
          {key: getAllAvailablePositions(value, positions, color)}.entries);
      // print('done');
    });
  }

  Map<String, List<Map<String, int>>> listAvailableOnes(
      Map<String, int> currentPosition,
      Map<String, List<Map<String, int>>> pathways,
      List<Map<String, dynamic>> positions,
      ChessCharacter chessCharacter) {
    Map<String, List<Map<String, int>>> availablePositions = {};
    // print('reached');
    // Map<String, List<Map<String, int>>> availablePositions = {};

    if (chessCharacter == ChessCharacter.whitePawn) {
      // pathways['bottom'].contains({'x': currentPosition['x'], 'y': (currentPosition['y']! - 1)})
      // if (pathways['bottom'] != null) {
      //   // creating a copy of the pathways list to itrate so i in remove elements on the original pathways list
      //   // i am doing this because itrating a list and modifying that list at the same time is not possible.
      //   List<Map<String, int>> pathwaysBottom = pathways['bottom']!.toList();
      //   pathwaysBottom.forEach((element) {
      //     bool containsBox = positions.any((box) =>
      //         box['x'] == element['x'] &&
      //         box['y'] == element['y'] &&
      //         box['character'] == ChessCharacter.empty &&
      //         box['color'] == CharacterColor.none);

      //     if (containsBox) {
      //       // this position is available
      //       // do not remove this position from pathways list
      //       bool checkContains = pathways['bottom']!.any((element) =>
      //           element['x'] == currentPosition['x'] &&
      //           element['y'] == currentPosition['y']! - 1);
      //       if (!checkContains) {
      //         pathways['bottom']!.remove(element);
      //       }
      //     } else {
      //       // this position is taken
      //       // remove this position from the list
      //       pathways['bottom']!.remove(element);
      //     }
      //   });
      // } else {
      //   // this character is at last position it can get...
      //   // do nothing....
      // }

      if (pathways['bottom'] != null) {
        // black pawn is not at top

        // creating a copy of the pathways list to itrate so i in remove elements on the original pathways list
        // i am doing this because itrating a list and modifying that list at the same time is not possible.
        List<Map<String, int>> pathwaysTop = pathways['bottom']!.toList();
        pathwaysTop.forEach((element) {
          // print('element:x:${element['x']}');
          // print('element:y:${element['y']}');

          // i tried the contains method first but that returns false even if the keys and values are equal this is bacause the map instance was different even if the content was same, thats why now i am comparing the values not the map itself.
          bool containsElement = positions.any((box) =>
              box['x'] == element['x'] &&
              box['y'] == element['y'] &&
              box['character'] == ChessCharacter.empty &&
              box['color'] == CharacterColor.none);

          if (containsElement) {
            // this position is available
            // print('position is available');

            // availablePositions.addEntries({'top': []})

            // by any chance, there is boxes before this, and those boxes are not available then this one should eliminated too.

            bool containsElement = pathways['bottom']!.any((box) =>
                box['x'] == currentPosition['x'] &&
                box['y'] == currentPosition['y']! - 1);

            if (!containsElement) {
              pathways['bottom']!.remove(element);
            }
          } else {
            // this position is taken
            // remove this position from the list
            // print('position is not available');
            pathways['bottom']!.remove(element);
          }
        });
      } else {
        // this character is at last position it can get...
        // do nothing....
      }

      // for right positions...
      if (pathways['right'] != null) {
        // right box does exists.

        bool containElement = positions.any((box) =>
            box['x'] == pathways['right']![0]['x'] &&
            box['y'] == pathways['right']![0]['y'] &&
            box['character'] == ChessCharacter.empty &&
            box['color'] == CharacterColor.none);
        if (containElement) {
          // right position is available
          // do not include in list
          pathways['right']!.removeAt(0);
        } else {
          // position is not available
          // check if it is ours or not
          // if not, include in list
          // if yes do not include it

          // get that right box position in takenPosition variable...
          Map<String, dynamic> takenPosition = positions.lastWhere((element) =>
              element['x'] == pathways['right']![0]['x'] &&
              element['y'] == pathways['right']![0]['y']);

          if (takenPosition['color'] == CharacterColor.white) {
            // this is ours
            // remove this position from list.
            pathways['right']!.removeAt(0);
          } else {
            // this is not ours
            // do nothing...
          }
        }
      }

      // for left positions...
      if (pathways['left'] != null) {
        bool containElement = positions.any((box) =>
            box['x'] == pathways['left']![0]['x'] &&
            box['y'] == pathways['left']![0]['y'] &&
            box['character'] == ChessCharacter.empty &&
            box['color'] == CharacterColor.none);

        if (containElement) {
          // position is available
          pathways['left']!.removeAt(0);
        } else {
          // check if it is ours or not
          // if not, include in list
          // if yes do not include it
          // get that left box position in takenPosition variable...
          Map<String, dynamic> takenPosition = positions.lastWhere((element) =>
              element['x'] == pathways['left']![0]['x'] &&
              element['y'] == pathways['left']![0]['y']);

          if (takenPosition['color'] == CharacterColor.white) {
            // this is ours
            // remove this position from list.
            pathways['left']!.removeAt(0);
          } else {
            // this is not ours
            // do nothing...
          }
        }
      }
      availablePositions = pathways;
    }

    if (chessCharacter == ChessCharacter.blackPawn) {
      if (pathways['top'] != null) {
        // black pawn is not at top

        // creating a copy of the pathways list to itrate so i in remove elements on the original pathways list
        // i am doing this because itrating a list and modifying that list at the same time is not possible.
        List<Map<String, int>> pathwaysTop = pathways['top']!.toList();
        pathwaysTop.forEach((element) {
          // print('element:x:${element['x']}');
          // print('element:y:${element['y']}');

          // i tried the contains method first but that returns false even if the keys and values are equal this is bacause the map instance was different even if the content was same, thats why now i am comparing the values not the map itself.
          bool containsElement = positions.any((box) =>
              box['x'] == element['x'] &&
              box['y'] == element['y'] &&
              box['character'] == ChessCharacter.empty &&
              box['color'] == CharacterColor.none);

          if (containsElement) {
            // this position is available
            // print('position is available');

            // availablePositions.addEntries({'top': []})

            // by any chance, there is boxes before this, and those boxes are not available then this one should eliminated too.

            bool containsElement = pathways['top']!.any((box) =>
                box['x'] == currentPosition['x'] &&
                box['y'] == currentPosition['y']! + 1);

            if (!containsElement) {
              pathways['top']!.remove(element);
            }
          } else {
            // this position is taken
            // remove this position from the list
            // print('position is not available');
            pathways['top']!.remove(element);
          }
        });
      } else {
        // this character is at last position it can get...
        // do nothing....
      }

      // for right positions...
      if (pathways['right'] != null) {
        // right box does exists.

        bool containElement = positions.any((box) =>
            box['x'] == pathways['right']![0]['x'] &&
            box['y'] == pathways['right']![0]['y'] &&
            box['character'] == ChessCharacter.empty &&
            box['color'] == CharacterColor.none);
        if (containElement) {
          // right position is available
          // do not include in list
          pathways['right']!.removeAt(0);
        } else {
          // position is not available
          // check if it is ours or not
          // if not, include in list
          // if yes do not include it

          // get that right box position in takenPosition variable...
          Map<String, dynamic> takenPosition = positions.lastWhere((element) =>
              element['x'] == pathways['right']![0]['x'] &&
              element['y'] == pathways['right']![0]['y']);

          if (takenPosition['color'] == CharacterColor.black) {
            // this is ours
            // remove this position from list.
            pathways['right']!.removeAt(0);
          } else {
            // this is not ours
            // do nothing...
          }
        }
      }
      // for left positions...
      if (pathways['left'] != null) {
        bool containElement = positions.any((box) =>
            box['x'] == pathways['left']![0]['x'] &&
            box['y'] == pathways['left']![0]['y'] &&
            box['character'] == ChessCharacter.empty &&
            box['color'] == CharacterColor.none);

        if (containElement) {
          // position is available
          pathways['left']!.removeAt(0);
        } else {
          // check if it is ours or not
          // if not, include in list
          // if yes do not include it
          // get that left box position in takenPosition variable...
          Map<String, dynamic> takenPosition = positions.lastWhere((element) =>
              element['x'] == pathways['left']![0]['x'] &&
              element['y'] == pathways['left']![0]['y']);

          if (takenPosition['color'] == CharacterColor.black) {
            // this is ours
            // remove this position from list.
            pathways['left']!.removeAt(0);
          } else {
            // this is not ours
            // do nothing...
          }
        }
      }
      availablePositions = pathways;
    }

    if (chessCharacter == ChessCharacter.blackRook) {
      // 1st solution is
      // make the ordered pathways like for left right top down, they should be in order
      // once they are in ordered, take one side, and iterate them, if it got blocked, stop the itration
      // check if the blocking character is ours or not
      // if ours - do nothing.
      // if not ours - kill it.

      // check if this element has chess character empty or not
      // if empty - add this element to available position list ORDERELY
      // if not empty - element got blocked - do not add anymore(break)
      // check if the blocked element is ours or not.
      // if ours - do nothing
      // if not - kill it and take place

      logicForAllAvailablePositions(
          pathways, availablePositions, positions, CharacterColor.black);
    }

    if (chessCharacter == ChessCharacter.whiteRook) {
      logicForAllAvailablePositions(
          pathways, availablePositions, positions, CharacterColor.white);
    }

    if (chessCharacter == ChessCharacter.blackKnight) {
      logicForAllAvailablePositions(
          pathways, availablePositions, positions, CharacterColor.black);
    }

    if (chessCharacter == ChessCharacter.whiteKnight) {
      logicForAllAvailablePositions(
          pathways, availablePositions, positions, CharacterColor.white);
    }

    if (chessCharacter == ChessCharacter.blackBishop) {
      // print('incoming');
      logicForAllAvailablePositions(
          pathways, availablePositions, positions, CharacterColor.black);
    }

    if (chessCharacter == ChessCharacter.whiteBishop) {
      logicForAllAvailablePositions(
          pathways, availablePositions, positions, CharacterColor.white);
    }

    if (chessCharacter == ChessCharacter.blackQueen) {
      logicForAllAvailablePositions(
          pathways, availablePositions, positions, CharacterColor.black);
    }

    if (chessCharacter == ChessCharacter.whiteQueen) {
      logicForAllAvailablePositions(
          pathways, availablePositions, positions, CharacterColor.white);
    }

    if (chessCharacter == ChessCharacter.blackKing) {
      logicForAllAvailablePositions(
          pathways, availablePositions, positions, CharacterColor.black);
    }

    if (chessCharacter == ChessCharacter.whiteKing) {
      logicForAllAvailablePositions(
          pathways, availablePositions, positions, CharacterColor.white);
    }

    // print('available ${chessCharacter.name} pathways : $availablePositions');

    return availablePositions;
  }

  List<Map<String, int>> getPawnKillRange(
    CharacterColor pawnColor,
    Map<String, int> boxName,
  ) {
    List<Map<String, int>> killRange = [];
    if (pawnColor == CharacterColor.white) {
      if (boxName['y'] == 7) {
        if (checkLocationExists(
            {'x': boxName.values.first + 1, 'y': boxName.values.last - 1})) {
          killRange.add(
              {'x': boxName.values.first + 1, 'y': boxName.values.last - 1});
        }
        if (checkLocationExists(
            {'x': boxName.values.first - 1, 'y': boxName.values.last - 1})) {
          killRange.add(
              {'x': boxName.values.first - 1, 'y': boxName.values.last - 1});
        }

        // pathways.addAll([
        //   {'x': boxName.values.first, 'y': 6},
        //   {'x': boxName.values.first, 'y': 5},
        //   if (checkLocationExists(
        //       {'x': boxName.values.first + 1, 'y': boxName.values.last - 1}))
        //     {'x': boxName.values.first + 1, 'y': boxName.values.last - 1},
        //   if (checkLocationExists(
        //       {'x': boxName.values.first - 1, 'y': boxName.values.last - 1}))
        //     {'x': boxName.values.first - 1, 'y': boxName.values.last - 1}
        // ]);
      }

      if (boxName['y'] != 7) {
        if (boxName['y'] == 1) {
          // no more boxes to visit
          // print('At Top');
        } else {
          // String box = '${int.parse(boxName[1]) + 1}';
          // pathways.add(boxName.replaceRange(1, 1, box));

          if (checkLocationExists(
              {'x': boxName.values.first + 1, 'y': boxName.values.last - 1})) {
            killRange.add(
                {'x': boxName.values.first + 1, 'y': boxName.values.last - 1});
          }
          if (checkLocationExists(
              {'x': boxName.values.first - 1, 'y': boxName.values.last - 1})) {
            killRange.add(
                {'x': boxName.values.first - 1, 'y': boxName.values.last - 1});
          }
        }
      }
    }
    if (pawnColor == CharacterColor.black) {
      if (boxName['y'] == 2) {
        // pathWays
        // boxName.update('y', (value) => value + 1);
        // boxName.update('y', (value) => value + 2);

        if (checkLocationExists(
            {'x': boxName.values.first + 1, 'y': boxName.values.last + 1})) {
          killRange.add(
              {'x': boxName.values.first + 1, 'y': boxName.values.last + 1});
        }
        if (checkLocationExists(
            {'x': boxName.values.first - 1, 'y': boxName.values.last + 1})) {
          killRange.add(
              {'x': boxName.values.first - 1, 'y': boxName.values.last + 1});
        }

        // print('pathways at method : $pathways');

        // pathways.addAll([
        //   {'x': boxName.values.first, 'y': 3},
        //   {'x': boxName.values.first, 'y': 4},
        //   if (checkLocationExists(
        //       {'x': boxName.values.first + 1, 'y': boxName.values.last + 1}))
        //     {'x': boxName.values.first + 1, 'y': boxName.values.last + 1},
        //   if (checkLocationExists(
        //       {'x': boxName.values.first - 1, 'y': boxName.values.last + 1}))
        //     {'x': boxName.values.first - 1, 'y': boxName.values.last + 1}
        // ]);
        // check if someone is already there
      }
      if (boxName['y'] != 2) {
        if (boxName['y'] == 8) {
          // no more boxes to visit
          // later, once we get to the top you have a pop up
          // or something that gives you an option to choose
          // the characters you want to transform to
          //like(queen, rook, knight, bishop).
          // print('At Top');
        } else {
          // String box = '${int.parse(boxName[1]) + 1}';
          // pathways.add(boxName.replaceRange(1, 1, box));
          if (checkLocationExists(
              {'x': boxName.values.first + 1, 'y': boxName.values.last + 1})) {
            killRange.add(
                {'x': boxName.values.first + 1, 'y': boxName.values.last + 1});
          }
          if (checkLocationExists(
              {'x': boxName.values.first - 1, 'y': boxName.values.last + 1})) {
            killRange.add(
                {'x': boxName.values.first - 1, 'y': boxName.values.last + 1});
          }

          // pathways.addAll([
          //   {'x': boxName.values.first, 'y': boxName.values.last + 1},
          //   if (checkLocationExists(
          //       {'x': boxName.values.first + 1, 'y': boxName.values.last + 1}))
          //     {'x': boxName.values.first + 1, 'y': boxName.values.last + 1},
          //   if (checkLocationExists(
          //       {'x': boxName.values.first - 1, 'y': boxName.values.last + 1}))
          //     {'x': boxName.values.first - 1, 'y': boxName.values.last + 1}
          // ]);
        }
      }

      // return pathways;
    }
    return killRange;
  }

  String characterGeneralForm(ChessCharacter chessCharacter) {
    switch (chessCharacter) {
      case ChessCharacter.blackPawn || ChessCharacter.whitePawn:
        return 'pawn';
      case ChessCharacter.blackRook || ChessCharacter.whiteRook:
        return 'rook';
      case ChessCharacter.blackKnight || ChessCharacter.whiteKnight:
        return 'knight';
      case ChessCharacter.blackBishop || ChessCharacter.whiteBishop:
        return 'bishop';
      case ChessCharacter.blackQueen || ChessCharacter.whiteQueen:
        return 'queen';
      case ChessCharacter.blackKing || ChessCharacter.whiteKing:
        return 'king';

      default:
        return 'null';
    }
  }

  Map<String, List<Map<String, int>>> allOpponentKillRange(
    CharacterColor opponentColor,
    List<Map<String, dynamic>> positions,
  ) {
    Map<String, List<Map<String, int>>> allCharacterKillRange = {
      'pawn': [],
      'rook': [],
      'knight': [],
      'bishop': [],
      'queen': [],
      'king': []
    };
    if (opponentColor == CharacterColor.white) {
      positions.forEach((characterMap) {
        if (characterMap['character'] == ChessCharacter.whitePawn) {
          // code for pawn
          allCharacterKillRange.update('pawn', (value) {
            return value
              ..addAll(getPawnKillRange(opponentColor,
                  {'x': characterMap['x'], 'y': characterMap['y']}));
          });
        } else {
          if (whiteCharacter.contains(characterMap['character'])) {
            // print('white character contains : ${characterMap['character']}');
            Map<String, List<Map<String, int>>> killRanges = getAvailableBoxes(
                positions,
                {'x': characterMap['x'], 'y': characterMap['y']},
                characterMap['character']);
            allCharacterKillRange.update(
                characterGeneralForm(characterMap['character']),
                (value) => value
                  ..addAll(
                      killRanges.values.expand((element) => element).toList()));
          } else {
            // print('white does not contain : ${characterMap['character']}');
          }
        }
      });
      return allCharacterKillRange;

      // whiteCharacter.forEach((character) {
      //   if (character == WhiteCharacter.whitePawn) {
      //     // code for pawn
      //     allCharacterKillRange =
      //         getPawnKillRange(opponentColor, chessCharacter, boxName);
      //   }
      //   // else if (character == WhiteCharacter.whiteKing) {
      //   //   // code for king
      //   // }

      //   else {
      //     Map<String, List<Map<String, int>>> killRanges =
      //         getAvailableBoxes(positions, boxName, chessCharacter);
      //     allCharacterKillRange.putIfAbsent(chessCharacter.name,
      //         () => killRanges.values.expand((boxName) => boxName).toList());
      //   }
      // });
    }
    if (opponentColor == CharacterColor.black) {
      positions.forEach((characterMap) {
        if (characterMap['character'] == ChessCharacter.blackPawn) {
          // code for pawn
          allCharacterKillRange.update('pawn', (value) {
            return value
              ..addAll(getPawnKillRange(opponentColor,
                  {'x': characterMap['x'], 'y': characterMap['y']}));
          });
        } else {
          if (blackCharacter.contains(characterMap['character'])) {
            // print('black character contains : ${characterMap['character']}');
            Map<String, List<Map<String, int>>> killRanges = getAvailableBoxes(
              positions,
              {'x': characterMap['x'], 'y': characterMap['y']},
              characterMap['character'],
            );
            // allCharacterKillRange.putIfAbsent(chessCharacter.name,6
            //     () => killRanges.values.expand((boxName) => boxName).toList());

            allCharacterKillRange.update(
                characterGeneralForm(characterMap['character']), (value) {
              return value
                ..addAll(
                    killRanges.values.expand((element) => element).toList());
            });
          } else {
            // print('black do not contains : ${characterMap['character']}');
          }
        }
      });
      return allCharacterKillRange;
    }
    return allCharacterKillRange;
  }

  // bool thisBoxNameIsInKillRangeOfOpponentCharacters(Map<String, int> boxName,
  //     CharacterColor ourColor, List<Map<String, dynamic>> positions) {
  //   late CharacterColor opponentColor;
  //   if (ourColor == CharacterColor.white) {
  //     opponentColor = CharacterColor.black;
  //   } else {
  //     opponentColor = CharacterColor.black;
  //   }

  //   Map<String, List<Map<String, int>>> allKillRange =
  //       allOpponentKillRange(opponentColor, positions);
  //   print('all opponent kill ranges {$opponentColor} : $allKillRange');
  //   return false;
  // }

  bool checkMapInList(
      Map<String, int> target, Map<String, List<Map<String, int>>> source) {
    for (var key in source.keys) {
      for (var map in source[key]!) {
        if (map["x"] == target["x"] && map["y"] == target["y"]) {
          return true;
        }
      }
    }
    return false;
  }

  bool thisBoxNameIsInKillRangeOfOpponentCharacters(
      ChessCharacter king,
      Map<String, int> kingCurrentPosition,
      Map<String, int> boxName,
      CharacterColor ourColor,
      List<Map<String, dynamic>> positions) {
    late CharacterColor opponentColor;
    if (ourColor == CharacterColor.white) {
      opponentColor = CharacterColor.black;
    } else {
      opponentColor = CharacterColor.white;
    }

    List<Map<String, dynamic>> copiedPositions =
        List<Map<String, dynamic>>.from(
            positions.map((i) => Map<String, dynamic>.from(i)));
    int gotoBoxName = copiedPositions.indexWhere((element) =>
        element['x'] == boxName['x'] && element['y'] == boxName['y']);
    int previousBoxName = copiedPositions.indexWhere((element) =>
        element['x'] == kingCurrentPosition['x'] &&
        element['y'] == kingCurrentPosition['y']);

    copiedPositions[gotoBoxName]['character'] = king;
    copiedPositions[gotoBoxName]['color'] = ourColor;
    copiedPositions[previousBoxName]['character'] = ChessCharacter.empty;
    copiedPositions[previousBoxName]['color'] = CharacterColor.none;

    Map<String, List<Map<String, int>>> allKillRange =
        allOpponentKillRange(opponentColor, copiedPositions);
    // print('all opponent kill ranges {$opponentColor} : $allKillRange');

    if (checkMapInList(boxName, allKillRange)) return true;
    return false;
  }

// Map<String, List<Map<String, int>>>
  void getAllowedBoxes(List<Map<String, dynamic>> positions,
      CharacterColor ourColor, Map<String, int> kingCurrentPosition) {}

  Map<String, List<Map<String, int>>> removeMap(
      Map<String, List<Map<String, int>>> mapOfList,
      Map<String, int> mapToRemove) {
    mapOfList.forEach((key, value) {
      value.removeWhere((element) => element == mapToRemove);
    });
    return mapOfList;
  }

  void boxPressed(Map<String, List<Map<String, int>>> characterAvailableBoxes,
      Map<String, int> currentBoxName, List<Map<String, dynamic>> positions) {
    Map<String, List<Map<String, int>>>? newAvailablePathwayForKing;

    // for king illegal moves.....
    if (widget.chessCharacter == ChessCharacter.blackKing ||
        widget.chessCharacter == ChessCharacter.whiteKing) {
      newAvailablePathwayForKing = Map.from(characterAvailableBoxes);

      if (characterAvailableBoxes.isNotEmpty) {
        var characterAvailableBoxesCopy = Map.from(characterAvailableBoxes);

        characterAvailableBoxesCopy.forEach((direction, listOfBoxname) {
          // Create a copy of the list
          var listOfBoxnameCopy = List<Map<String, int>>.from(listOfBoxname);

          for (var boxName in listOfBoxnameCopy) {
            bool boxNameIsNotSafe =
                thisBoxNameIsInKillRangeOfOpponentCharacters(
                    widget.chessCharacter,
                    currentBoxName,
                    boxName,
                    getCharacterColor(currentBoxName, positions),
                    positions);
            if (boxNameIsNotSafe) {
              // print("$boxName is not safe");
              removeMap(newAvailablePathwayForKing!, boxName);
            } else {
              // print("$boxName is safe");
            }
          }
        });
      }
    } else {
      if (characterAvailableBoxes.isNotEmpty) {
        var characterAvailableBoxesCopy = Map.from(characterAvailableBoxes);

        characterAvailableBoxesCopy.forEach((direction, listOfBoxname) {
          // Create a copy of the list
          var listOfBoxnameCopy = List<Map<String, int>>.from(listOfBoxname);

          for (var boxName in listOfBoxnameCopy) {
            List<Map<String, dynamic>> copiedPositions =
                List<Map<String, dynamic>>.from(
                    positions.map((i) => Map<String, dynamic>.from(i)));

            int gotoBoxName = copiedPositions.indexWhere((element) =>
                element['x'] == boxName['x'] && element['y'] == boxName['y']);

            int previousBoxName = copiedPositions.indexWhere((element) =>
                element['x'] == currentBoxName['x'] &&
                element['y'] == currentBoxName['y']);

            copiedPositions[gotoBoxName]['character'] = widget.chessCharacter;
            copiedPositions[gotoBoxName]['color'] =
                getCharacterColor(currentBoxName, copiedPositions);
            copiedPositions[previousBoxName]['character'] =
                ChessCharacter.empty;
            copiedPositions[previousBoxName]['color'] = CharacterColor.none;
          }
        });
      }
    }

    Provider.of<OverAllPositions>(context, listen: false).boxPressed(
        widget.chessCharacter,
        getCharacterColor(widget.boxName, positions),
        newAvailablePathwayForKing ?? characterAvailableBoxes,
        widget.boxName);
  }

  @override
  Widget build(BuildContext context) {
    // final checkPositionEmptyOrNot =
    //     Provider.of<OverAllPositions>(context).checkPositionEmptyOrNot;
    final positions = Provider.of<OverAllPositions>(context).positions;

    return GestureDetector(
      onTap: () {
        Map<String, List<Map<String, int>>> pathways =
            getAvailableBoxes(positions, widget.boxName, widget.chessCharacter);
        // print('${widget.chessCharacter.name} pathways are : $pathways');

        boxPressed(pathways, widget.boxName, positions);
      },
      child: Container(
        decoration: BoxDecoration(
            color: checkColor(widget.boxColor),
            borderRadius: BorderRadius.circular(2),
            border: Border.all(
              width: 1,
              color: Colors.black,
            )),
        child: transformChessCharacterToVectorBase(widget.chessCharacter),
      ),
    );
  }
}
