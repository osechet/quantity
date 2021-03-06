part of quantity_ext;

/// Synonymous with [Scalar.one].
final ScalarUnits one = Scalar.one;

/// Synonymous with [Scalar.percent].
final ScalarUnits percent = Scalar.percent;

/// One trillionth (US: 10^-12) as a unit.
final ScalarUnits trillionthsUS = new ScalarUnits('trillionths', null, null, 'trillionth', 1.0e-12, false);

/// One billionth (US: 10^-9) as a unit.
final ScalarUnits billionthsUS = new ScalarUnits('billionths', null, null, 'billionth', 1.0e-9, false);

/// One millionth as a unit.
final ScalarUnits millionths = new ScalarUnits('millionths', null, null, 'millionth', 1.0e-6, false);

/// One thousandth as a unit.
final ScalarUnits thousandths = new ScalarUnits('thousandths', null, null, 'thousandth', 0.001, false);

/// One hundredth as a unit.
final ScalarUnits hundredths = new ScalarUnits('hundredths', null, null, 'hundredth', 0.01, false);

/// One tenth as a unit.
final ScalarUnits tenths = new ScalarUnits('tenths', null, null, 'tenth', 0.1, false);

/// A pair is 2.
final ScalarUnits pair = new ScalarUnits('pairs', null, null, 'pair', 2.0, false);

/// A half-dozen is 6.
final ScalarUnits halfDozen = new ScalarUnits('half dozen', null, null, 'half dozen', 6.0, false);

/// A dozen is 12.
final ScalarUnits dozen = new ScalarUnits('dozen', null, null, 'dozen', 12.0, false);

/// A baker's dozen is 13.  One extra donut.  Thank you.
final ScalarUnits bakersDozen = new ScalarUnits("baker's dozen", null, null, "baker's dozen", 13.0, false);

/// A score is 20.  Four score is 80.  More poetic than just saying eighty.
final ScalarUnits score = new ScalarUnits('score', null, null, 'score', 20.0, false);

/// 100 as a unit.
final ScalarUnits hundred = new ScalarUnits('hundred', null, null, 'hundred', 100.0, false);

/// A gross is 144.
final ScalarUnits gross = new ScalarUnits('gross', null, null, 'gross', 144.0, false);

/// 1000 as a unit.
final ScalarUnits thousand = new ScalarUnits('thousand', null, null, 'thousand', 1000.0, false);

/// A great gross is 1728.
final ScalarUnits greatGross = new ScalarUnits('great gross', null, null, 'great gross', 1728.0, false);

/// A myriad is ten thousand.
final ScalarUnits myriad = new ScalarUnits('myriad', null, null, 'myriad', 10000.0, false);

/// One million as a unit.
final ScalarUnits million = new ScalarUnits('million', null, null, 'million', 1.0e6, false);

/// One billion (US: 10^9) as a unit.
final ScalarUnits billionUS = new ScalarUnits('billion', null, null, 'billion', 1.0e9, false);

/// One trillion (US: 10^12) as a unit.
final ScalarUnits trillionUS = new ScalarUnits('trillion', null, null, 'trillion', 1.0e12, false);

/// One quadrillion (US: 10^15) as a unit.
final ScalarUnits quadrillionUS = new ScalarUnits('quadrillion', null, null, 'quadrillion', 1.0e15, false);

/// One quintillion (US: 10^18) as a unit.
final ScalarUnits quintillionUS = new ScalarUnits('quintillion', null, null, 'quintillion', 1.0e18, false);

/// One sextillion (US: 10^21) as a unit.
final ScalarUnits sextillionUS = new ScalarUnits('sextillion', null, null, 'sextillion', 1.0e21, false);

final ScalarUnits septillionUS = new ScalarUnits('septillion', null, null, 'septillion', 1.0e24, false);

final ScalarUnits octillionUS = new ScalarUnits('octillion', null, null, 'octillion', 1.0e27, false);

final ScalarUnits nonillionUS = new ScalarUnits('nonillion', null, null, 'nonillion', 1.0e30, false);

final ScalarUnits decillionUS = new ScalarUnits('decillion', null, null, 'decillion', 1.0e33, false);

final ScalarUnits duotrigintillion = new ScalarUnits('duotrigintillion', null, null, 'duotrigintillion', 1.0e99, false);

final ScalarUnits googols = new ScalarUnits('googols', null, null, 'googol', 1.0e100, true);

// European variants.

final ScalarUnits billionEur = new ScalarUnits('billion (eur)', null, null, 'billion (eur)', 1.0e12, false);

final ScalarUnits trillionEur = new ScalarUnits('trillion (eur)', null, null, 'trillion (eur)', 1.0e18, false);

final ScalarUnits quadrillionEur = new ScalarUnits('quadrillion (eur)', null, null, 'quadrillion (eur)', 1.0e24, false);

final ScalarUnits quintillionEur = new ScalarUnits('quintillion (eur)', null, null, 'quintillion (eur)', 1.0e30, false);

final ScalarUnits sextillionEur = new ScalarUnits('sextillion (eur)', null, null, 'sextillion (eur)', 1.0e36, false);

final ScalarUnits septillionEur = new ScalarUnits('septillion (eur)', null, null, 'septillion (eur)', 1.0e42, false);

final ScalarUnits octillionEur = new ScalarUnits('octillion (eur)', null, null, 'octillion (eur)', 1.0e48, false);

final ScalarUnits nonillionEur = new ScalarUnits('nonillion (eur)', null, null, 'nonillion (eur)', 1.0e54, false);

final ScalarUnits decillionEur = new ScalarUnits('decillion (eur)', null, null, 'decillion (eur)', 1.0e60, false);

// CONSTANTS

// Zero, in various names.

const Scalar scalarZero = const Scalar.constant(Double.zero);
const Scalar naught = scalarZero;
const Scalar zilch = scalarZero;

/// Fine structure constant (alpha).
const Scalar fineStructureConstant =
    const Scalar.constant(const Double.constant(7.2973525664e-3), uncert: 2.3296119853486266e-10);

/// Proton g factor (gp).
const Scalar protonGFactor = const Scalar.constant(const Double.constant(5.585694702), uncert: 3.043488931450733e-9);

/// Electron g factor (ge).
const Scalar electronGFactor =
    const Scalar.constant(const Double.constant(-2.00231930436182), uncert: 2.59698839674192e-13);

/// Neutron g factor (gn).
const Scalar neutronGFactor = const Scalar.constant(const Double.constant(-3.82608545), uncert: 2.3522736534804782e-7);

/// Muon g factor (gn).
const Scalar muonGFactor = const Scalar.constant(const Double.constant(-2.0023318418), uncert: 6.492430339775063e-10);

/// googol (10^100), arbitrary precision.
Scalar googol = new Scalar(value: new Precise.raw(<Digit>[Digit.one], power: 100, sigDigits: 101));

/// Sackur-Tetrode constant at 1 K and 100 kPa ('S0/R').
const Scalar sackurTetrode100kPa =
    const Scalar.constant(const Double.constant(-1.1517084), uncert: 1.2155854728505931e-6);

/// Sackur-Tetrode constant at 1 K and 101.325 kPa ('S0/R').
const Scalar sackurTetrodeStdAtm =
    const Scalar.constant(const Double.constant(-1.1648714), uncert: 1.201849405865746e-6);

/// Weak mixing angle.
const Scalar weakMixingAngle = const Scalar.constant(const Double.constant(0.2223), uncert: 9.446693657219972e-3);
