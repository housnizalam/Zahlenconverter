// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_application_1/functions.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';

void main() {
  test('string zu list', () {
    expect(stringZuListInt('0'), [0]);
    expect(stringZuListInt('0,5,7,4,6,8'), [0, 5, 7, 4, 6, 8]);
  });

  test('binaere zu dezimal', () {
    expect(binaereZuDezimal('0'), 0);
    expect(binaereZuDezimal('1'), 1);
    expect(binaereZuDezimal('0000'), 0);
    expect(binaereZuDezimal('00001'), 1);
    expect(binaereZuDezimal('10'), 2);
    expect(binaereZuDezimal('11'), 3);
    expect(binaereZuDezimal('100'), 4);
    expect(binaereZuDezimal('111'), 7);
  });

  test('dezimal zu binaere', () {
    expect(dezimalZuBinaere('0'), [0]);
    expect(dezimalZuBinaere('1'), [1]);
    expect(dezimalZuBinaere('2'), [1, 0]);
    expect(dezimalZuBinaere('3'), [1, 1]);
    expect(dezimalZuBinaere('4'), [1, 0, 0]);
    expect(dezimalZuBinaere('5'), [1, 0, 1]);
    expect(dezimalZuBinaere('6'), [1, 1, 0]);
    expect(dezimalZuBinaere('7'), [1, 1, 1]);
  });
  test('String zu List dynamic', () {
    expect(stringZuListString('0'), ['0']);
    expect(stringZuListString('A'), ['A']);
    expect(stringZuListString('A3'), ['A', '3']);
    expect(stringZuListString('A3D7'), ['A', '3', 'D', '7']);
  });
  test('Hexa zu binary', () {
    expect(hexaZuBinaery('0'), [0]);
    expect(hexaZuBinaery('1'), [1]);
    expect(hexaZuBinaery('2'), [1, 0]);
    expect(hexaZuBinaery('A'), [1, 0, 1, 0]);
    expect(hexaZuBinaery('A1'), [1, 0, 1, 0, 0, 0, 0, 1]);
  });

  test('Binary zu Hexa', () {
    expect(binaeryZuHexa('0'), ['0']);
    expect(binaeryZuHexa('1'), ['1']);
    expect(binaeryZuHexa('1010'), ['A']);
    expect(binaeryZuHexa('10111010'), ['B', 'A']);
    expect(binaeryZuHexa('[000010111010'), ['B', 'A']);
  });

  test('Hexa zu Dezimal', () {
    expect(heaxaZuDezimal('0'), 0);
    expect(heaxaZuDezimal('1'), 1);
    expect(heaxaZuDezimal('7'), 7);
    expect(heaxaZuDezimal('A'), 10);
    expect(heaxaZuDezimal('1A'), 26);
  });
  test('Dezimal zu Hexa', () {
    expect(dezimalZuHexa('0'), ['0']);
    expect(dezimalZuHexa('1'), ['1']);
    expect(dezimalZuHexa('8'), ['8']);
    expect(dezimalZuHexa('15'), ['F']);
    expect(dezimalZuHexa('31'), ['1', 'F']);
  });
  test('Dezimal freundlich', () {
    expect(dezimalFreundlich('0'), true);
    expect(dezimalFreundlich(' '), false);
    expect(dezimalFreundlich('856565bh'), false);
    expect(dezimalFreundlich('856565'), true);
  });
  test('Binaer freundlich', () {
    expect(binaerFreundlich('0'), true);
    expect(binaerFreundlich(' '), false);
    expect(binaerFreundlich('856565bh'), false);
    expect(binaerFreundlich('101010100001'), true);
  });
  test('Hexa freundlich', () {
    expect(hexaFreundlich('0'), true);
    expect(hexaFreundlich(' '), false);
    expect(hexaFreundlich('856565bh'), false);
    expect(hexaFreundlich('101010100001'), true);
    expect(hexaFreundlich('856565ABFF'), true);
  });
}
