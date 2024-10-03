import 'package:decimal/decimal.dart';
import 'package:rational/rational.dart';

Decimal roundUp(int scale,Decimal value) {
  final Decimal multiplier = Rational.fromInt(10).pow(scale).toDecimal();
  final Decimal scaledValue = (value * multiplier).ceil();
  return (scaledValue / multiplier).toDecimal();
}

Decimal roundDown(int scale,Decimal value,) {
  final Decimal multiplier = Rational.fromInt(10).pow(scale).toDecimal();
  final Decimal scaledValue = (value * multiplier).floor();
  return (scaledValue / multiplier).toDecimal();
}

extension SetScale on Decimal{
  setScale(int scale, Round round) {
    if (round == Round.UP) {
      return roundUp(scale, this);
    }
    else{
      return roundDown(scale, this);
    }
  }
}

enum Round{
  DOWN,
  UP
}

extension Divide on Decimal {
  Decimal divide(Decimal other, int scale, Round round) {
    if (round == Round.UP) {
      return  roundUp(scale, Decimal.parse((this.toDouble() / other.toDouble()).toString()));
    }
    else
    {
      return roundDown(scale,Decimal.parse((this.toDouble() / other.toDouble()).toString()));
    }
  }

  Rational dividePlain(Decimal other) {
    return this.round(scale: 10) / other.round(scale: 10);
  }
}

extension Multiply on Decimal {
  Decimal multiply(Decimal other, int scale, Round round) {
    if (round == Round.UP) {
      return roundUp(scale, this * other);
    }
    else
    {
      return roundDown(scale,this * other);
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
    return roundUp(2,this);
  }
}
extension RoundDown on Decimal {
  Decimal round_Down()
  {
    return roundDown(2,this);
  }
}