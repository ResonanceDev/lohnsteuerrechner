import 'package:decimal/decimal.dart';
import 'package:lohnsteuer/lohnsteuer.dart';
import 'package:lohnsteuer/src/BigDecimal.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    final awesome = Awesome();
    final dt = DateTime(2024, 1,1 ,1);

    final lohnsteuer = Lohnsteuer.getInstance(dt);

    lohnsteuer.setRe4(BigDecimal(350000)); // -> WICHTIGSTE ANGABE -> BURTTO-LOHN
    lohnsteuer.setVjahr(2024);
    lohnsteuer.setR(0);
    //lohnsteuer.setJre4(BigDecimal(0)); // -> Herausfinden was das ist
    lohnsteuer.setLzz(2);
    lohnsteuer.setStkl(1);
    lohnsteuer.setAlter1(0);
    lohnsteuer.setKvz(BigDecimal(1.7));
    lohnsteuer.setPkv(0);
    lohnsteuer.setKrv(0);
    lohnsteuer.setAf(0);
    //      mit       ohne
    //Ls    439       432,75

    //soAB  715,75    736,75
    //      1154,75   1169,5
    //dif   14,75

    lohnsteuer.main();
    print("\nLohnabzuege bei 3500 EUR Brutto: \n\n");
    print((lohnsteuer.getLstlzz().divide(BigDecimal(100)).num).toString() + ' EUR');
  });
}
