part of quantity_si;

/// Represents the *luminous intensity* physical quantity (one of the seven
/// base SI quantities), the wavelength-weighted power emitted by a light source
/// in a particular direction per unit solid angle.
///
/// See the [Wikipedia entry for Luminous intensity](https://en.wikipedia.org/wiki/Luminous_intensity)
/// for more information.
///
class LuminousIntensity extends Quantity {
  /// Dimensions for this type of quantity
  static const Dimensions luminousIntensityDimensions =
      const Dimensions.constant(const <String, int>{'Intensity': 1}, qType: LuminousIntensity);

  /// The standard SI unit.
  static final LuminousIntensityUnits candelas = new LuminousIntensityUnits('candelas', 'cd', null, null, 1.0, true);

  /// Construct a LuminousIntensity with candelas ([cd]).
  ///
  /// Optionally specify a relative standard [uncert]ainty.
  ///
  LuminousIntensity({dynamic cd, double uncert = 0.0}) : super(cd ?? 0.0, LuminousIntensity.candelas, uncert);

  LuminousIntensity._internal(dynamic conv) : super._internal(conv, LuminousIntensity.luminousIntensityDimensions);

  /// Constructs a LuminousIntensity based on the [value]
  /// and the conversion factor intrinsic to the passed [units].
  ///
  LuminousIntensity.inUnits(dynamic value, LuminousIntensityUnits units, [double uncert = 0.0])
      : super(value, units ?? LuminousIntensity.candelas, uncert);

  const LuminousIntensity.constant(Number valueSI, {LuminousIntensityUnits units, double uncert = 0.0})
      : super.constant(valueSI, LuminousIntensity.luminousIntensityDimensions, units, uncert);
}

/// Units acceptable for use in describing [LuminousIntensity] quantities.
///
class LuminousIntensityUnits extends LuminousIntensity with Units {
  /// Constructs a new instance.
  LuminousIntensityUnits(String name, String abbrev1, String abbrev2, String singular, dynamic conv,
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

  /// Returns the Type of the Quantity to which these Units apply
  @override
  Type get quantityType => LuminousIntensity;

  /// Derive new LuminousIntensityUnits using this LuminousIntensityUnits object as the base.
  @override
  Units derive(String fullPrefix, String abbrevPrefix, double conv) =>
     new LuminousIntensityUnits(
        '$fullPrefix$name',
        _abbrev1 != null ? '$abbrevPrefix$_abbrev1' : null,
        _abbrev2 != null ? '$abbrevPrefix$_abbrev2' : null,
        '$fullPrefix$singular',
        valueSI * conv,
        false,
        offset);
  
}
