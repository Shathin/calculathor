// Unit Testing the computation functions

import 'package:calculathor/services/computation_functions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('addition', () {
    test('1 + 2', () => expect(addition('1', '2'), 3));
    test('1.1 + 2', () => expect(addition('1.1', '2'), 3.1));
    test('1 + 2.1', () => expect(addition('1', '2.1'), 3.1));
    test('1.1 + 2.2', () => expect(addition('1.1', '2.2'), 3.3));
    test('1 + 0', () => expect(addition('1', '0'), 1));
  });
  group('subtraction', () {
    test('1 - 2', () => expect(subtraction('1', '2'), -1));
    test('1.1 - 2', () => expect(subtraction('1.1', '2'), -0.8999999999999999));
    test('1 - 2.1', () => expect(subtraction('1', '2.1'), -1.1));
    test('0 - 1', () => expect(subtraction('0', '1'), -1));
    test('1 - 0', () => expect(subtraction('1', '0'), 1));
  });
  group('multiplication', () {
    test('1 * 0', () => expect(multiplication('1', '0'), 0));
    test('1 * 1', () => expect(multiplication('1', '1'), 1));
    test('1 * 1', () => expect(multiplication('12', '10'), 120));
    test('1.1 * 2', () => expect(multiplication('1.1', '2'), 2.2));
    test(
        '13.2 * 112.4', () => expect(multiplication('13.2', '112.4'), 1483.68));
  });
  group('division', () {
    test('1 ÷ 1', () => expect(division('1', '1'), 1));
    test('1 ÷ 0', () => expect(division('1', '0'), double.infinity));
    test('0 ÷ 0', () => expect(division('0', '0'), isNaN));
    test('0 ÷ 1', () => expect(division('0', '1'), 0));
    test('1 ÷ 2', () => expect(division('1', '2'), 0.5));
    test('10 ÷ 5', () => expect(division('10', '5'), 2));
  });
  group('square root', () {
    test('√1', () => expect(squareRoot('1'), 1));
    test('√4', () => expect(squareRoot('4'), 2));
    test('√0.25', () => expect(squareRoot('0.25'), 0.5));
  });
  group('factorial', () {
    test('0!', () => expect(factorial('0'), 1));
    test('1!', () => expect(factorial('1'), 1));
    test('5!', () => expect(factorial('5'), 120));
    test('1.1!', () => expect(factorial('1.1'), isNaN));
  });
  group('natural logarithm', () {
    test('ln(0)', () => expect(naturalLog('0'), double.negativeInfinity));
    test('ln(1)', () => expect(naturalLog('1'), 0));
    test('ln(2)', () => expect(naturalLog('2'), 0.6931471805599453));
  });
  group('power', () {
    test('0^0', () => expect(power('0', '0'), 1));
    test('0^1', () => expect(power('0', '1'), 0));
    test('1^0', () => expect(power('1', '0'), 1));
    test('2^5', () => expect(power('2', '5'), 32));
    test('2.2^4.4', () => expect(power('2.2', '4.4'), 32.111441048903984));
  });
}
