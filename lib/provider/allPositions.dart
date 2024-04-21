import 'package:flutter/material.dart';

// import '../widget/box.dart';
import '../screen/home.dart';

class OverAllPositions extends ChangeNotifier {
  List<Map<String, dynamic>> _position = [
    {
      'x': 1,
      'y': 8,
      'character': ChessCharacter.whiteRook,
      'color': CharacterColor.white,
      'boardColor': 'white',
      'highlightColor': 'white'
    },
    {
      'x': 2,
      'y': 8,
      'character': ChessCharacter.whiteKnight,
      'color': CharacterColor.white,
      'boardColor': 'black',
      'highlightColor': 'black'
    },
    {
      'x': 3,
      'y': 8,
      'character': ChessCharacter.whiteBishop,
      'color': CharacterColor.white,
      'boardColor': 'white',
      'highlightColor': 'white'
    },
    {
      'x': 4,
      'y': 8,
      'character': ChessCharacter.whiteQueen,
      'color': CharacterColor.white,
      'boardColor': 'black',
      'highlightColor': 'black'
    },
    {
      'x': 5,
      'y': 8,
      'character': ChessCharacter.whiteKing,
      'color': CharacterColor.white,
      'boardColor': 'white',
      'highlightColor': 'white'
    },
    {
      'x': 6,
      'y': 8,
      'character': ChessCharacter.whiteBishop,
      'color': CharacterColor.white,
      'boardColor': 'black',
      'highlightColor': 'black'
    },
    {
      'x': 7,
      'y': 8,
      'character': ChessCharacter.whiteKnight,
      'color': CharacterColor.white,
      'boardColor': 'white',
      'highlightColor': 'white'
    },
    {
      'x': 8,
      'y': 8,
      'character': ChessCharacter.whiteRook,
      'color': CharacterColor.white,
      'boardColor': 'black',
      'highlightColor': 'black'
    },
    for (int i = 1; i <= 8; i++)
      {
        'x': i,
        'y': 7,
        'character': ChessCharacter.whitePawn,
        'color': CharacterColor.white,
        'boardColor': i % 2 == 0 ? 'white' : 'black',
        'highlightColor': i % 2 == 0 ? 'white' : 'black',
      },
    for (int i = 6; i >= 3; i--)
      for (int j = 1; j <= 8; j++)
        {
          'x': j,
          'y': i,
          'character': ChessCharacter.empty,
          'color': CharacterColor.none,
          'boardColor': i % 2 == 0
              ? (j % 2 != 0 ? "white" : 'black')
              : (j % 2 == 0 ? 'white' : 'black'),
          'highlightColor': i % 2 == 0
              ? (j % 2 != 0 ? "white" : 'black')
              : (j % 2 == 0 ? 'white' : 'black'),
        },
    for (int i = 1; i <= 8; i++)
      {
        'x': i,
        'y': 2,
        'character': ChessCharacter.blackPawn,
        'color': CharacterColor.black,
        'boardColor': i % 2 != 0 ? 'white' : 'black',
        'highlightColor': i % 2 != 0 ? 'white' : 'black',
      },
    {
      'x': 1,
      'y': 1,
      'character': ChessCharacter.blackRook,
      'color': CharacterColor.black,
      'boardColor': 'black',
      'highlightColor': 'black'
    },
    {
      'x': 2,
      'y': 1,
      'character': ChessCharacter.blackKnight,
      'color': CharacterColor.black,
      'boardColor': 'white',
      'highlightColor': 'white'
    },
    {
      'x': 3,
      'y': 1,
      'character': ChessCharacter.blackBishop,
      'color': CharacterColor.black,
      'boardColor': 'black',
      'highlightColor': 'black'
    },
    {
      'x': 4,
      'y': 1,
      'character': ChessCharacter.blackQueen,
      'color': CharacterColor.black,
      'boardColor': 'white',
      'highlightColor': 'white'
    },
    {
      'x': 5,
      'y': 1,
      'character': ChessCharacter.blackKing,
      'color': CharacterColor.black,
      'boardColor': 'black',
      'highlightColor': 'black'
    },
    {
      'x': 6,
      'y': 1,
      'character': ChessCharacter.blackBishop,
      'color': CharacterColor.black,
      'boardColor': 'white',
      'highlightColor': 'white'
    },
    {
      'x': 7,
      'y': 1,
      'character': ChessCharacter.blackKnight,
      'color': CharacterColor.black,
      'boardColor': 'black',
      'highlightColor': 'black'
    },
    {
      'x': 8,
      'y': 1,
      'character': ChessCharacter.blackRook,
      'color': CharacterColor.black,
      'boardColor': 'white',
      'highlightColor': 'white'
    },
  ];

  Map<String, List<ChessCharacter>> killedCharacters = {
    'black': [],
    'white': []
  };
  List<Map<String, dynamic>> get positions {
    return [..._position];
  }

  ChessCharacter activeCharacter = ChessCharacter.empty;
  CharacterColor activeCharacterColor = CharacterColor.none;
  Map<String, List<Map<String, int>>> activePathways = {};
  Map<String, int> activeBoxName = {};
  bool _isWhite = true;

  void reset() {
    activeCharacter = ChessCharacter.empty;
    activeCharacterColor = CharacterColor.none;
    activePathways = {};
    activeBoxName = {};
  }

  void restartTheGame() {
    _position = [
      {
        'x': 1,
        'y': 8,
        'character': ChessCharacter.whiteRook,
        'color': CharacterColor.white,
        'boardColor': 'white',
        'highlightColor': 'white'
      },
      {
        'x': 2,
        'y': 8,
        'character': ChessCharacter.whiteKnight,
        'color': CharacterColor.white,
        'boardColor': 'black',
        'highlightColor': 'black'
      },
      {
        'x': 3,
        'y': 8,
        'character': ChessCharacter.whiteBishop,
        'color': CharacterColor.white,
        'boardColor': 'white',
        'highlightColor': 'white'
      },
      {
        'x': 4,
        'y': 8,
        'character': ChessCharacter.whiteQueen,
        'color': CharacterColor.white,
        'boardColor': 'black',
        'highlightColor': 'black'
      },
      {
        'x': 5,
        'y': 8,
        'character': ChessCharacter.whiteKing,
        'color': CharacterColor.white,
        'boardColor': 'white',
        'highlightColor': 'white'
      },
      {
        'x': 6,
        'y': 8,
        'character': ChessCharacter.whiteBishop,
        'color': CharacterColor.white,
        'boardColor': 'black',
        'highlightColor': 'black'
      },
      {
        'x': 7,
        'y': 8,
        'character': ChessCharacter.whiteKnight,
        'color': CharacterColor.white,
        'boardColor': 'white',
        'highlightColor': 'white'
      },
      {
        'x': 8,
        'y': 8,
        'character': ChessCharacter.whiteRook,
        'color': CharacterColor.white,
        'boardColor': 'black',
        'highlightColor': 'black'
      },
      for (int i = 1; i <= 8; i++)
        {
          'x': i,
          'y': 7,
          'character': ChessCharacter.whitePawn,
          'color': CharacterColor.white,
          'boardColor': i % 2 == 0 ? 'white' : 'black',
          'highlightColor': i % 2 == 0 ? 'white' : 'black',
        },
      for (int i = 6; i >= 3; i--)
        for (int j = 1; j <= 8; j++)
          {
            'x': j,
            'y': i,
            'character': ChessCharacter.empty,
            'color': CharacterColor.none,
            'boardColor': i % 2 == 0
                ? (j % 2 != 0 ? "white" : 'black')
                : (j % 2 == 0 ? 'white' : 'black'),
            'highlightColor': i % 2 == 0
                ? (j % 2 != 0 ? "white" : 'black')
                : (j % 2 == 0 ? 'white' : 'black'),
          },
      for (int i = 1; i <= 8; i++)
        {
          'x': i,
          'y': 2,
          'character': ChessCharacter.blackPawn,
          'color': CharacterColor.black,
          'boardColor': i % 2 != 0 ? 'white' : 'black',
          'highlightColor': i % 2 != 0 ? 'white' : 'black',
        },
      {
        'x': 1,
        'y': 1,
        'character': ChessCharacter.blackRook,
        'color': CharacterColor.black,
        'boardColor': 'black',
        'highlightColor': 'black'
      },
      {
        'x': 2,
        'y': 1,
        'character': ChessCharacter.blackKnight,
        'color': CharacterColor.black,
        'boardColor': 'white',
        'highlightColor': 'white'
      },
      {
        'x': 3,
        'y': 1,
        'character': ChessCharacter.blackBishop,
        'color': CharacterColor.black,
        'boardColor': 'black',
        'highlightColor': 'black'
      },
      {
        'x': 4,
        'y': 1,
        'character': ChessCharacter.blackQueen,
        'color': CharacterColor.black,
        'boardColor': 'white',
        'highlightColor': 'white'
      },
      {
        'x': 5,
        'y': 1,
        'character': ChessCharacter.blackKing,
        'color': CharacterColor.black,
        'boardColor': 'black',
        'highlightColor': 'black'
      },
      {
        'x': 6,
        'y': 1,
        'character': ChessCharacter.blackBishop,
        'color': CharacterColor.black,
        'boardColor': 'white',
        'highlightColor': 'white'
      },
      {
        'x': 7,
        'y': 1,
        'character': ChessCharacter.blackKnight,
        'color': CharacterColor.black,
        'boardColor': 'black',
        'highlightColor': 'black'
      },
      {
        'x': 8,
        'y': 1,
        'character': ChessCharacter.blackRook,
        'color': CharacterColor.black,
        'boardColor': 'white',
        'highlightColor': 'white'
      },
    ];

    killedCharacters = {'black': [], 'white': []};

    reset();
    _isWhite = true;
    notifyListeners();
  }

  void _killCharacter(Map<String, int> boxName) {
    // opponent is present in this boxName, and below code is to kill that opponent,
    // not to change places.
    int indexOfPosition = getPositionElementIndexUsingCoordinates(boxName);
    if (_position[indexOfPosition]['color'] == CharacterColor.white) {
      killedCharacters.update('white', (value) {
        value.add(positions[indexOfPosition]['character']);
        return value;
      });
    } else {
      killedCharacters.update('black', (value) {
        value.add(positions[indexOfPosition]['character']);
        return value;
      });
    }
    // print("killedCharacters : $killedCharacters");
  }

  bool checkPositionEmptyOrNot(Map<String, int> targetPosition) {
    // get that right box position in takenPosition variable...
    Map<String, dynamic> takenPosition = _position.firstWhere((element) =>
        element['x'] == targetPosition['x'] &&
        element['y'] == targetPosition['y']);

    if (takenPosition['character'] == ChessCharacter.empty) {
      return true;
    } else {
      return false;
    }
  }

  // click the character
  // check- when inplace of character user press empty or opponent character then nothing happens-vibration happens
  // highlight the available boxes
  // checks-
  // when click on outside of highlight boxes-do not move and give a vibration(signaling the error)
  // when click other character with same team, the highlight changes to that character.
  // when click opponent character when our character is in highlighted mode, do not move just vibrate.
  // when click on the same(current) position-do not move and un-highlight the boxes
  // on the last available box(that is also the last highlighted box) check if there is a character or the box is empty
  // if character(must be opponent) is there-highlight the box with red color
  // if empty - do nothing-just highlight normally
  // when changing the place-
  //checks-
  // if there is a character or not.
  // if yes- delete that character and put current character into opponent character place in position list
  // if not- update the position list

  // logic for turn
  // cannot press opponent character till the turn of our character is not over.
  // when our character has been moved, then only i can give opponent a turn.

  void toggleTurn() {
    _isWhite = !_isWhite;
  }

  // this boxname is present in this pathways or not...
  bool containsBox(
      Map<String, List<Map<String, int>>> pathways, Map<String, int> boxName) {
    // print('contain box pathways : $pathways');
    // print('contain box boxname : $boxName');
    for (var entry in pathways.entries) {
      for (var box in entry.value) {
        // print('box : $box');
        // print('boxname : $boxName');
        if (box['x'] == boxName['x'] && box['y'] == boxName['y']) {
          return true;
        }
      }
    }
    return false;
  }

  int getPositionElementIndexUsingCoordinates(Map<String, int> coordinates) {
    return positions.indexWhere((element) =>
        element['x'] == coordinates['x'] && element['y'] == coordinates['y']);
  }

  void moveCharacter(Map<String, int> moveInThisBox) {
    int thisBoxIndexInPosition =
        getPositionElementIndexUsingCoordinates(moveInThisBox);
    int indexOfPreviousBox =
        getPositionElementIndexUsingCoordinates(activeBoxName);

    positions[thisBoxIndexInPosition]['character'] = activeCharacter;
    positions[thisBoxIndexInPosition]['color'] = activeCharacterColor;

    // remove from old position

    positions[indexOfPreviousBox]['character'] = ChessCharacter.empty;
    positions[indexOfPreviousBox]['color'] = CharacterColor.none;

    _isWhite = !_isWhite;
  }

  void boxPressed(ChessCharacter character, CharacterColor characterColor,
      Map<String, List<Map<String, int>>> pathways, Map<String, int> boxName) {
    if (characterColor == CharacterColor.white && _isWhite != true) {
      if (containsBox(activePathways, boxName)) {
      } else {
        return;
      }
      // give some sort of message to the users that this action is invalid
      // try to give them a warning using vibration
    }
    if (characterColor == CharacterColor.black && _isWhite == true) {
      if (containsBox(activePathways, boxName)) {
      } else {
        return;
      }
      // give some sort of message to the users that this action is invalid
      // try to give them a warning using vibration
    }

    if (containsBox(activePathways, boxName)) {
      // print('reached empty box logic');
      // if this box is included in pathways(meaning time to move)
      // if true- unhighlight all pathways and move the character.
      // if not included - random box has been pressed
      // in that case- do nothing just vibrate

      // included in pathways
      // meaning time to move
      // print('included in pathways');

      // check if there any character or not(must be opponent)
      if (checkPositionEmptyOrNot(boxName)) {
        // print('safe box');
        // print('character: $character');
        // print('characterColor : $characterColor');
        // print('activeCharacter: $activeCharacter');
        // print('activeCharacterColor: $activeCharacterColor');
        // no characer- safe box to travel
        // first un-highlight all pathways then move the character
        // remove highlights from positions
        unHighlightBoxes();
        moveCharacter(boxName);
        reset();
      } else {
        // print('not safe box');
        // opponent is present
        unHighlightBoxes();
        _killCharacter(boxName);
        moveCharacter(boxName);
      }
    }

    // if (characterColor != activeCharacterColor) {
    //   // check if this character in kill range(present in pathway)
    //   // if yes- kill code
    //   // if no- do nothing just vibrate
    // }
    else if ((activeBoxName['x'] != boxName['x'] ||
            activeBoxName['y'] != boxName['y']) &&
        characterColor == activeCharacterColor) {
      // pressed different but our team character
      // unhighlight the current character(its pathways unhighlight them) and highlight the new character.
      // change active character (color must be same)

      // print('teammate pressed');

      unHighlightBoxes();
      reset();
      highlightCharacter(pathways);

      activePathways = pathways;
      activeBoxName = boxName;
      activeCharacter = character;
      activeCharacterColor = characterColor;
    } else if (character != activeCharacter &&
        characterColor != activeCharacterColor) {
      // pressed independent character to move.
      // (executes when move the 1st character in the game)
      // print('character: $character');
      // print('characterColor : $characterColor');
      // print('activeCharacter: $activeCharacter');
      // print('activeCharacterColor: $activeCharacterColor');

      // print('independent pressed');

      highlightCharacter(pathways);

      activePathways = pathways;
      activeBoxName = boxName;
      activeCharacter = character;
      activeCharacterColor = characterColor;
      // print('active pathways : $activePathways');
    } else if (character == activeCharacter &&
        activeBoxName['x'] == boxName['x'] &&
        activeBoxName['y'] == boxName['y']) {
      // same character pressed
      // un-highlight the boxes

      // print('double tap');

      unHighlightBoxes();

      reset();
    }

    notifyListeners();
  }

  void highlightCharacter(
      Map<String, List<Map<String, int>>> boxesToHighlight) {
    // _position.asMap().forEach((Positionindex, PositionMap) {
    boxesToHighlight.forEach((direction, boxes) {
      // boxes.forEach((box) {
      //   if(box['x'] == map['x'] && box['y'] == map['y']) {
      //     _position[Positionindex]['color'] =
      //   }

      for (int index = 0; index < boxes.length; index++) {
        if (boxes.length == index + 1) {
          // these available boxes need cheaking if they are empty or not
          // if not- color them with red
          // if yes- color them with blue

          bool emptyOrNot = checkPositionEmptyOrNot(boxes[index]);

          if (emptyOrNot) {
            _position[getPositionElementIndexUsingCoordinates(boxes[index])]
                ['highlightColor'] = 'blue';
          } else {
            _position[getPositionElementIndexUsingCoordinates(boxes[index])]
                ['highlightColor'] = 'red';
          }
        } else {
          // these available boxes are empty thats why this code change thier color to blue
          // if (boxes[index]['x'] == PositionMap['x'] &&
          //     boxes[index]['y'] == PositionMap['y']) {
          _position[getPositionElementIndexUsingCoordinates(boxes[index])]
              ['highlightColor'] = 'blue';
          // }
        }
      }
    });
    // });
  }

  void unHighlightBoxes() {
    activePathways.forEach((key, value) {
      value.forEach((pathwayElement) {
        int indexOfPositionElement = positions.indexWhere(
          (positionElement) =>
              positionElement['x'] == pathwayElement['x'] &&
              positionElement['y'] == pathwayElement['y'],
        );

        _position[indexOfPositionElement]['highlightColor'] =
            _position[indexOfPositionElement]['boardColor'];
      });
    });
  }
}
