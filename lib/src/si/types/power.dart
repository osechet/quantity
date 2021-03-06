part of quantity_si;

// Also HeatFlowRate, RadiantFlux

/// Amount of energy per unit time.
///
/// See the [Wikipedia entry for Power (physics)](https://en.wikipedia.org/wiki/Power_(physics))
/// for more information.
///
class Power extends Quantity {
  /// Dimensions for this type of quantity
  static const Dimensions powerDimensions =
      const Dimensions.constant(const <String, int>{'Length': 2, 'Mass': 1, 'Time': -3}, qType: Power);

  /// The standard SI unit.
  static final PowerUnits watts = new PowerUnits('watts', null, 'W', null, 1.0, true);

  // Convenience
  static final PowerUnits kilowatts = watts.kilo() as PowerUnits;
  static final PowerUnits megawatts = watts.mega() as PowerUnits;

  /// Construct a Power with watts ([W]), kilowatts ([kW]) or megawatts ([MW]).
  ///
  /// Optionally specify a relative standard [uncert]ainty.
  ///
  // ignore: non_constant_identifier_names
  Power({dynamic W, dynamic kW, dynamic MW, double uncert = 0.0})
      : super(W ?? (kW ?? (MW ?? 0.0)), kW != null ? Power.kilowatts : (MW != null ? Power.megawatts : Power.watts),
            uncert);

  Power._internal(dynamic conv) : super._internal(conv, Power.powerDimensions);

  /// Constructs a Power based on the [value]
  /// and the conversion factor intrinsic to the passed [units].
  ///
  Power.inUnits(dynamic value, PowerUnits units, [double uncert = 0.0]) : super(value, units ?? Power.watts, uncert);

  const Power.constant(Number valueSI, {PowerUnits units, double uncert = 0.0})
      : super.constant(valueSI, Power.powerDimensions, units, uncert);
}

/// Units acceptable for use in describing Power quantities.
///
class PowerUnits extends Power with Units {
  /// Constructs a new instance.
  PowerUnits(String name, String abbrev1, String abbrev2, String singular, dynamic conv,
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

  /// Constructs a new instance based on energy and time units.
  PowerUnits.energyTime(EnergyUnits eu, TimeUnits tu) : super._internal(eu.valueSI / tu.valueSI) {
    name = '${eu.name} per ${tu.singular}';
    singular = '${eu.singular} per ${tu.singular}';
    _convToMKS = eu.valueSI / tu.valueSI;
    _abbrev1 = eu._abbrev1 != null && tu._abbrev1 != null ? '${eu._abbrev1} / ${tu._abbrev1}' : null;
    _abbrev2 = eu._abbrev2 != null && tu._abbrev2 != null ? '${eu._abbrev2}${tu._abbrev2}' : null;
    metricBase = metricBase;
    offset = offset.toDouble();
  }

  /// Returns the Type of the Quantity to which these Units apply
  @override
  Type get quantityType => Power;

  /// Derive new PowerUnits using this PowerUnits object as the base.
  @override
  Units derive(String fullPrefix, String abbrevPrefix, double conv) =>
     new PowerUnits(
        '$fullPrefix$name',
        _abbrev1 != null ? '$abbrevPrefix$_abbrev1' : null,
        _abbrev2 != null ? '$abbrevPrefix$_abbrev2' : null,
        '$fullPrefix$singular',
        valueSI * conv,
        false,
        offset);
  
}

class RadiantFlux extends Power {
  const RadiantFlux.constant(Number valueSI, {PowerUnits units, double uncert = 0.0})
      : super.constant(valueSI, units: units, uncert: uncert);
}
