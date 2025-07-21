import 'package:lohnsteuerrechenr/lohnsteuer.dart';
import 'package:lohnsteuerrechenr/src/BigDecimal.dart';

void main() {
    final dt = DateTime(2025, 1,1 ,1);

    final lohnsteuer = Lohnsteuer.getInstance(dt);
    const double testwert = 492820;

    lohnsteuer.setRe4(BigDecimal(testwert)); // -> WICHTIGSTE ANGABE -> BURTTO-LOHN
    lohnsteuer.setVjahr(2024);
    lohnsteuer.setR(0);
    //lohnsteuer.setJre4(BigDecimal(0)); // -> Herausfinden was das ist
    lohnsteuer.setLzz(2);
    lohnsteuer.setStkl(1);
    lohnsteuer.setAlter1(0);
    lohnsteuer.setKvz(BigDecimal(2.5));
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
    print('${lohnsteuer.getLstlzz().divide(BigDecimal(100)).num} EUR');
}
