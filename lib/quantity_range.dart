/// Models ranges of quantities with start and end values (not necessarily increasing).
///
/// Additional classes and utilities are provided for `Angle` and `TimePeriod` ranges.
///
library quantity_range;

import 'dart:math';
import 'package:quantity/quantity.dart';
import 'package:quantity/quantity_ext.dart' show angle0, angle360;

part 'range/angle_range.dart';
part 'range/quantity_range.dart';
part 'range/time_period.dart';
