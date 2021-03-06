part of quantity_si;

/// Irradiance of a surface per unit frequency.
///
/// See the [Wikipedia entry for Radiometry](https://en.wikipedia.org/wiki/Radiometry)
/// for more information.
///
class SpectralIrradiance extends Quantity {
  /// Dimensions for this type of quantity
  static const Dimensions spectralIrradianceDimensions =
      const Dimensions.constant(const <String, int>{'Mass': 1, 'Time': -2}, qType: SpectralIrradiance);

  /// The standard SI unit.
  static final SpectralIrradianceUnits wattsPerSquareMeterPerHertz =
      new SpectralIrradianceUnits('watts per square meter per hertz', 'W m-2 Hz-1', null, null, 1.0, true);

  /// Construct a SpectralIrradiance with watts per square meter per hertz.
  ///
  /// Optionally specify a relative standard [uncert]ainty.
  ///
  SpectralIrradiance({dynamic wattsPerSquareMeterPerHertz, double uncert = 0.0})
      : super(wattsPerSquareMeterPerHertz ?? 0.0, SpectralIrradiance.wattsPerSquareMeterPerHertz, uncert);

  SpectralIrradiance._internal(dynamic conv) : super._internal(conv, SpectralIrradiance.spectralIrradianceDimensions);

  /// Constructs a SpectralIrradiance based on the [value]
  /// and the conversion factor intrinsic to the passed [units].
  ///
  SpectralIrradiance.inUnits(dynamic value, SpectralIrradianceUnits units, [double uncert = 0.0])
      : super(value, units ?? SpectralIrradiance.wattsPerSquareMeterPerHertz, uncert);

  const SpectralIrradiance.constant(Number valueSI, {SpectralIrradianceUnits units, double uncert = 0.0})
      : super.constant(valueSI, SpectralIrradiance.spectralIrradianceDimensions, units, uncert);
}

/// Units acceptable for use in describing SpectralIrradiance quantities.
///
class SpectralIrradianceUnits extends SpectralIrradiance with Units {
  /// Constructs a new instance.
  SpectralIrradianceUnits(String name, String abbrev1, String abbrev2, String singular, dynamic conv,
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
  Type get quantityType => SpectralIrradiance;

  /// Derive new SpectralIrradianceUnits using this SpectralIrradianceUnits object as the base.
  @override
  Units derive(String fullPrefix, String abbrevPrefix, double conv) =>
     new SpectralIrradianceUnits(
        '$fullPrefix$name',
        _abbrev1 != null ? '$abbrevPrefix$_abbrev1' : null,
        _abbrev2 != null ? '$abbrevPrefix$_abbrev2' : null,
        '$fullPrefix$singular',
        valueSI * conv,
        false,
        offset);
  
}
