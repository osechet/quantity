import 'package:test/test.dart';
import 'package:quantity/quantity.dart';
import 'package:quantity/quantity_range.dart';

main() {
  group('QuantityRange', () {
    test('constructors', () {
      QuantityRange<Scalar> range = new QuantityRange<Scalar>(
          new Scalar(value: 5), new Scalar(value: 23.3));
      expect(range, isNotNull);
      expect(range.q1 == new Scalar(value: 5), true);
      expect(range.q2 == new Scalar(value: 23.3), true);
    });

    test('min/max values', () {
      QuantityRange<Scalar> range = new QuantityRange<Scalar>(
          new Scalar(value: 15.2), new Scalar(value: -1003.3));
      expect(range.minValue == new Scalar(value: -1003.3), true);
      expect(range.maxValue == new Scalar(value: 15.2), true);

      range = new QuantityRange<Scalar>(
          new Scalar(value: -1003.3), new Scalar(value: 15.2));
      expect(range.minValue == new Scalar(value: -1003.3), true);
      expect(range.maxValue == new Scalar(value: 15.2), true);

      QuantityRange<Length> range2 =
          new QuantityRange<Length>(new Length(m: 10000), new Length(km: 1000));
      expect(
          areWithin(range2.minValue, new Length(km: 10), new Length(m: 0.001)),
          true);
      expect(range2.maxValue == new Length(km: 1000), true);
    });
  });
}