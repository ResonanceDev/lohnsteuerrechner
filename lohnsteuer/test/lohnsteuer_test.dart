import 'package:decimal/decimal.dart';
import 'package:lohnsteuer/lohnsteuer.dart';
import 'package:lohnsteuer/lohnsteuerUtil.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    final awesome = Awesome();
    final dt = DateTime(2024);

    final lohnsteuer = Lohnsteuer.getInstance(dt);

    //final dt = LocalDateTime.of(
    //if (_uiPersonalTaxState.value.abrechnungsJahr.isEmpty()) LocalDate.now().year else _uiPersonalTaxState.value.abrechnungsJahr.toInt(),
    //1,
    //1,
    //1,d
    //1
    //)
   // final msAbrechnungsjahr = dt.toEpochSecond(ZoneOffset.UTC) * 1000 // Aktuelles Abrechnungsjahr in Millisekunden

    //checkYear()




    /*lohnsteuer = Lohnsteuer.getInstance(Date(msAbrechnungsjahr))
    lohnsteuer.setRe4(BigDecimal(if (_uiPersonalTaxState.value.bruttoEinkommen.isEmpty()) 0.0 else _uiPersonalTaxState.value.bruttoEinkommen.toDouble() * 100.00)) // -> WICHTIGSTE ANGABE -> BURTTO-LOHN
    lohnsteuer.setJre4(BigDecimal(0)) // -> Herausfinden was das ist
    lohnsteuer.setVjahr(_uiPersonalTaxState.value.abrechnungsJahr.toInt())
    lohnsteuer.setLzz(getIntAbrechnungszeitraum(_uiPersonalTaxState.value.abrechnungszeitraum) + 1)
    lohnsteuer.setStkl(getIntSteuerklasse(_uiPersonalTaxState.value.steuerKlasse) + 1)

    lohnsteuer.setJfreib(BigDecimal(if (_uiPersonalTaxState.value.jaehrlicherSteuerfreibetrag.isEmpty()) 0.0 else _uiPersonalTaxState.value.jaehrlicherSteuerfreibetrag.toDouble()))
    lohnsteuer.setZkf(BigDecimal(if (_uiPersonalTaxState.value.kinderFreibetrag.isEmpty()) 0.0 else _uiPersonalTaxState.value.kinderFreibetrag.toDouble()))
    lohnsteuer.setKvz(BigDecimal(if (_uiPersonalTaxState.value.krankenversicherungZusatzbeitrag.isEmpty()) 0.0 else _uiPersonalTaxState.value.krankenversicherungZusatzbeitrag.toDouble()))
    lohnsteuer.setR(if (_uiPersonalTaxState.value.kirchenAngehoerigkeit) 1 else 0) // kirchenzugehoerigkeit*/
    //setPkv() // krankenversicherung
    //setKrv() // rentenversicherung


    Decimal brutto = Decimal.parse("350000");
    lohnsteuer.setRe4(brutto); // -> WICHTIGSTE ANGABE -> BURTTO-LOHN
    lohnsteuer.setVjahr(2024);
    lohnsteuer.setR(0);
    lohnsteuer.setJre4(Decimal.parse("0")); // -> Herausfinden was das ist
    lohnsteuer.setLzz(1);
    lohnsteuer.setStkl(1);

    lohnsteuer.main();

    setUp(() {
      // Additional setup goes here.
    });

    test('First Test', () {
      expect(awesome.isAwesome, isTrue);
    });

    Decimal testRound = Decimal.parse("1.55");
    testRound = roundDown(1, testRound);
    print(testRound);
    print("lol");
     print(lohnsteuer.getLstlzz()/100.toDecimal());
  });
}
