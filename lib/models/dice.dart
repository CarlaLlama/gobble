import 'package:flutter/material.dart';

import 'die.dart';

class Dice {
  const Dice();

  final List<Die> dice = const<Die>[
    const Die(
      id: 1,
      sides: {
        1: 'R',
        2: 'I',
        3: 'F',
        4: 'O',
        5: 'B',
        6: 'X'
      }
    ),
    const Die(
        id: 2,
        sides: {
          1: 'I',
          2: 'F',
          3: 'E',
          4: 'H',
          5: 'E',
          6: 'Y'
        }
    ),
    const Die(
        id: 3,
        sides: {
          1: 'D',
          2: 'E',
          3: 'N',
          4: 'O',
          5: 'W',
          6: 'S'
        }
    ),
    const Die(
        id: 4,
        sides: {
          1: 'U',
          2: 'T',
          3: 'O',
          4: 'K',
          5: 'N',
          6: 'D'
        }
    ),
    const Die(
        id: 5,
        sides: {
          1: 'H',
          2: 'M',
          3: 'S',
          4: 'R',
          5: 'A',
          6: 'O'
        }
    ),
    const Die(
        id: 6,
        sides: {
          1: 'L',
          2: 'U',
          3: 'P',
          4: 'E',
          5: 'T',
          6: 'S'
        }
    ),
    const Die(
        id: 7,
        sides: {
          1: 'A',
          2: 'C',
          3: 'I',
          4: 'T',
          5: 'O',
          6: 'A'
        }
    ),
    const Die(
        id: 8,
        sides: {
          1: 'Y',
          2: 'L',
          3: 'G',
          4: 'K',
          5: 'U',
          6: 'E'
        }
    ),
    const Die(
        id: 9,
        sides: {
          1: 'Q',
          2: 'B',
          3: 'M',
          4: 'J',
          5: 'O',
          6: 'A'
        }
    ),
    const Die(
        id: 10,
        sides: {
          1: 'E',
          2: 'H',
          3: 'I',
          4: 'S',
          5: 'P',
          6: 'N'
        }
    ),
    const Die(
        id: 11,
        sides: {
          1: 'V',
          2: 'E',
          3: 'T',
          4: 'I',
          5: 'G',
          6: 'N'
        }
    ),
    const Die(
        id: 12,
        sides: {
          1: 'B',
          2: 'A',
          3: 'L',
          4: 'I',
          5: 'Y',
          6: 'T'
        }
    ),
    const Die(
        id: 13,
        sides: {
          1: 'E',
          2: 'Z',
          3: 'A',
          4: 'V',
          5: 'N',
          6: 'D'
        }
    ),
    const Die(
        id: 14,
        sides: {
          1: 'R',
          2: 'A',
          3: 'L',
          4: 'E',
          5: 'S',
          6: 'C'
        }
    ),
    const Die(
        id: 15,
        sides: {
          1: 'U',
          2: 'W',
          3: 'I',
          4: 'L',
          5: 'R',
          6: 'G'
        }
    ),
    const Die(
        id: 16,
        sides: {
          1: 'P',
          2: 'A',
          3: 'C',
          4: 'E',
          5: 'M',
          6: 'D'
        }
    )
  ];
}