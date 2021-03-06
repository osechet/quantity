part of quantity_si;

/// The rate of change of speed of an object.
///
/// See the [Wikipedia entry for Acceleration](https://en.wikipedia.org/wiki/Acceleration)
/// for more information.
///
class Acceleration extends Quantity {
  /// Dimensions for this type of quantity
  static const Dimensions accelerationDimensions =
      const Dimensions.constant(const <String, int>{'Length': 1, 'Time': -2}, qType: Acceleration);

  /// The standard SI unit.
  static final AccelerationUnits metersPerSecondSquared =
      new AccelerationUnits.lengthTimeUnits(Length.meters, Time.seconds);

  /// Construct an Acceleration with meters per second squared.
  ///
  /// Optionally specify a relative standard [uncert]ainty.
  ///
  Acceleration({dynamic metersPerSecondSquared, double uncert = 0.0})
      : super(metersPerSecondSquared ?? 0.0, Acceleration.metersPerSecondSquared, uncert);

  Acceleration._internal(dynamic conv) : super._internal(conv, Acceleration.accelerationDimensions);

  /// Constructs a Acceleration based on the [value]
  /// and the conversion factor intrinsic to the passed [units].
  ///
  Acceleration.inUnits(dynamic value, AccelerationUnits units, [double uncert = 0.0])
      : super(value, units ?? Acceleration.metersPerSecondSquared, uncert);

  const Acceleration.constant(Number valueSI, {AccelerationUnits units, double uncert = 0.0})
      : super.constant(valueSI, Acceleration.accelerationDimensions, units, uncert);
}

/// Units acceptable for use in describing Acceleration quantities.
///
class AccelerationUnits extends Acceleration with Units {
  /// Constructs a new instance.
  AccelerationUnits(String name, String abbrev1, String abbrev2, String singular, dynamic conv,
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

  /// Constructs a new instance based on length and time units.
  AccelerationUnits.lengthTimeUnits(LengthUnits lu, TimeUnits su) : super._internal(lu.valueSI * su.valueSI) {
    name = '${lu.name} per ${su.singular} squared';
    singular = '${lu.singular} per ${su.singular} squared';
    _convToMKS = lu.valueSI * su.valueSI;
    _abbrev1 = lu._abbrev1 != null && su._abbrev1 != null ? '${lu._abbrev1} / ${su._abbrev1}' : null;
    _abbrev2 = lu._abbrev2 != null && su._abbrev2 != null ? '${lu._abbrev2}${su._abbrev2}' : null;
    metricBase = metricBase;
    offset = offset.toDouble();
  }

  /// Returns the Type of the Quantity to which these Units apply
  @override
  Type get quantityType => Acceleration;

  /// Derive new AccelerationUnits using this AccelerationUnits object as the base.
  @override
  Units derive(String fullPrefix, String abbrevPrefix, double conv) =>
     new AccelerationUnits(
        '$fullPrefix$name',
        _abbrev1 != null ? '$abbrevPrefix$_abbrev1' : null,
        _abbrev2 != null ? '$abbrevPrefix$_abbrev2' : null,
        '$fullPrefix$singular',
        valueSI * conv,
        false,
        offset);
  
}
