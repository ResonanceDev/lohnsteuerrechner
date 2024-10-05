
import 'package:lohnsteuerrechenr/src/BigDecimal.dart';

abstract class LohnsteuerInterface {
  void main();

  /// 1, wenn die Anwendung des Faktorverfahrens gewählt wurden (nur in Steuerklasse IV)
  void setAf(int arg0);

  /// Auf die Vollendung des 64. Lebensjahres folgende Kalenderjahr (erforderlich, wenn ALTER1=1)
  void setAjahr(int arg0);

  /// 1, wenn das 64. Lebensjahr zu Beginn des Kalenderjahres vollendet wurde, in dem
  /// der Lohnzahlungszeitraum endet (§ 24 a EStG), sonst = 0
  void setAlter1(int arg0);

  /// in VKAPA und VMT enthaltene Entschädigungen nach §24 Nummer 1 EStG
  /// sowie tarifermäßigt zu besteuernde Vorteile bei Vermögensbeteiligungen
  /// (§ 19a Absatz 4 EStG) in Cent
  void setEntsch(BigDecimal arg0);

  /// eingetragener Faktor mit drei Nachkommastellen
  void setF(double arg0);

  /// Jahresfreibetrag für die Ermittlung der Lohnsteuer für die sonstigen Bezüge
  /// sowie für Vermögensbeteiligungen nach § 19a Absatz 1 und 4 EStG nach Maßgabe der
  /// elektronischen Lohnsteuerabzugsmerkmale nach § 39e EStG oder der Eintragung
  /// auf der Bescheinigung für den Lohnsteuerabzug 2024 in Cent (ggf. 0)
  void setJfreib(BigDecimal arg0);

  /// Jahreshinzurechnungsbetrag für die Ermittlung der Lohnsteuer für die sonstigen Bezüge
  /// sowie für Vermögensbeteiligungen nach § 19a Absatz 1 und 4 EStG nach Maßgabe der
  /// elektronischen Lohnsteuerabzugsmerkmale nach § 39e EStG oder der Eintragung auf der
  /// Bescheinigung für den Lohnsteuerabzug 2024 in Cent (ggf. 0)
  void setJhinzu(BigDecimal arg0);

  /// Voraussichtlicher Jahresarbeitslohn ohne sonstige Bezüge (d.h. auch ohne Vergütung
  /// für mehrjährige Tätigkeit und ohne die zu besteuernden Vorteile bei Vermögensbeteiligungen,
  /// § 19a Absatz 4 EStG) in Cent.
  /// Anmerkung: Die Eingabe dieses Feldes (ggf. 0) ist erforderlich bei Eingaben zu sonstigen
  /// Bezügen (Felder SONSTB, VMT oder VKAPA).
  /// Sind in einem vorangegangenen Abrechnungszeitraum bereits sonstige Bezüge gezahlt worden,
  /// so sind sie dem voraussichtlichen Jahresarbeitslohn hinzuzurechnen. Gleiches gilt für zu
  /// besteuernde Vorteile bei Vermögensbeteiligungen (§ 19a Absatz 4 EStG). Vergütungen für
  /// mehrjährige Tätigkeit aus einem vorangegangenen Abrechnungszeitraum werden in voller
  /// Höhe hinzugerechnet.
  void setJre4(BigDecimal arg0);

  /// In JRE4 enthaltene Versorgungsbezuege in Cents (ggf. 0)
  void setJvbez(BigDecimal arg0);

  /// Merker für die Vorsorgepauschale
  /// 2 = der Arbeitnehmer ist NICHT in der gesetzlichen Rentenversicherung versichert.
  /// 1 = der Arbeitnehmer ist in der gesetzlichen Rentenversicherung versichert, es gilt die
  /// Beitragsbemessungsgrenze OST.
  /// 0 = der Arbeitnehmer ist in der gesetzlichen Rentenversicherung versichert, es gilt die
  /// Beitragsbemessungsgrenze WEST.
  void setKrv(int arg0);

  /// Kassenindividueller Zusatzbeitragssatz bei einem gesetzlich krankenversicherten Arbeitnehmer
  /// in Prozent (bspw. 1,70 für 1,70 %) mit 2 Dezimalstellen.
  /// Es ist der volle Zusatzbeitragssatz anzugeben. Die Aufteilung in Arbeitnehmer- und Arbeitgeber-
  /// anteil erfolgt im Programmablauf.
  void setKvz(BigDecimal arg0);

  /// Lohnzahlungszeitraum:
  /// 1 = Jahr
  /// 2 = Monat
  /// 3 = Woche
  /// 4 = Tag
  void setLzz(int arg0);

  /// Der als elektronisches Lohnsteuerabzugsmerkmal für den Arbeitgeber nach § 39e EStG festgestellte
  /// oder in der Bescheinigung für den Lohnsteuerabzug 2024 eingetragene Freibetrag für den
  /// Lohnzahlungszeitraum in Cent
  void setLzzfreib(BigDecimal arg0);

  /// Der als elektronisches Lohnsteuerabzugsmerkmal für den Arbeitgeber nach § 39e EStG festgestellte
  /// oder in der Bescheinigung für den Lohnsteuerabzug 2024 eingetragene Hinzurechnungsbetrag für den
  /// Lohnzahlungszeitraum in Cent
  void setLzzhinzu(BigDecimal arg0);

  /// Nicht zu besteuernde Vorteile bei Vermögensbeteiligungen
  /// (§ 19a Absatz 1 Satz 4 EStG) in Cent
  void setMbv(BigDecimal arg0);

  /// Dem Arbeitgeber mitgeteilte Zahlungen des Arbeitnehmers zur privaten
  /// Kranken- bzw. Pflegeversicherung im Sinne des §10 Abs. 1 Nr. 3 EStG 2010
  /// als Monatsbetrag in Cent (der Wert ist inabhängig vom Lohnzahlungszeitraum immer
  /// als Monatsbetrag anzugeben).
  void setPkpv(BigDecimal arg0);

  /// Krankenversicherung:
  /// 0 = gesetzlich krankenversicherte Arbeitnehmer
  /// 1 = ausschließlich privat krankenversicherte Arbeitnehmer OHNE Arbeitgeberzuschuss
  /// 2 = ausschließlich privat krankenversicherte Arbeitnehmer MIT Arbeitgeberzuschuss
  void setPkv(int arg0);

  /// Zahl der beim Arbeitnehmer zu berücksichtigenden Beitragsabschläge in der sozialen Pflegeversicherung
  /// bei mehr als einem Kind
  /// 0 = kein Abschlag
  /// 1 = Beitragsabschlag für das 2. Kind
  /// 2 = Beitragsabschläge für das 2. und 3. Kind
  /// 3 = Beitragsabschläge für 2. bis 4. Kinder
  /// 4 = Beitragsabschläge für 2. bis 5. oder mehr Kinder
  void setPva(BigDecimal arg0);

  /// 1, wenn bei der sozialen Pflegeversicherung die Besonderheiten in Sachsen zu berücksichtigen sind bzw.
  /// zu berücksichtigen wären, sonst 0.
  void setPvs(int arg0);

  /// 1, wenn er der Arbeitnehmer den Zuschlag zur sozialen Pflegeversicherung
  /// zu zahlen hat, sonst 0.
  void setPvz(int arg0);

  /// Religionsgemeinschaft des Arbeitnehmers lt. elektronischer Lohnsteuerabzugsmerkmale oder der
  /// Bescheinigung für den Lohnsteuerabzug 2024 (bei keiner Religionszugehörigkeit = 0)
  void setR(int arg0);

  /// Steuerpflichtiger Arbeitslohn für den Lohnzahlungszeitraum vor Berücksichtigung des
  /// Versorgungsfreibetrags und des Zuschlags zum Versorgungsfreibetrag, des Altersentlastungsbetrags
  /// und des als elektronisches Lohnsteuerabzugsmerkmal festgestellten oder in der Bescheinigung für
  /// den Lohnsteuerabzug 2024 für den Lohnzahlungszeitraum eingetragenen Freibetrags bzw.
  /// Hinzurechnungsbetrags in Cent
  void setRe4(BigDecimal arg0);

  /// Sonstige Bezüge (ohne Vergütung aus mehrjähriger Tätigkeit) einschließlich nicht tarifermäßigt
  /// zu besteuernde Vorteile bei Vermögensbeteiligungen und Sterbegeld bei Versorgungsbezügen sowie
  /// Kapitalauszahlungen/Abfindungen, soweit es sich nicht um Bezüge für mehrere Jahre handelt,
  /// in Cent (ggf. 0)
  void setSonstb(BigDecimal arg0);

  /// Sterbegeld bei Versorgungsbezuegen sowie Kapitalauszahlungen/Abfindungen,
  /// soweit es sich nicht um Bezuege fuer mehrere Jahre handelt
  /// (in SONSTB enthalten) in Cents
  void setSterbe(BigDecimal arg0);

  /// Steuerklasse:
  /// 1 = I
  /// 2 = II
  /// 3 = III
  /// 4 = IV
  /// 5 = V
  /// 6 = VI
  void setStkl(int arg0);

  /// In RE4 enthaltene Versorgungsbezuege in Cents (ggf. 0)
  void setVbez(BigDecimal arg0);

  /// Vorsorgungsbezug im Januar 2005 bzw. fuer den ersten vollen Monat
  /// in Cents
  void setVbezm(BigDecimal arg0);

  /// Voraussichtliche Sonderzahlungen im Kalenderjahr des Versorgungsbeginns
  /// bei Versorgungsempfaengern ohne Sterbegeld, Kapitalauszahlungen/Abfindungen
  /// bei Versorgungsbezuegen in Cents
  void setVbezs(BigDecimal arg0);

  /// In SONSTB enthaltene Versorgungsbezuege einschliesslich Sterbegeld
  /// in Cents (ggf. 0)
  void setVbs(BigDecimal arg0);

  /// Jahr, in dem der Versorgungsbezug erstmalig gewaehrt wurde; werden
  /// mehrere Versorgungsbezüge gezahlt, so gilt der aelteste erstmalige Bezug
  void setVjahr(int arg0);

  /// Kapitalauszahlungen / Abfindungen / Nachzahlungen bei Versorgungsbezügen
  /// für mehrere Jahre in Cent (ggf. 0)
  void setVkapa(BigDecimal arg0);

  /// Entschädigungen und Vergütung für mehrjährige Tätigkeit sowie tarifermäßigt
  /// zu besteuernde Vorteile bei Vermögensbeteiligungen (§ 19a Absatz 4 Satz 2 EStG)
  /// ohne Kapitalauszahlungen und ohne Abfindungen bei Versorgungsbezügen
  /// in Cent (ggf. 0)
  void setVmt(BigDecimal arg0);

  /// Zahl der Freibetraege fuer Kinder (eine Dezimalstelle, nur bei Steuerklassen
  /// I, II, III und IV)
  void setZkf(BigDecimal arg0);

  /// Zahl der Monate, fuer die Versorgungsbezuege gezahlt werden (nur
  /// erforderlich bei Jahresberechnung (LZZ = 1)
  void setZmvb(int arg0);

  /// In JRE4 enthaltene Entschädigungen nach § 24 Nummer 1 EStG und zu besteuernde
  /// Vorteile bei Vermögensbeteiligungen (§ 19a Absatz 4 EStG in Cent
  void setJre4ent(BigDecimal arg0);

  /// In SONSTB enthaltene Entschädigungen nach § 24 Nummer 1 EStG sowie nicht
  /// tarifermäßigt zu besteuernde Vorteile bei Vermögensbeteiligungen in Cent
  void setSonstent(BigDecimal arg0);

  /// Bemessungsgrundlage fuer die Kirchenlohnsteuer in Cents
  BigDecimal getBk();

  /// Bemessungsgrundlage der sonstigen Bezüge (ohne Vergütung für mehrjährige Tätigkeit)
  /// für die Kirchenlohnsteuer in Cent.
  /// Hinweis: Negativbeträge, die aus nicht zu besteuernden Vorteilen bei
  /// Vermögensbeteiligungen (§ 19a Absatz 1 Satz 4 EStG) resultieren, mindern BK
  /// (maximal bis 0). Der Sonderausgabenabzug für tatsächlich erbrachte Vorsorgeaufwendungen
  /// im Rahmen der Veranlagung zur Einkommensteuer bleibt unberührt.
  BigDecimal getBks();

  /// Bemessungsgrundlage der Vergütung für mehrjährige Tätigkeit und der tarifermäßigt
  /// zu besteuernden Vorteile bei Vermögensbeteiligungen für die Kirchenlohnsteuer in Cent
  BigDecimal getBkv();

  /// Fuer den Lohnzahlungszeitraum einzubehaltende Lohnsteuer in Cents
  BigDecimal getLstlzz();

  /// Fuer den Lohnzahlungszeitraum einzubehaltender Solidaritaetszuschlag
  /// in Cents
  BigDecimal getSolzlzz();

  /// Solidaritätszuschlag für sonstige Bezüge (ohne Vergütung für mehrjährige Tätigkeit in Cent.
  /// Hinweis: Negativbeträge, die aus nicht zu besteuernden Vorteilen bei Vermögensbeteiligungen
  /// (§ 19a Absatz 1 Satz 4 EStG) resultieren, mindern SOLZLZZ (maximal bis 0). Der
  /// Sonderausgabenabzug für tatsächlich erbrachte Vorsorgeaufwendungen im Rahmen der
  /// Veranlagung zur Einkommensteuer bleibt unberührt.
  BigDecimal getSolzs();

  /// Solidaritätszuschlag für die Vergütung für mehrjährige Tätigkeit und der tarifermäßigt
  /// zu besteuernden Vorteile bei Vermögensbeteiligungen in Cent
  BigDecimal getSolzv();

  /// Lohnsteuer für sonstige Bezüge (ohne Vergütung für mehrjährige Tätigkeit und ohne
  /// tarifermäßigt zu besteuernde Vorteile bei Vermögensbeteiligungen) in Cent
  /// Hinweis: Negativbeträge, die aus nicht zu besteuernden Vorteilen bei Vermögensbeteiligungen
  /// (§ 19a Absatz 1 Satz 4 EStG) resultieren, mindern LSTLZZ (maximal bis 0). Der
  /// Sonderausgabenabzug für tatsächlich erbrachte Vorsorgeaufwendungen im Rahmen der
  /// Veranlagung zur Einkommensteuer bleibt unberührt.
  BigDecimal getSts();

  /// Lohnsteuer für die Vergütung für mehrjährige Tätigkeit und der tarifermäßigt zu besteuernden
  /// Vorteile bei Vermögensbeteiligungen in Cent
  BigDecimal getStv();

  /// Für den Lohnzahlungszeitraum berücksichtigte Beiträge des Arbeitnehmers zur
  /// privaten Basis-Krankenversicherung und privaten Pflege-Pflichtversicherung (ggf. auch
  /// die Mindestvorsorgepauschale) in Cent beim laufenden Arbeitslohn. Für Zwecke der Lohn-
  /// steuerbescheinigung sind die einzelnen Ausgabewerte außerhalb des eigentlichen Lohn-
  /// steuerbescheinigungsprogramms zu addieren; hinzuzurechnen sind auch die Ausgabewerte
  /// VKVSONST
  BigDecimal getVkvlzz();

  /// Für den Lohnzahlungszeitraum berücksichtigte Beiträge des Arbeitnehmers
  /// zur privaten Basis-Krankenversicherung und privaten Pflege-Pflichtversicherung (ggf.
  /// auch die Mindestvorsorgepauschale) in Cent bei sonstigen Bezügen. Der Ausgabewert kann
  /// auch negativ sein. Für tarifermäßigt zu besteuernde Vergütungen für mehrjährige
  /// Tätigkeiten enthält der PAP keinen entsprechenden Ausgabewert.
  BigDecimal getVkvsonst();

  /// Verbrauchter Freibetrag bei Berechnung des laufenden Arbeitslohns, in Cent
  BigDecimal getVfrb();

  /// Verbrauchter Freibetrag bei Berechnung des voraussichtlichen Jahresarbeitslohns, in Cent
  BigDecimal getVfrbs1();

  /// Verbrauchter Freibetrag bei Berechnung der sonstigen Bezüge, in Cent
  BigDecimal getVfrbs2();

  /// Für die weitergehende Berücksichtigung des Steuerfreibetrags nach dem DBA Türkei verfügbares ZVE über
  /// dem Grundfreibetrag bei der Berechnung des laufenden Arbeitslohns, in Cent
  BigDecimal getWvfrb();

  /// Für die weitergehende Berücksichtigung des Steuerfreibetrags nach dem DBA Türkei verfügbares ZVE über dem Grundfreibetrag
  /// bei der Berechnung des voraussichtlichen Jahresarbeitslohns, in Cent
  BigDecimal getWvfrbo();

  /// Für die weitergehende Berücksichtigung des Steuerfreibetrags nach dem DBA Türkei verfügbares ZVE
  /// über dem Grundfreibetrag bei der Berechnung der sonstigen Bezüge, in Cent
  BigDecimal getWvfrbm();
}

