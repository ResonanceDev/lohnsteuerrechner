// Wrapper class for conversion from Java to Dart to avoid
// conflicts when copying .java code

import 'package:lohnsteuer/lohnsteuerUtil.dart';
import 'package:rational/rational.dart';

class BigDecimal
{
  double num;

  BigDecimal(this.num);

  //BigDecimal(this.numDouble);

  static var ZERO =  BigDecimal(0);
  static var ONE =  BigDecimal(1);
  static var TEN =  BigDecimal(10);




  static BigDecimal valueOf(num) {
    if(num.runtimeType == double)
      {
        return BigDecimal(num);
      }
    else if(num.runtimeType == int)
      {
        return BigDecimal((num as int).toDouble());
      }
    else
      {
        return valueOf((num as BigDecimal).num);
      }
  }
  static var ROUND_DOWN = Round.DOWN;
  static var ROUND_UP = Round.UP;
}


enum Round{
  DOWN,
  UP
}



extension Divide on BigDecimal {
  BigDecimal divide(BigDecimal other, [int scale = 10, Round round = Round.DOWN]) {
    if (round == Round.UP) {
      return roundUp(scale, BigDecimal(this.num / other.num));
    }
    else
    {
      return roundDown(scale, BigDecimal(this.num / other.num));
    }
  }
}

extension Multiply on BigDecimal {
  BigDecimal multiply(BigDecimal other, [int scale = 10, Round round = Round.DOWN]) {
    if (round == Round.UP) {
      return roundUp(scale, BigDecimal(this.num * other.num));
    }
    else
    {
      return roundDown(scale, BigDecimal(this.num * other.num));
    }
  }
}

BigDecimal roundUp(int scale,BigDecimal value) {
  final BigDecimal multiplier = BigDecimal(Rational.fromInt(10).pow(scale).toDouble());
  final BigDecimal scaledValue = BigDecimal((value.num * multiplier.num).ceil().toDouble());
  return BigDecimal((scaledValue.num / multiplier.num).toDouble());
}

BigDecimal roundDown(int scale,BigDecimal value,) {
  final BigDecimal multiplier = BigDecimal(Rational.fromInt(10).pow(scale).toDouble());
  final BigDecimal scaledValue = BigDecimal((value.num * multiplier.num).floor().toDouble());
  return BigDecimal((scaledValue.num / multiplier.num).toDouble());
}

extension SetScale on BigDecimal{
  setScale(int scale, [Round round = Round.DOWN]) {
    if (round == Round.UP) {
      return roundUp(scale, this);
    }
    else{
      return roundDown(scale, this);
    }
  }
}

extension Add on BigDecimal {
  BigDecimal add(BigDecimal other) {
    return BigDecimal(this.num + other.num);
  }
}

extension Subtract on BigDecimal {
  BigDecimal subtract(BigDecimal other) {
    return BigDecimal(this.num - other.num);
  }
}

extension RoundUp on BigDecimal {
  BigDecimal round_Up()
  {
    return roundUp(2,this);
  }
}
extension RoundDown on BigDecimal {
  BigDecimal round_Down()
  {
    return roundDown(2,this);
  }
}

extension CompareTo on BigDecimal{
  int compareTo(BigDecimal other)
  {
    if(this.num < other.num)
      {
        return -1;
      }
    if(this.num > other.num)
      {
        return 1;
      }
    return 0;
  }
}

extension LongValue on BigDecimal{
  double longValue(){
    return this.num;
  }
}

extension Operator on bool{
  bool operator >= (int other)
  {
    var temp = -1;
    if(this == true)
      {
        temp = 1;
      }
    return temp >= other;
  }
}
