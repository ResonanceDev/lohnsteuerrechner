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

enum Round{
  DOWN,
  UP
}

extension Divide on Decimal {
  Decimal divide(Decimal other, int scale, Round round) {
    if (round == Round.UP) {
      return roundUp(this * other, scale);
    }
    else
    {
      return roundDown(this * other, scale);
    }
  }

  Rational dividePlain(Decimal other) {
    return this / other;
  }
}

extension Multiply on Decimal {
  Decimal multiply(Decimal other, int scale, Round round) {
    if (round == Round.UP) {
      return roundUp(this * other, scale);
    }
    else
    {
      return roundDown(this * other, scale);
    }
  }

  Decimal multiplyPlain(Decimal other) {
      return this * other;
  }
}

extension Add on Decimal {
  Decimal add(Decimal other) {
      return this + other;
    }
}

extension RoundUp on Decimal {
  Decimal round_Up()
  {
    return roundUp(this, 2);
  }
}