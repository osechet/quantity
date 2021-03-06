part of quantity_si;

/// A two-dimensional angle in three-dimensional space that an object subtends at a point.
///
/// See the [Wikipedia entry for Solid angle](https://en.wikipedia.org/wiki/Solid_angle)
/// for more information.
///
class SolidAngle extends Quantity {
  /// Dimensions for this type of quantity
  static const Dimensions solidAngleDimensions =
      const Dimensions.constant(const <String, int>{'Solid Angle': 1}, qType: SolidAngle);

  /// The standard SI unit.
  static final SolidAngleUnits steradians = new SolidAngleUnits('steradians', null, 'sr', null, 1.0, true);

  /// Construct a SolidAngle with steradians ([sr]).
  ///
  /// Optionally specify a relative standard [uncert]ainty.
  ///
  SolidAngle({dynamic sr, double uncert = 0.0}) : super(sr ?? 0.0, SolidAngle.steradians, uncert);

  SolidAngle._internal(dynamic conv) : super._internal(conv, SolidAngle.solidAngleDimensions);

  // CONSTRUCTORS
  SolidAngle.inUnits(dynamic value, SolidAngleUnits units, [double uncert = 0.0])
      : super(value, units ?? SolidAngle.steradians, uncert);

  const SolidAngle.constant(Number value, [SolidAngleUnits units])
      : super.constant(value, SolidAngle.solidAngleDimensions, units, 0.0);
}

/// Units acceptable for use in describing SolidAngle quantities.
///
class SolidAngleUnits extends SolidAngle with Units {
  /// Constructs a new instance.
  SolidAngleUnits(String name, String abbrev1, String abbrev2, String singular, dynamic conv,
      [bool metricBase = false, num offset = 0.0])
      : super._internal(conv) {
    this.name = name;
    this.singular = singular;
    _convToMKS = objToNumber(conv);
    _abbrev1 = abbrev1;
    _abbrev2 = abbrev2;
    this.metricBase = metricBase;
    this.offset = offset.toDouble();
  }

  /// Constructs a new instance based on angle units.
  SolidAngleUnits.angleUnits(AngleUnits au) : super._internal(au.valueSI * au.valueSI) {
    name = '${au.name} squared';
    singular = '${au.singular} squared';
    _convToMKS = au.valueSI * au.valueSI;
    _abbrev1 = au._abbrev1 != null ? '${au._abbrev1}^2' : null;
    _abbrev2 = au._abbrev2 != null ? '${au._abbrev2}^2' : null;
    metricBase = metricBase;
    offset = offset.toDouble();
  }

  /// Returns the Type of the Quantity to which these Units apply
  @override
  Type get quantityType => SolidAngle;

  /// Derive new SolidAngleUnits using this SolidAngleUnits object as the base.
  @override
  Units derive(String fullPrefix, String abbrevPrefix, double conv) => new SolidAngleUnits(
      '$fullPrefix$name',
      _abbrev1 != null ? '$abbrevPrefix$_abbrev1' : null,
      _abbrev2 != null ? '$abbrevPrefix$_abbrev2' : null,
      '$fullPrefix$singular',
      valueSI * conv,
      false,
      offset);
}
