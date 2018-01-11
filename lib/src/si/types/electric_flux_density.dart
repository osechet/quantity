part of quantity_si;

/// A measure of the intensity of an electric field generated by a free electric charge,
/// corresponding to the number of electric field lines passing through a given area.
///
/// See the [Wikipedia entry for Electric_flux](https://en.wikipedia.org/wiki/Electric_flux)
/// for more information.
///
class ElectricFluxDensity extends Quantity {
  /// Dimensions for this type of quantity
  static const Dimensions electricFluxDensityDimensions =
      const Dimensions.constant(const <String, int>{'Current': 1, 'Time': 1, 'Length': -2}, qType: ElectricFluxDensity);

  /// The standard SI unit.
  static final ElectricFluxDensityUnits coulombsPerSquareMeter =
      new ElectricFluxDensityUnits.chargeArea(Charge.coulombs, Area.squareMeters);

  /// Construct an ElectricFluxDensity with coulombs per square meter ([C_per_m2]).
  ///
  /// Optionally specify a relative standard [uncert]ainty.
  ///
  ElectricFluxDensity({dynamic C_per_m2, double uncert: 0.0})
      : super(C_per_m2 ?? 0.0, ElectricFluxDensity.coulombsPerSquareMeter, uncert);

  ElectricFluxDensity._internal(dynamic conv)
      : super._internal(conv, ElectricFluxDensity.electricFluxDensityDimensions);

  /// Constructs a ElectricFluxDensity based on the [value]
  /// and the conversion factor intrinsic to the passed [units].
  ///
  ElectricFluxDensity.inUnits(dynamic value, ElectricFluxDensityUnits units, [double uncert = 0.0])
      : super(value, units ?? ElectricFluxDensity.coulombsPerSquareMeter, uncert);

  const ElectricFluxDensity.constant(Number valueSI, {ElectricFluxDensityUnits units, double uncert: 0.0})
      : super.constant(valueSI, ElectricFluxDensity.electricFluxDensityDimensions, units, uncert);
}

/// Units acceptable for use in describing ElectricFluxDensity quantities.
///
class ElectricFluxDensityUnits extends ElectricFluxDensity with Units {
  ElectricFluxDensityUnits(String name, String abbrev1, String abbrev2, String singular, dynamic conv,
      [bool metricBase = false, num offset = 0.0])
      : super._internal(conv) {
    this.name = name;
    this.singular = singular;
    this._convToMKS = objToNumber(conv);
    this._abbrev1 = abbrev1;
    this._abbrev2 = abbrev2;
    this.metricBase = metricBase;
    this.offset = offset.toDouble();
  }

  ElectricFluxDensityUnits.chargeArea(ChargeUnits ecu, AreaUnits au) : super._internal(ecu.valueSI * au.valueSI) {
    this.name = '${ecu.name} per ${au.singular}';
    this.singular = '${ecu.singular} per ${au.singular}';
    this._convToMKS = ecu.valueSI * au.valueSI;
    this._abbrev1 = ecu._abbrev1 != null && au._abbrev1 != null ? '${ecu._abbrev1} / ${au._abbrev1}' : null;
    this._abbrev2 = ecu._abbrev2 != null && au._abbrev2 != null ? '${ecu._abbrev2}/${au._abbrev2}' : null;
    this.metricBase = false;
    this.offset = 0.0;
  }

  /// Returns the Type of the Quantity to which these Units apply
  @override
  Type get quantityType => ElectricFluxDensity;

  /// Derive new ElectricFluxDensityUnits using this ElectricFluxDensityUnits object as the base.
  @override
  Units derive(String fullPrefix, String abbrevPrefix, double conv) => new ElectricFluxDensityUnits(
        '$fullPrefix$name',
        _abbrev1 != null ? '$abbrevPrefix$_abbrev1' : null,
        _abbrev2 != null ? '$abbrevPrefix$_abbrev2' : null,
        '$fullPrefix$singular',
        valueSI * conv,
        false,
        this.offset);
  
}
