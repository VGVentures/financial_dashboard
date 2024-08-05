import 'package:financial_dashboard/demo/demo.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Transaction', () {
    test('supports value equality', () {
      const pointA = Transaction(
        type: TransactionType.income,
        title: 'test-title',
        amount: 'test-amount',
      );
      const secondPointA = Transaction(
        type: TransactionType.income,
        title: 'test-title',
        amount: 'test-amount',
      );
      const pointB = Transaction(
        type: TransactionType.expense,
        title: 'test-title-two',
        amount: 'test-amount-two',
      );

      expect(pointA, equals(secondPointA));
      expect(pointA, isNot(equals(pointB)));
    });
  });
}
