part of quantity_si;

/// The size of an ensemble of elementary entities, such as atoms, molecules, electrons, and other particles.
///
/// See the [Wikipedia entry for Amount of substance](https://en.wikipedia.org/wiki/Amount_of_substance)
/// for more information.
///
class AmountOfSubstance extends Quantity {
  /// Dimensions for this type of quantity
  static const Dimensions amountOfSubstanceDimensions =
      const Dimensions.constant(const <String, int>{'Amount': 1}, qType: AmountOfSubstance);

  /// The standard SI unit.
  static final AmountOfSubstanceUnits moles = new AmountOfSubstanceUnits('moles', null, 'mol', null, 1.0, true);

  /// A common metric derivative of the standard SI unit.
  static final AmountOfSubstanceUnits kilomoles = moles.kilo() as AmountOfSubstanceUnits;

  /// Construct an AmountOfSubstance with moles ([mol])
  /// or kilomoles ([kmol]).
  ///
  /// Optionally specify a relative standard [uncert]ainty.
  ///
  AmountOfSubstance({dynamic mol, dynamic kmol, double uncert = 0.0})
      : super(mol ?? (kmol ?? 0.0), kmol != null ? AmountOfSubstance.kilomoles : AmountOfSubstance.moles, uncert);

  AmountOfSubstance._internal(dynamic conv) : super._internal(conv, AmountOfSubstance.amountOfSubstanceDimensions);

  /// Constructs a AmountOfSubstance based on the [value]
  /// and the conversion factor intrinsic to the passed [units].
  ///
  AmountOfSubstance.inUnits(dynamic value, AmountOfSubstanceUnits units, [double uncert = 0.0])
      : super(value, units ?? AmountOfSubstance.moles, uncert);

  const AmountOfSubstance.constant(Number valueSI, {AmountOfSubstanceUnits units, double uncert = 0.0})
      : super.constant(valueSI, AmountOfSubstance.amountOfSubstanceDimensions, units, uncert);
}

/// Units acceptable for use in describing [AmountOfSubstance] quantities.
///
class AmountOfSubstanceUnits extends AmountOfSubstance with Units {
  AmountOfSubstanceUnits(String name, String abbrev1, String abbrev2, String singular, dynamic conv,
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
  Type get quantityType => AmountOfSubstance;

  /// Derive new AmountOfSubstanceUnits using this AmountOfSubstanceUnits object as the base.
  @override
  Units derive(String fullPrefix, String abbrevPrefix, double conv) =>
     new AmountOfSubstanceUnits(
        '$fullPrefix$name',
        _abbrev1 != null ? '$abbrevPrefix$_abbrev1' : null,
        _abbrev2 != null ? '$abbrevPrefix$_abbrev2' : null,
        '$fullPrefix$singular',
        valueSI * conv,
        false,
        offset);
  
}
