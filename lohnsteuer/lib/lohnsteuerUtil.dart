import 'package:decimal/decimal.dart';
import 'package:rational/rational.dart';

Decimal roundUp(Decimal value, int scale) {
  final Decimal multiplier = Rational.fromInt(10).pow(scale) as Decimal;
  final Decimal scaledValue = (value * multiplier).ceil();
  return (scaledValue / multiplier).toDecimal();
}

Decimal roundDown(Decimal value, int scale) {
  final Decimal multiplier = Decimal.fromInt(10).pow(scale) as Decimal;
  final Decimal scaledValue = (value * multiplier).floor();
  return (scaledValue / multiplier).toDecimal();
}