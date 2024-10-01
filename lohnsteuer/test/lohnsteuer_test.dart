import 'package:lohnsteuer/lohnsteuer.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    final awesome = Awesome();
    final testLohnsteuer = Lohnsteuer.getInstance(null);

/*    val dt: LocalDateTime = LocalDateTime.of(
    if (_uiPersonalTaxState.value.abrechnungsJahr.isEmpty()) LocalDate.now().year else _uiPersonalTaxState.value.abrechnungsJahr.toInt(),
    1,
    1,
    1,
    1
    )
    val msAbrechnungsjahr = dt.toEpochSecond(ZoneOffset.UTC) * 1000 // Aktuelles Abrechnungsjahr in Millisekunden

    checkYear()

    lohnsteuer = Lohnsteuer.getInstance(Date(msAbrechnungsjahr))
    lohnsteuer.setRe4(BigDecimal(if (_uiPersonalTaxState.value.bruttoEinkommen.isEmpty()) 0.0 else _uiPersonalTaxState.value.bruttoEinkommen.toDouble() * 100.00)) // -> WICHTIGSTE ANGABE -> BURTTO-LOHN
    lohnsteuer.setJre4(BigDecimal(0)) // -> Herausfinden was das ist
    lohnsteuer.setVjahr(_uiPersonalTaxState.value.abrechnungsJahr.toInt())
    lohnsteuer.setLzz(getIntAbrechnungszeitraum(_uiPersonalTaxState.value.abrechnungszeitraum) + 1)
    lohnsteuer.setStkl(getIntSteuerklasse(_uiPersonalTaxState.value.steuerKlasse) + 1)

    lohnsteuer.setJfreib(BigDecimal(if (_uiPersonalTaxState.value.jaehrlicherSteuerfreibetrag.isEmpty()) 0.0 else _uiPersonalTaxState.value.jaehrlicherSteuerfreibetrag.toDouble()))
    lohnsteuer.setZkf(BigDecimal(if (_uiPersonalTaxState.value.kinderFreibetrag.isEmpty()) 0.0 else _uiPersonalTaxState.value.kinderFreibetrag.toDouble()))
    lohnsteuer.setKvz(BigDecimal(if (_uiPersonalTaxState.value.krankenversicherungZusatzbeitrag.isEmpty()) 0.0 else _uiPersonalTaxState.value.krankenversicherungZusatzbeitrag.toDouble()))
    lohnsteuer.setR(if (_uiPersonalTaxState.value.kirchenAngehoerigkeit) 1 else 0) // kirchenzugehoerigkeit
    setPkv() // krankenversicherung
    setKrv() // rentenversicherung*/

    testLohnsteuer.main();

    setUp(() {
      // Additional setup goes here.
    });

    test('First Test', () {
      expect(awesome.isAwesome, isTrue);
    });
  });
}
