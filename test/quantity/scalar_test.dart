import 'package:test/test.dart';
import 'package:quantity/quantity.dart';
import 'package:quantity/number.dart';

main() {
  group('Scalar', () {
    test('constructors', () {
      Scalar s = new Scalar(value: 42);
      expect(s, isNotNull);

      s = new Scalar(value: 0);
      expect(s.valueSI, Integer.zero);
      expect(s.valueSI is Integer, true);
      expect(s.dimensions, Scalar.scalarDimensions);
      expect(s.preferredUnits, Scalar.one);
      expect(s.relativeUncertainty, 0);
    });

    test('operator ==/hashCode', () {
      Scalar s1 = new Scalar(value: 11);
      Scalar s2 = new Scalar(value: 0.96);
      Scalar s3 = new Scalar(value: 11.0);
      Scalar s4 = new Scalar(percent: 96);
      Scalar s5 = new Scalar(percent: 0.96);
      Scalar s6 = new Scalar(value: new Imaginary(11));
      Scalar s7 = new Scalar(value: new Complex.coeff(0.96, 0));
      Scalar s8 = new Scalar(value: new Complex.coeff(0, 11));

      expect(s1 == s2, false);
      expect(s1 == s3, true);
      expect(s2 == s4, true);
      expect(s2 == s5, false);
      expect(s4 == s5, false);
      expect(s1 == s6, false);
      expect(s2 == s7, true);
      expect(s6 == s8, true);

      //TODO double hashcodes are NOT unique!!!!  (only do integer part right now)

      expect(s1.hashCode == s2.hashCode, false);
      expect(s1.hashCode == s3.hashCode, true);
      expect(s2.hashCode == s4.hashCode, true);
      expect(s2.hashCode == s5.hashCode, false);
      expect(s4.hashCode == s5.hashCode, false);
      expect(s1.hashCode == s6.hashCode, false);
      expect(s2.hashCode == s7.hashCode, true);
      expect(s6.hashCode == s8.hashCode, true);
    });

    test('operator +', () {
      dynamicQuantityTyping = true;
      Scalar s1 = new Scalar(value: 11);
      Scalar s2 = new Scalar(value: 69);

      var c = s1 + s2;
      expect(c.valueSI.toInt(), 80);
      expect(c.valueSI is Integer, true);
      expect(c is Scalar, true);

      var d = s1 + s2 + s2 + s1;
      expect(d.valueSI == 160, true);
      expect(d.valueSI is Integer, true);
      expect(d is Scalar, true);

      Scalar s3 = new Scalar(value: 34.21);

      var e = s1 + s3;
      expect(e.valueSI == 45.21, true);
      expect(e.valueSI is Double, true);
      expect(e is Scalar, true);

      var f = s3 + s1 + s2 + s3;
      expect(f.valueSI.toDouble(), closeTo(148.42, 0.000001));
      expect(f.valueSI is Double, true);
      expect(f is Scalar, true);

      // Scalar + num
      var g = s1 + 5;
      expect(g is Scalar, true);
      expect(g.valueSI is Integer, true);
      expect(g.valueSI.toDouble(), 16.0);

      g = s1 + 8.3;
      expect(g is Scalar, true);
      expect(g.valueSI is Double, true);
      expect(g.valueSI.toDouble(), 19.3);

      g = s1 + new Integer(7);
      expect(g is Scalar, true);
      expect(g.valueSI is Integer, true);
      expect(g.valueSI.toDouble(), 18.0);

      g = s1 + new Double(21.1);
      expect(g is Scalar, true);
      expect(g.valueSI is Double, true);
      expect(g.valueSI.toDouble(), 32.1);

      g = s1 + new Imaginary(3.8);
      expect(g is Scalar, true);
      expect(g.valueSI is Complex, true);
      expect(g.valueSI.real.toDouble(), 11.0);
      expect(g.valueSI.imag.value.toDouble(), 3.8);

      g = s1 + new Complex(new Double(2.2), new Imaginary(9.3));
      expect(g is Scalar, true);
      expect(g.valueSI is Complex, true);
      expect(g.valueSI.real.toDouble(), 13.2);
      expect(g.valueSI.imag.value.toDouble(), 9.3);

      g = s1 + new Precise("4.0032");
      expect(g is Scalar, true);
      expect(g.valueSI is Precise, true);
      expect(g.valueSI, new Precise("15.0032"));
    });
  });
}
