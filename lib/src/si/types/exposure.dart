part of quantity_si;

/// The radiant energy received by a surface per unit area.
///
/// See the [Wikipedia entry for Radiant exposure](https://en.wikipedia.org/wiki/Radiant_exposure)
/// for more information.
///
class Exposure extends Quantity {
  /// Dimensions for this type of quantity
  static const Dimensions exposureDimensions =
      const Dimensions.constant(const <String, int>{'Current': 1, 'Mass': -1, 'Time': 1}, qType: Exposure);

  /// The standard SI unit.
  static final ExposureUnits coulombsPerKilogram = new ExposureUnits.chargeMass(Charge.coulombs, Mass.kilograms);

  /// Accepted for use with the SI, subject to further review.
  static final ExposureUnits roentgens = new ExposureUnits('roentgens', null, 'R', null, 2.58e-4, false);

  /// Construct an Exposure with coulombs per kilogram or roentgens ([R]).
  ///
  /// Optionally specify a relative standard [uncert]ainty.
  ///
  Exposure({dynamic coulombsPerKilogram, dynamic R, double uncert = 0.0})
      : super(coulombsPerKilogram ?? (R ?? 0.0), R != null ? Exposure.roentgens : Exposure.coulombsPerKilogram, uncert);

  Exposure._internal(dynamic conv) : super._internal(conv, Exposure.exposureDimensions);

  /// Constructs a Exposure based on the [value]
  /// and the conversion factor intrinsic to the passed [units].
  ///
  Exposure.inUnits(dynamic value, ExposureUnits units, [double uncert = 0.0])
      : super(value, units ?? Exposure.coulombsPerKilogram, uncert);

  const Exposure.constant(Number valueSI, {ExposureUnits units, double uncert = 0.0})
      : super.constant(valueSI, Exposure.exposureDimensions, units, uncert);
}

/// Units acceptable for use in describing Exposure quantities.
///
class ExposureUnits extends Exposure with Units {
  /// Constructs a new instance.
  ExposureUnits(String name, String abbrev1, String abbrev2, String singular, dynamic conv,
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

  /// Constructs a new instance based on charge and mass units.
  ExposureUnits.chargeMass(ChargeUnits ecu, MassUnits mu) : super._internal(ecu.valueSI * mu.valueSI) {
    name = '${ecu.name} per ${mu.singular}';
    singular = '${ecu.singular} per ${mu.singular}';
    _convToMKS = ecu.valueSI * mu.valueSI;
    _abbrev1 = ecu._abbrev1 != null && mu._abbrev1 != null ? '${ecu._abbrev1} / ${mu._abbrev1}' : null;
    _abbrev2 = ecu._abbrev2 != null && mu._abbrev2 != null ? '${ecu._abbrev2}${mu._abbrev2}' : null;
    metricBase = false;
    offset = 0.0;
  }

  /// Returns the Type of the Quantity to which these Units apply
  @override
  Type get quantityType => Exposure;

  /// Derive new ExposureUnits using this ExposureUnits object as the base.
  @override
  Units derive(String fullPrefix, String abbrevPrefix, double conv) =>
     new ExposureUnits(
        '$fullPrefix$name',
        _abbrev1 != null ? '$abbrevPrefix$_abbrev1' : null,
        _abbrev2 != null ? '$abbrevPrefix$_abbrev2' : null,
        '$fullPrefix$singular',
        valueSI * conv,
        false,
        offset);
  
}
