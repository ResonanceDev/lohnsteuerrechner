import 'package:intl/intl.dart';
import 'package:lohnsteuer/src/Lohnsteuer2024.dart';
import 'package:lohnsteuer/src/LohnsteuerInterface.dart';



/// 
/// @author Marcel Lehmann (https://github.com/MarcelLehmann/Lohnsteuer)
/// @date Fri Mar 15 08:35:04 CET 2024
/// 

class Lohnsteuer {
  static LohnsteuerInterface getInstanceDefault() {
    return Lohnsteuer2024();
  }

  static LohnsteuerInterface getInstance(DateTime? date) {
    /*if (date != null) {
      int year = date.year;
      int month = date.month;

      if ((year == 2024 && month >= 1) || year > 2024) {
        return Lohnsteuer2024();
      }
      if (year == 2023 && month >= 7 && month <= 12) {
        return Lohnsteuer2023AbJuli();
      }
      if (year == 2023 && month >= 1 && month <= 6) {
        return Lohnsteuer2023();
      }
      if (year == 2022 && month >= 1 && month <= 12) {
        return Lohnsteuer2022();
      }
      if (year == 2021 && month >= 1 && month <= 12) {
        return Lohnsteuer2021();
      }
      if (year == 2020 && month >= 1 && month <= 12) {
        return Lohnsteuer2020();
      }
      if (year == 2019 && month >= 1 && month <= 12) {
        return Lohnsteuer2019();
      }
      if (year == 2018 && month >= 1 && month <= 12) {
        return Lohnsteuer2018();
      }
      if (year == 2017 && month >= 1 && month <= 12) {
        return Lohnsteuer2017();
      }
      if (year == 2016 && month >= 1 && month <= 12) {
        return Lohnsteuer2016();
      }
      if (year == 2015 && month == 12) {
        return Lohnsteuer2015Dezember();
      }
      if (year == 2015 && month >= 1 && month <= 11) {
        return Lohnsteuer2015();
      }
      if (year == 2014 && month >= 1 && month <= 12) {
        return Lohnsteuer2014();
      }
      if (year == 2013 && month >= 1 && month <= 12) {
        return Lohnsteuer2013();
      }
      if (year == 2012 && month >= 1 && month <= 12) {
        return Lohnsteuer2012();
      }
      if (year == 2011 && month == 12) {
        return Lohnsteuer2011Dezember();
      }
      if (year == 2011 && month >= 1 && month <= 11) {
        return Lohnsteuer2011();
      }
      if (year == 2010 && month >= 1 && month <= 12) {
        return Lohnsteuer2010();
      }
      if (year == 2009 && month >= 1 && month <= 12) {
        return Lohnsteuer2009();
      }
      if (year == 2008 && month >= 1 && month <= 12) {
        return Lohnsteuer2008();
      }
      if (year == 2007 && month >= 1 && month <= 12) {
        return Lohnsteuer2007();
      }
      if (year == 2006 && month >= 1 && month <= 12) {
        return Lohnsteuer2006();
      }
      throw ArgumentError('Illegal Date ${DateFormat('yyyy-MM-dd').format(date)}');
    }*/

    return Lohnsteuer2024();
  }
}

