part of quantity_si;

// Also MolarHeatCapacity entropy content of one mole of substanc

/// Entropy content per mole of substance.
///
/// See the [Wikipedia entry for Standard molar entropy](https://en.wikipedia.org/wiki/Standard_molar_entropy)
/// for more information.
///
class MolarEntropy extends Quantity {
  /// Dimensions for this type of quantity
  static const Dimensions molarEntropyDimensions = const Dimensions.constant(
      const <String, int>{'Mass': 1, 'Length': 2, 'Time': -2, 'Amount': -1, 'Temperature': -1},
      qType: MolarEntropy);

  /// The standard SI unit.
  static final MolarEntropyUnits joulesPerMoleKelvin = new MolarEntropyUnits.energyAmountTemperature(
      Energy.joules, AmountOfSubstance.moles, TemperatureInterval.kelvins);

  /// Construct a MolarEntropy with joules per mole kelvin.
  ///
  /// Optionally specify a relative standard [uncert]ainty.
  ///
  MolarEntropy({dynamic joulesPerMoleKelvin, double uncert = 0.0})
      : super(joulesPerMoleKelvin ?? 0.0, MolarEntropy.joulesPerMoleKelvin, uncert);

  MolarEntropy._internal(dynamic conv) : super._internal(conv, MolarEntropy.molarEntropyDimensions);

  /// Constructs a MolarEntropy based on the [value]
  /// and the conversion factor intrinsic to the passed [units].
  ///
  MolarEntropy.inUnits(dynamic value, MolarEntropyUnits units, [double uncert = 0.0])
      : super(value, units ?? MolarEntropy.joulesPerMoleKelvin, uncert);

  const MolarEntropy.constant(Number valueSI, {MolarEntropyUnits units, double uncert = 0.0})
      : super.constant(valueSI, MolarEntropy.molarEntropyDimensions, units, uncert);
}

/// Units acceptable for use in describing MolarEntropy quantities.
///
class MolarEntropyUnits extends MolarEntropy with Units {
  MolarEntropyUnits(String name, String abbrev1, String abbrev2, String singular, dynamic conv,
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

  MolarEntropyUnits.energyAmountTemperature(EnergyUnits eu, AmountOfSubstanceUnits aosu, TemperatureIntervalUnits tu)
      : super._internal(eu.valueSI / (aosu.valueSI * tu.valueSI)) {
    name = '${eu.name} per ${aosu.singular} ${tu.singular}';
    singular = '${eu.singular} per ${aosu.singular} ${tu.singular}';
    _convToMKS = eu.valueSI / (aosu.valueSI * tu.valueSI);
    _abbrev1 =
        eu._abbrev1 != null && aosu._abbrev1 != null ? '${eu._abbrev1} / ${aosu._abbrev1} ${tu._abbrev1}' : null;
    _abbrev2 =
        eu._abbrev2 != null && aosu._abbrev2 != null ? '${eu._abbrev2}/${aosu._abbrev2}${tu._abbrev2}' : null;
    metricBase = false;
    offset = 0.0;
  }

  /// Returns the Type of the Quantity to which these Units apply
  @override
  Type get quantityType => MolarEntropy;

  /// Derive new MolarEntropyUnits using this MolarEntropyUnits object as the base.
  @override
  Units derive(String fullPrefix, String abbrevPrefix, double conv) =>
     new MolarEntropyUnits(
        '$fullPrefix$name',
        _abbrev1 != null ? '$abbrevPrefix$_abbrev1' : null,
        _abbrev2 != null ? '$abbrevPrefix$_abbrev2' : null,
        '$fullPrefix$singular',
        valueSI * conv,
        false,
        offset);
  
}
