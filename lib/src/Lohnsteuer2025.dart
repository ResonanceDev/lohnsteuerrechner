import 'package:lohnsteuerrechenr/src/BigDecimal.dart';
import 'package:lohnsteuerrechenr/src/LohnsteuerInterface.dart';

///
/// @author Marcel Lehmann (https://github.com/MarcelLehmann/Lohnsteuer)
/// @date Fri Mar 15 08:35:04 CET 2024
///


class Lohnsteuer2025 implements LohnsteuerInterface {

	/** Stand: 2024-11-18 14:40 */
	/** ITZBund Berlin */

	/* EINGABEPARAMETER*/

	int af = 1;
	int AJAHR = 0;
	int ALTER1 = 0;
	double f = 1.0;
	BigDecimal JFREIB = BigDecimal(0);
	BigDecimal JHINZU = BigDecimal(0);
	BigDecimal JRE4 = BigDecimal(0);
	BigDecimal JRE4ENT = BigDecimal.ZERO;
	BigDecimal JVBEZ = BigDecimal(0);
	int KRV = 0;
	BigDecimal KVZ = BigDecimal(0);
	int LZZ = 0;
	BigDecimal LZZFREIB = BigDecimal(0);
	BigDecimal LZZHINZU = BigDecimal(0);
	BigDecimal MBV = BigDecimal(0);
	BigDecimal PKPV = BigDecimal(0);
	int PKV = 0;
	BigDecimal PVA = BigDecimal(0);
	int PVS = 0;
	int PVZ = 0;
	int R = 0;
	BigDecimal RE4 = BigDecimal(0);
	BigDecimal SONSTB = BigDecimal(0);
	BigDecimal SONSTENT = BigDecimal.ZERO;
	BigDecimal STERBE = BigDecimal(0);
	int STKL = 0;
	BigDecimal VBEZ = BigDecimal(0);
	BigDecimal VBEZM = BigDecimal(0);
	BigDecimal VBEZS = BigDecimal(0);
	BigDecimal VBS = BigDecimal(0);
	int VJAHR = 0;
	BigDecimal ZKF = BigDecimal(0);
	int ZMVB = 0;

	/* AUSGABEPARAMETER*/

	BigDecimal BK = BigDecimal(0);
	BigDecimal BKS = BigDecimal(0);
	BigDecimal LSTLZZ = BigDecimal(0);
	BigDecimal SOLZLZZ = BigDecimal(0);
	BigDecimal SOLZS = BigDecimal(0);
	BigDecimal STS = BigDecimal(0);
	BigDecimal VKVLZZ = BigDecimal(0);
	BigDecimal VKVSONST = BigDecimal(0);

	/* AUSGABEPARAMETER DBA*/

	BigDecimal VFRB = BigDecimal(0);
	BigDecimal VFRBS1 = BigDecimal(0);
	BigDecimal VFRBS2 = BigDecimal(0);
	BigDecimal WVFRB = BigDecimal(0);
	BigDecimal WVFRBO = BigDecimal(0);
	BigDecimal WVFRBM = BigDecimal(0);

	/* INTERNE FELDER*/

	/** Altersentlastungsbetrag nach Alterseinkünftegesetz in €,<br>
		             Cent (2 Dezimalstellen) */
	BigDecimal ALTE = BigDecimal(0);

	/** Arbeitnehmer-Pauschbetrag in EURO */
	BigDecimal ANP = BigDecimal(0);

	/** Auf den Lohnzahlungszeitraum entfallender Anteil von Jahreswerten<br>
		             auf ganze Cents abgerundet */
	BigDecimal ANTEIL1 = BigDecimal(0);

	/** Bemessungsgrundlage für Altersentlastungsbetrag in €, Cent<br>
		             (2 Dezimalstellen) */
	BigDecimal BMG = BigDecimal(0);

	/** Beitragsbemessungsgrenze in der gesetzlichen Krankenversicherung <br>
		        	und der sozialen Pflegeversicherung in Euro */
	BigDecimal BBGKVPV = BigDecimal(0);

	/** allgemeine Beitragsbemessungsgrenze in der allgemeinen Renten-versicherung in Euro */
	BigDecimal BBGRV = BigDecimal(0);

	/** Differenz zwischen ST1 und ST2 in EURO */
	BigDecimal DIFF = BigDecimal(0);

	/** Entlastungsbetrag für Alleinerziehende in Euro */
	BigDecimal EFA = BigDecimal(0);

	/** Versorgungsfreibetrag in €, Cent (2 Dezimalstellen) */
	BigDecimal FVB = BigDecimal(0);

	/** Versorgungsfreibetrag in €, Cent (2 Dezimalstellen) für die Berechnung<br>
		             der Lohnsteuer für den sonstigen Bezug */
	BigDecimal FVBSO = BigDecimal(0);

	/** Zuschlag zum Versorgungsfreibetrag in EURO */
	BigDecimal FVBZ = BigDecimal(0);

	/** Zuschlag zum Versorgungsfreibetrag in EURO fuer die Berechnung<br>
		             der Lohnsteuer beim sonstigen Bezug */
	BigDecimal FVBZSO = BigDecimal(0);

	/** Grundfreibetrag in Euro */
	BigDecimal GFB = BigDecimal(0);

	/** Maximaler Altersentlastungsbetrag in € */
	BigDecimal HBALTE = BigDecimal(0);

	/** Maßgeblicher maximaler Versorgungsfreibetrag in Euro, Cent (2 Dezimalstellen) */
	BigDecimal HFVB = BigDecimal(0);

	/** Massgeblicher maximaler Zuschlag zum Versorgungsfreibetrag in €,Cent<br>
		             (2 Dezimalstellen) */
	BigDecimal HFVBZ = BigDecimal(0);

	/** Massgeblicher maximaler Zuschlag zum Versorgungsfreibetrag in €, Cent<br>
		             (2 Dezimalstellen) für die Berechnung der Lohnsteuer für den<br>
		             sonstigen Bezug */
	BigDecimal HFVBZSO = BigDecimal(0);

	/** Zwischenfeld zu X fuer die Berechnung der Steuer nach § 39b<br>
		             Abs. 2 Satz 7 EStG in € */
	BigDecimal HOCH = BigDecimal(0);

	/** Nummer der Tabellenwerte fuer Versorgungsparameter */
	int J = 0;

	/** Jahressteuer nach § 51a EStG, aus der Solidaritaetszuschlag und<br>
		             Bemessungsgrundlage fuer die Kirchenlohnsteuer ermittelt werden in EURO */
	BigDecimal JBMG = BigDecimal(0);

	/** Auf einen Jahreslohn hochgerechneter LZZFREIB in €, Cent<br>
		             (2 Dezimalstellen) */
	BigDecimal JLFREIB = BigDecimal(0);

	/** Auf einen Jahreslohn hochgerechnete LZZHINZU in €, Cent<br>
		             (2 Dezimalstellen) */
	BigDecimal JLHINZU = BigDecimal(0);

	/** Jahreswert, dessen Anteil fuer einen Lohnzahlungszeitraum in<br>
		             UPANTEIL errechnet werden soll in Cents */
	BigDecimal JW = BigDecimal(0);

	/** Nummer der Tabellenwerte fuer Parameter bei Altersentlastungsbetrag */
	int K = 0;

	/** Summe der Freibetraege fuer Kinder in EURO */
	BigDecimal KFB = BigDecimal(0);

	/** Beitragssatz des Arbeitgebers zur Krankenversicherung */
	BigDecimal KVSATZAG = BigDecimal(0);

	/** Beitragssatz des Arbeitnehmers zur Krankenversicherung */
	BigDecimal KVSATZAN = BigDecimal(0);

	/** Kennzahl fuer die Einkommensteuer-Tabellenart:<br>
		             1 = Grundtabelle<br>
		             2 = Splittingtabelle */
	int KZTAB = 0;

	/** Jahreslohnsteuer in EURO */
	BigDecimal LSTJAHR = BigDecimal(0);

	/** Zwischenfelder der Jahreslohnsteuer in Cent */
	BigDecimal LSTOSO = BigDecimal(0);
	BigDecimal LSTSO = BigDecimal(0);

	/** Mindeststeuer fuer die Steuerklassen V und VI in EURO */
	BigDecimal MIST = BigDecimal(0);

	/** Beitragssatz des Arbeitgebers zur Pflegeversicherung (6 Dezimalstellen) */
	BigDecimal PVSATZAG = BigDecimal(0);

	/** Beitragssatz des Arbeitnehmers zur Pflegeversicherung (6 Dezimalstellen) */
	BigDecimal PVSATZAN = BigDecimal(0);

	/** Beitragssatz des Arbeitnehmers in der allgemeinen gesetzlichen Rentenversicherung (4 Dezimalstellen) */
	BigDecimal RVSATZAN = BigDecimal(0);

	/** Rechenwert in Gleitkommadarstellung */
	BigDecimal RW = BigDecimal(0);

	/** Sonderausgaben-Pauschbetrag in EURO */
	BigDecimal SAP = BigDecimal(0);

	/** Freigrenze fuer den Solidaritaetszuschlag in EURO */
	BigDecimal SOLZFREI = BigDecimal(0);

	/** Solidaritaetszuschlag auf die Jahreslohnsteuer in EURO, C (2 Dezimalstellen) */
	BigDecimal SOLZJ = BigDecimal(0);

	/** Zwischenwert fuer den Solidaritaetszuschlag auf die Jahreslohnsteuer<br>
		             in EURO, C (2 Dezimalstellen) */
	BigDecimal SOLZMIN = BigDecimal(0);

	/** Bemessungsgrundlage des Solidaritätszuschlags zur Prüfung der Freigrenze beim Solidaritätszuschlag für sonstige Bezüge in Euro */
	BigDecimal SOLZSBMG = BigDecimal(0);

	/** Zu versteuerndes Einkommen für die Ermittlung der Bemessungsgrundlage des Solidaritätszuschlags zur Prüfung der Freigrenze beim Solidaritätszuschlag für sonstige Bezüge in Euro, Cent (2 Dezimalstellen) */
	BigDecimal SOLZSZVE = BigDecimal(0);

	/** Bemessungsgrundlage des Solidaritätszuschlags für die Prüfung der Freigrenze beim Solidaritätszuschlag für die Vergütung für mehrjährige Tätigkeit in Euro */
	BigDecimal SOLZVBMG = BigDecimal(0);

	/** Tarifliche Einkommensteuer in EURO */
	BigDecimal ST = BigDecimal(0);

	/** Tarifliche Einkommensteuer auf das 1,25-fache ZX in EURO */
	BigDecimal ST1 = BigDecimal(0);

	/** Tarifliche Einkommensteuer auf das 0,75-fache ZX in EURO */
	BigDecimal ST2 = BigDecimal(0);

	/** Bemessungsgrundlage fuer den Versorgungsfreibetrag in Cents */
	BigDecimal VBEZB = BigDecimal(0);

	/** Bemessungsgrundlage für den Versorgungsfreibetrag in Cent für<br>
		             den sonstigen Bezug */
	BigDecimal VBEZBSO = BigDecimal(0);

	/** Zwischenfeld zu X fuer die Berechnung der Steuer nach § 39b<br>
		             Abs. 2 Satz 7 EStG in € */
	BigDecimal VERGL = BigDecimal(0);

	/** Hoechstbetrag der Vorsorgepauschale nach Alterseinkuenftegesetz in EURO, C */
	BigDecimal VHB = BigDecimal(0);

	/** Jahreswert der berücksichtigten Beiträge zur privaten Basis-Krankenversicherung und <br>
					  privaten Pflege-Pflichtversicherung (ggf. auch die Mindestvorsorgepauschale) in Cent. */
	BigDecimal VKV = BigDecimal(0);

	/** Vorsorgepauschale in EURO, C (2 Dezimalstellen) */
	BigDecimal VSP = BigDecimal(0);

	/** Vorsorgepauschale nach Alterseinkuenftegesetz in EURO, C */
	BigDecimal VSPN = BigDecimal(0);

	/** Zwischenwert 1 bei der Berechnung der Vorsorgepauschale nach<br>
		             dem Alterseinkuenftegesetz in EURO, C (2 Dezimalstellen) */
	BigDecimal VSP1 = BigDecimal(0);

	/** Zwischenwert 2 bei der Berechnung der Vorsorgepauschale nach<br>
		             dem Alterseinkuenftegesetz in EURO, C (2 Dezimalstellen) */
	BigDecimal VSP2 = BigDecimal(0);

	/** Vorsorgepauschale mit Teilbeträgen für die gesetzliche Kranken- und <br>
					 soziale Pflegeversicherung nach fiktiven Beträgen oder ggf. für die<br>
					 private Basiskrankenversicherung und private Pflege-Pflichtversicherung <br>
					 in Euro, Cent (2 Dezimalstellen) */
	BigDecimal VSP3 = BigDecimal(0);

	/** Erster Grenzwert in Steuerklasse V/VI in Euro */
	BigDecimal W1STKL5 = BigDecimal(0);

	/** Zweiter Grenzwert in Steuerklasse V/VI in Euro */
	BigDecimal W2STKL5 = BigDecimal(0);

	/** Dritter Grenzwert in Steuerklasse V/VI in Euro */
	BigDecimal W3STKL5 = BigDecimal(0);

	/** Zu versteuerndes Einkommen gem. § 32a Abs. 1 und 2 EStG €, C<br>
		             (2 Dezimalstellen) */
	BigDecimal X = BigDecimal(0);

	/** Gem. § 32a Abs. 1 EStG (6 Dezimalstellen) */
	BigDecimal Y = BigDecimal(0);

	/** Auf einen Jahreslohn hochgerechnetes RE4 in €, C (2 Dezimalstellen)<br>
		             nach Abzug der Freibeträge nach § 39 b Abs. 2 Satz 3 und 4. */
	BigDecimal ZRE4 = BigDecimal(0);

	/** Auf einen Jahreslohn hochgerechnetes RE4 in €, C (2 Dezimalstellen) */
	BigDecimal ZRE4J = BigDecimal(0);

	/** Auf einen Jahreslohn hochgerechnetes RE4 in €, C (2 Dezimalstellen)<br>
		             nach Abzug des Versorgungsfreibetrags und des Alterentlastungsbetrags<br>
		             zur Berechnung der Vorsorgepauschale in €, Cent (2 Dezimalstellen) */
	BigDecimal ZRE4VP = BigDecimal(0);

	/** Feste Tabellenfreibeträge (ohne Vorsorgepauschale) in €, Cent<br>
		             (2 Dezimalstellen) */
	BigDecimal ZTABFB = BigDecimal(0);

	/** Auf einen Jahreslohn hochgerechnetes (VBEZ abzueglich FVB) in<br>
		             EURO, C (2 Dezimalstellen) */
	BigDecimal ZVBEZ = BigDecimal(0);

	/** Auf einen Jahreslohn hochgerechnetes VBEZ in €, C (2 Dezimalstellen) */
	BigDecimal ZVBEZJ = BigDecimal(0);

	/** Zu versteuerndes Einkommen in €, C (2 Dezimalstellen) */
	BigDecimal ZVE = BigDecimal(0);

	/** Zwischenfeld zu X fuer die Berechnung der Steuer nach § 39b<br>
		             Abs. 2 Satz 7 EStG in € */
	BigDecimal ZX = BigDecimal(0);

	/** Zwischenfeld zu X fuer die Berechnung der Steuer nach § 39b<br>
		             Abs. 2 Satz 7 EStG in € */
	BigDecimal ZZX = BigDecimal(0);

	/* KONSTANTEN */

	/** Tabelle fuer die Vomhundertsaetze des Versorgungsfreibetrags */

	/** geändert für 2025 */
	static final List<BigDecimal> TAB1 = [BigDecimal.valueOf(0), BigDecimal.valueOf( 0.4), BigDecimal.valueOf( 0.384), BigDecimal.valueOf( 0.368), BigDecimal.valueOf( 0.352), BigDecimal.valueOf( 0.336), BigDecimal.valueOf( 0.32), BigDecimal.valueOf( 0.304), BigDecimal.valueOf( 0.288), BigDecimal.valueOf( 0.272), BigDecimal.valueOf( 0.256), BigDecimal.valueOf( 0.24), BigDecimal.valueOf( 0.224), BigDecimal.valueOf( 0.208), BigDecimal.valueOf( 0.192), BigDecimal.valueOf( 0.176), BigDecimal.valueOf( 0.16), BigDecimal.valueOf( 0.152), BigDecimal.valueOf( 0.144), BigDecimal.valueOf( 0.14), BigDecimal.valueOf( 0.136), BigDecimal.valueOf( 0.132), BigDecimal.valueOf( 0.128), BigDecimal.valueOf( 0.124), BigDecimal.valueOf( 0.12), BigDecimal.valueOf( 0.116), BigDecimal.valueOf( 0.112), BigDecimal.valueOf( 0.108), BigDecimal.valueOf( 0.104), BigDecimal.valueOf( 0.1), BigDecimal.valueOf( 0.096), BigDecimal.valueOf( 0.092), BigDecimal.valueOf( 0.088), BigDecimal.valueOf( 0.084), BigDecimal.valueOf( 0.08), BigDecimal.valueOf( 0.076), BigDecimal.valueOf( 0.072), BigDecimal.valueOf( 0.068), BigDecimal.valueOf( 0.064), BigDecimal.valueOf( 0.06), BigDecimal.valueOf( 0.056), BigDecimal.valueOf( 0.052), BigDecimal.valueOf( 0.048), BigDecimal.valueOf( 0.044), BigDecimal.valueOf( 0.04), BigDecimal.valueOf( 0.036), BigDecimal.valueOf( 0.032), BigDecimal.valueOf( 0.028), BigDecimal.valueOf( 0.024), BigDecimal.valueOf( 0.02), BigDecimal.valueOf( 0.016), BigDecimal.valueOf( 0.012), BigDecimal.valueOf( 0.008), BigDecimal.valueOf( 0.004), BigDecimal.valueOf( 0)];

	/** Tabelle fuer die Hoechstbetrage des Versorgungsfreibetrags */

	/** geändert für 2025 */
	static final List<BigDecimal> TAB2 = [BigDecimal.valueOf(0), BigDecimal.valueOf( 3000), BigDecimal.valueOf( 2880), BigDecimal.valueOf( 2760), BigDecimal.valueOf( 2640), BigDecimal.valueOf( 2520), BigDecimal.valueOf( 2400), BigDecimal.valueOf( 2280), BigDecimal.valueOf( 2160), BigDecimal.valueOf( 2040), BigDecimal.valueOf( 1920), BigDecimal.valueOf( 1800), BigDecimal.valueOf( 1680), BigDecimal.valueOf( 1560), BigDecimal.valueOf( 1440), BigDecimal.valueOf( 1320), BigDecimal.valueOf( 1200), BigDecimal.valueOf( 1140), BigDecimal.valueOf( 1080), BigDecimal.valueOf( 1050), BigDecimal.valueOf( 1020), BigDecimal.valueOf( 990), BigDecimal.valueOf( 960), BigDecimal.valueOf( 930), BigDecimal.valueOf( 900), BigDecimal.valueOf( 870), BigDecimal.valueOf( 840), BigDecimal.valueOf( 810), BigDecimal.valueOf( 780), BigDecimal.valueOf( 750), BigDecimal.valueOf( 720), BigDecimal.valueOf( 690), BigDecimal.valueOf( 660), BigDecimal.valueOf( 630), BigDecimal.valueOf( 600), BigDecimal.valueOf( 570), BigDecimal.valueOf( 540), BigDecimal.valueOf( 510), BigDecimal.valueOf( 480), BigDecimal.valueOf( 450), BigDecimal.valueOf( 420), BigDecimal.valueOf( 390), BigDecimal.valueOf( 360), BigDecimal.valueOf( 330), BigDecimal.valueOf( 300), BigDecimal.valueOf( 270), BigDecimal.valueOf( 240), BigDecimal.valueOf( 210), BigDecimal.valueOf( 180), BigDecimal.valueOf( 150), BigDecimal.valueOf( 120), BigDecimal.valueOf( 90), BigDecimal.valueOf( 60), BigDecimal.valueOf( 30), BigDecimal.valueOf( 0) ];

	/** Tabelle fuer die Zuschlaege zum Versorgungsfreibetrag */

	/** geändert für 2025 */
	static final List<BigDecimal> TAB3 = [BigDecimal.valueOf(0), BigDecimal.valueOf( 900), BigDecimal.valueOf( 864), BigDecimal.valueOf( 828), BigDecimal.valueOf( 792), BigDecimal.valueOf( 756), BigDecimal.valueOf( 720), BigDecimal.valueOf( 684), BigDecimal.valueOf( 648), BigDecimal.valueOf( 612), BigDecimal.valueOf( 576), BigDecimal.valueOf( 540), BigDecimal.valueOf( 504), BigDecimal.valueOf( 468), BigDecimal.valueOf( 432), BigDecimal.valueOf( 396), BigDecimal.valueOf( 360), BigDecimal.valueOf( 342), BigDecimal.valueOf( 324), BigDecimal.valueOf( 315), BigDecimal.valueOf( 306), BigDecimal.valueOf( 297), BigDecimal.valueOf( 288), BigDecimal.valueOf( 279), BigDecimal.valueOf( 270), BigDecimal.valueOf( 261), BigDecimal.valueOf( 252), BigDecimal.valueOf( 243), BigDecimal.valueOf( 234), BigDecimal.valueOf( 225), BigDecimal.valueOf( 216), BigDecimal.valueOf( 207), BigDecimal.valueOf( 198), BigDecimal.valueOf( 189), BigDecimal.valueOf( 180), BigDecimal.valueOf( 171), BigDecimal.valueOf( 162), BigDecimal.valueOf( 153), BigDecimal.valueOf( 144), BigDecimal.valueOf( 135), BigDecimal.valueOf( 126), BigDecimal.valueOf( 117), BigDecimal.valueOf( 108), BigDecimal.valueOf( 99), BigDecimal.valueOf( 90), BigDecimal.valueOf( 81), BigDecimal.valueOf( 72), BigDecimal.valueOf( 63), BigDecimal.valueOf( 54), BigDecimal.valueOf( 45), BigDecimal.valueOf( 36), BigDecimal.valueOf( 27), BigDecimal.valueOf( 18), BigDecimal.valueOf( 9), BigDecimal.valueOf( 0)];

	/** Tabelle fuer die Vomhundertsaetze des Altersentlastungsbetrags */

	/** geändert für 2025 */
	static final List<BigDecimal> TAB4 = [BigDecimal.valueOf(0), BigDecimal.valueOf( 0.4), BigDecimal.valueOf( 0.384), BigDecimal.valueOf( 0.368), BigDecimal.valueOf( 0.352), BigDecimal.valueOf( 0.336), BigDecimal.valueOf( 0.32), BigDecimal.valueOf( 0.304), BigDecimal.valueOf( 0.288), BigDecimal.valueOf( 0.272), BigDecimal.valueOf( 0.256), BigDecimal.valueOf( 0.24), BigDecimal.valueOf( 0.224), BigDecimal.valueOf( 0.208), BigDecimal.valueOf( 0.192), BigDecimal.valueOf( 0.176), BigDecimal.valueOf( 0.16), BigDecimal.valueOf( 0.152), BigDecimal.valueOf( 0.144), BigDecimal.valueOf( 0.14), BigDecimal.valueOf( 0.136), BigDecimal.valueOf( 0.132), BigDecimal.valueOf( 0.128), BigDecimal.valueOf( 0.124), BigDecimal.valueOf( 0.12), BigDecimal.valueOf( 0.116), BigDecimal.valueOf( 0.112), BigDecimal.valueOf( 0.108), BigDecimal.valueOf( 0.104), BigDecimal.valueOf( 0.1), BigDecimal.valueOf( 0.096), BigDecimal.valueOf( 0.092), BigDecimal.valueOf( 0.088), BigDecimal.valueOf( 0.084), BigDecimal.valueOf( 0.08), BigDecimal.valueOf( 0.076), BigDecimal.valueOf( 0.072), BigDecimal.valueOf( 0.068), BigDecimal.valueOf( 0.064), BigDecimal.valueOf( 0.06), BigDecimal.valueOf( 0.056), BigDecimal.valueOf( 0.052), BigDecimal.valueOf( 0.048), BigDecimal.valueOf( 0.044), BigDecimal.valueOf( 0.04), BigDecimal.valueOf( 0.036), BigDecimal.valueOf( 0.032), BigDecimal.valueOf( 0.028), BigDecimal.valueOf( 0.024), BigDecimal.valueOf( 0.02), BigDecimal.valueOf( 0.016), BigDecimal.valueOf( 0.012), BigDecimal.valueOf( 0.008), BigDecimal.valueOf( 0.004), BigDecimal.valueOf( 0)];

	/** Tabelle fuer die Hoechstbetraege des Altersentlastungsbetrags */

	/** geändert für 2025 */
	static final List<BigDecimal> TAB5 = [BigDecimal.valueOf(0), BigDecimal.valueOf( 1900), BigDecimal.valueOf( 1824), BigDecimal.valueOf( 1748), BigDecimal.valueOf( 1672), BigDecimal.valueOf( 1596), BigDecimal.valueOf( 1520), BigDecimal.valueOf( 1444), BigDecimal.valueOf( 1368), BigDecimal.valueOf( 1292), BigDecimal.valueOf( 1216), BigDecimal.valueOf( 1140), BigDecimal.valueOf( 1064), BigDecimal.valueOf( 988), BigDecimal.valueOf( 912), BigDecimal.valueOf( 836), BigDecimal.valueOf( 760), BigDecimal.valueOf( 722), BigDecimal.valueOf( 684), BigDecimal.valueOf( 665), BigDecimal.valueOf( 646), BigDecimal.valueOf( 627), BigDecimal.valueOf( 608), BigDecimal.valueOf( 589), BigDecimal.valueOf( 570), BigDecimal.valueOf( 551), BigDecimal.valueOf( 532), BigDecimal.valueOf( 513), BigDecimal.valueOf( 494), BigDecimal.valueOf( 475), BigDecimal.valueOf( 456), BigDecimal.valueOf( 437), BigDecimal.valueOf( 418), BigDecimal.valueOf( 399), BigDecimal.valueOf( 380), BigDecimal.valueOf( 361), BigDecimal.valueOf( 342), BigDecimal.valueOf( 323), BigDecimal.valueOf( 304), BigDecimal.valueOf( 285), BigDecimal.valueOf( 266), BigDecimal.valueOf( 247), BigDecimal.valueOf( 228), BigDecimal.valueOf( 209), BigDecimal.valueOf( 190), BigDecimal.valueOf( 171), BigDecimal.valueOf( 152), BigDecimal.valueOf( 133), BigDecimal.valueOf( 114), BigDecimal.valueOf( 95), BigDecimal.valueOf( 76), BigDecimal.valueOf( 57), BigDecimal.valueOf( 38), BigDecimal.valueOf( 19), BigDecimal.valueOf( 0)];

	/** Zahlenkonstanten fuer im Plan oft genutzte BigDecimal Werte */
	static final BigDecimal ZAHL1 = BigDecimal.ONE;
	static final BigDecimal ZAHL2 = BigDecimal(2);
	static final BigDecimal ZAHL5 = BigDecimal(5);
	static final BigDecimal ZAHL7 = BigDecimal(7);
	static final BigDecimal ZAHL12 = BigDecimal(12);
	static final BigDecimal ZAHL100 = BigDecimal(100);
	static final BigDecimal ZAHL360 = BigDecimal(360);
	static final BigDecimal ZAHL500 = BigDecimal(500);
	static final BigDecimal ZAHL700 = BigDecimal(700);
	static final BigDecimal ZAHL1000 = BigDecimal(1000);
	static final BigDecimal ZAHL10000 = BigDecimal(10000);

	/* SETTER */

	@override
	void setRe4(BigDecimal arg0) { this.RE4 = arg0; }

	@override
	void setPkpv(BigDecimal arg0) { this.PKPV = arg0; }

	@override
	void setAf(int arg0) { this.af = arg0; }

	@override
	void setSterbe(BigDecimal arg0) { this.STERBE = arg0; }

	@override
	void setStkl(int arg0) { this.STKL = arg0; }

	@override
	void setF(double arg0) { this.f = arg0; }

	@override
	void setAjahr(int arg0) { this.AJAHR = arg0; }

	@override
	void setJre4ent(BigDecimal arg0) { this.JRE4ENT = arg0; }

	@override
	void setPvs(int arg0) { this.PVS = arg0; }

	@override
	void setLzz(int arg0) { this.LZZ = arg0; }

	@override
	void setKrv(int arg0) { this.KRV = arg0; }

	@override
	void setKvz(BigDecimal arg0) { this.KVZ = arg0; }

	@override
	void setJhinzu(BigDecimal arg0) { this.JHINZU = arg0; }

	@override
	void setR(int arg0) { this.R = arg0; }

	@override
	void setPvz(int arg0) { this.PVZ = arg0; }

	@override
	void setZmvb(int arg0) { this.ZMVB = arg0; }

	@override
	void setLzzhinzu(BigDecimal arg0) { this.LZZHINZU = arg0; }

	@override
	void setSonstb(BigDecimal arg0) { this.SONSTB = arg0; }

	@override
	void setMbv(BigDecimal arg0) { this.MBV = arg0; }

	@override
	void setJvbez(BigDecimal arg0) { this.JVBEZ = arg0; }

	@override
	void setVbezm(BigDecimal arg0) { this.VBEZM = arg0; }

	@override
	void setVbs(BigDecimal arg0) { this.VBS = arg0; }

	@override
	void setAlter1(int arg0) { this.ALTER1 = arg0; }

	@override
	void setVbez(BigDecimal arg0) { this.VBEZ = arg0; }

	@override
	void setSonstent(BigDecimal arg0) { this.SONSTENT = arg0; }

	@override
	void setJfreib(BigDecimal arg0) { this.JFREIB = arg0; }

	@override
	void setJre4(BigDecimal arg0) { this.JRE4 = arg0; }

	@override
	void setZkf(BigDecimal arg0) { this.ZKF = arg0; }

	@override
	void setLzzfreib(BigDecimal arg0) { this.LZZFREIB = arg0; }

	@override
	void setPkv(int arg0) { this.PKV = arg0; }

	@override
	void setPva(BigDecimal arg0) { this.PVA = arg0; }

	@override
	void setVjahr(int arg0) { this.VJAHR = arg0; }

	@override
	void setVbezs(BigDecimal arg0) { this.VBEZS = arg0; }

	/* GETTER */

	@override
	BigDecimal getLstlzz() { return this.LSTLZZ; }

	@override
	BigDecimal getVfrb() { return this.VFRB; }

	@override
	BigDecimal getBk() { return this.BK; }

	@override
	BigDecimal getBks() { return this.BKS; }

	@override
	BigDecimal getSolzs() { return this.SOLZS; }

	@override
	BigDecimal getVfrbs2() { return this.VFRBS2; }

	@override
	BigDecimal getVfrbs1() { return this.VFRBS1; }

	@override
	BigDecimal getVkvlzz() { return this.VKVLZZ; }

	@override
	BigDecimal getWvfrbm() { return this.WVFRBM; }

	@override
	BigDecimal getSts() { return this.STS; }

	@override
	BigDecimal getVkvsonst() { return this.VKVSONST; }

	@override
	BigDecimal getWvfrb() { return this.WVFRB; }

	@override
	BigDecimal getSolzlzz() { return this.SOLZLZZ; }

	@override
	BigDecimal getWvfrbo() { return this.WVFRBO; }

	/** PROGRAMMABLAUFPLAN, PAP Seite 13 */
	@override
	void main() {

		MPARA();
		MRE4JL();
		VBEZBSO= BigDecimal.ZERO;
		MRE4();
		MRE4ABZ();
		MBERECH();
		MSONST();
	}

	/** Zuweisung von Werten für bestimmte Sozialversicherungsparameter  PAP Seite 14 */
	void MPARA() {

		if(KRV < 1) /** &lt; = < */{
			BBGRV = BigDecimal(96600);/** Geändert für 2025 */
			RVSATZAN = BigDecimal.valueOf(0.093);
		} else {/** Nichts zu tun */
		}
		BBGKVPV = BigDecimal(66150);/** Geändert für 2025 */
		KVSATZAN = (KVZ.divide(ZAHL2).divide(ZAHL100)).add(BigDecimal.valueOf(0.07));
		KVSATZAG = BigDecimal.valueOf(0.0125).add(BigDecimal.valueOf(0.07));/** geändert für 2025 */
		if(PVS == 1) {
			PVSATZAN = BigDecimal.valueOf(0.023);/** geändert für 2025 */
			PVSATZAG = BigDecimal.valueOf(0.013);/** geändert für 2025 */
		} else {
			PVSATZAN =  BigDecimal.valueOf(0.018);
			PVSATZAG =  BigDecimal.valueOf(0.018);/** geändert für 2025 */
		}
		if(PVZ == 1) {
			PVSATZAN = PVSATZAN.add(BigDecimal.valueOf(0.006));
		} else {
			PVSATZAN = PVSATZAN.subtract(PVA.multiply(BigDecimal.valueOf(0.0025)));
		}
		W1STKL5 = BigDecimal(13432);/** geändert für 2025 */
		W2STKL5 = BigDecimal(33380);/** geändert für 2025 */
		W3STKL5 = BigDecimal(222260);
		GFB = BigDecimal(11784);
		SOLZFREI = BigDecimal(18130);
	}

	/** Ermittlung des Jahresarbeitslohns nach § 39 b Abs. 2 Satz 2 EStG, PAP Seite 15 */
	void MRE4JL() {

		if(LZZ == 1) {
			ZRE4J= RE4.divide (ZAHL100, 2, BigDecimal.ROUND_DOWN);
			ZVBEZJ= VBEZ.divide (ZAHL100, 2, BigDecimal.ROUND_DOWN);
			JLFREIB= LZZFREIB.divide (ZAHL100, 2, BigDecimal.ROUND_DOWN);
			JLHINZU= LZZHINZU.divide (ZAHL100, 2, BigDecimal.ROUND_DOWN);
		} else {
			if(LZZ == 2) {
				ZRE4J= (RE4.multiply (ZAHL12)).divide (ZAHL100, 2, BigDecimal.ROUND_DOWN);
				ZVBEZJ= (VBEZ.multiply (ZAHL12)).divide (ZAHL100, 2, BigDecimal.ROUND_DOWN);
				JLFREIB= (LZZFREIB.multiply (ZAHL12)).divide (ZAHL100, 2, BigDecimal.ROUND_DOWN);
				JLHINZU= (LZZHINZU.multiply (ZAHL12)).divide (ZAHL100, 2, BigDecimal.ROUND_DOWN);
			} else {
				if(LZZ == 3) {
					ZRE4J= (RE4.multiply (ZAHL360)).divide (ZAHL700, 2, BigDecimal.ROUND_DOWN);
					ZVBEZJ= (VBEZ.multiply (ZAHL360)).divide (ZAHL700, 2, BigDecimal.ROUND_DOWN);
					JLFREIB= (LZZFREIB.multiply (ZAHL360)).divide (ZAHL700, 2, BigDecimal.ROUND_DOWN);
					JLHINZU= (LZZHINZU.multiply (ZAHL360)).divide (ZAHL700, 2, BigDecimal.ROUND_DOWN);
				} else {
					ZRE4J= (RE4.multiply (ZAHL360)).divide (ZAHL100, 2, BigDecimal.ROUND_DOWN);
					ZVBEZJ= (VBEZ.multiply (ZAHL360)).divide (ZAHL100, 2, BigDecimal.ROUND_DOWN);
					JLFREIB= (LZZFREIB.multiply (ZAHL360)).divide (ZAHL100, 2, BigDecimal.ROUND_DOWN);
					JLHINZU= (LZZHINZU.multiply (ZAHL360)).divide (ZAHL100, 2, BigDecimal.ROUND_DOWN);
				}
			}
		}
		if(af == 0) {
			f= 1;
		}
	}

	/** Freibeträge für Versorgungsbezüge, Altersentlastungsbetrag (§ 39b Abs. 2 Satz 3 EStG), PAP Seite 16 */
	void MRE4() {

		if(ZVBEZJ.compareTo (BigDecimal.ZERO) == 0) {
			FVBZ= BigDecimal.ZERO;
			FVB= BigDecimal.ZERO;
			FVBZSO= BigDecimal.ZERO;
			FVBSO= BigDecimal.ZERO;
		} else {
			if(VJAHR < 2006) {
				J= 1;
			} else {
				if(VJAHR < 2058) /** geändert für 2025 */{
					J= VJAHR - 2004;
				} else {
					J= 54;/** geändert für 2025 */
				}
			}
			if(LZZ == 1) {
				VBEZB= (VBEZM.multiply (BigDecimal.valueOf (ZMVB))).add (VBEZS);
				HFVB= TAB2[J].divide (ZAHL12).multiply (BigDecimal.valueOf (ZMVB)).setScale (0, BigDecimal.ROUND_UP);/** geändert für 2025 */
				FVBZ= TAB3[J].divide (ZAHL12).multiply (BigDecimal.valueOf (ZMVB)).setScale (0, BigDecimal.ROUND_UP);
			} else {
				VBEZB= ((VBEZM.multiply (ZAHL12)).add (VBEZS)).setScale (2, BigDecimal.ROUND_DOWN);
				HFVB= TAB2[J];
				FVBZ= TAB3[J];
			}
			FVB= ((VBEZB.multiply (TAB1[J]))).divide (ZAHL100).setScale (2, BigDecimal.ROUND_UP);
			if(FVB.compareTo (HFVB) == 1) {
				FVB = HFVB;
			}
			if(FVB.compareTo (ZVBEZJ) == 1) {
				FVB = ZVBEZJ;
			}
			FVBSO= (FVB.add((VBEZBSO.multiply (TAB1[J])).divide (ZAHL100))).setScale (2, BigDecimal.ROUND_UP);
			if(FVBSO.compareTo (TAB2[J]) == 1) {
				FVBSO = TAB2[J];
			}
			HFVBZSO= (((VBEZB.add(VBEZBSO)).divide (ZAHL100)).subtract (FVBSO)).setScale (2, BigDecimal.ROUND_DOWN);
			FVBZSO= (FVBZ.add((VBEZBSO).divide (ZAHL100))).setScale (0, BigDecimal.ROUND_UP);
			if(FVBZSO.compareTo (HFVBZSO) == 1) {
				FVBZSO = HFVBZSO.setScale(0, BigDecimal.ROUND_UP);
			}
			if(FVBZSO.compareTo (TAB3[J]) == 1) {
				FVBZSO = TAB3[J];
			}
			HFVBZ= ((VBEZB.divide (ZAHL100)).subtract (FVB)).setScale (2, BigDecimal.ROUND_DOWN);
			if(FVBZ.compareTo (HFVBZ) == 1) {
				FVBZ = HFVBZ.setScale (0, BigDecimal.ROUND_UP);
			}
		}
		MRE4ALTE();
	}

	/** Altersentlastungsbetrag (§ 39b Abs. 2 Satz 3 EStG), PAP Seite 17 */
	void MRE4ALTE() {

		if(ALTER1 == 0) {
			ALTE= BigDecimal.ZERO;
		} else {
			if(AJAHR < 2006) {
				K= 1;
			} else {
				if(AJAHR < 2058) /** geändert für 2025 */{
					K= AJAHR - 2004;
				} else {
					K= 54;/** geändert für 2025 */
				}
			}
			BMG= ZRE4J.subtract (ZVBEZJ);/** Lt. PAP muss hier auf ganze EUR gerundet werden */
			ALTE = (BMG.multiply(TAB4[K])).setScale(0, BigDecimal.ROUND_UP);
			HBALTE= TAB5[K];
			if(ALTE.compareTo (HBALTE) == 1) {
				ALTE= HBALTE;
			}
		}
	}

	/** Ermittlung des Jahresarbeitslohns nach Abzug der Freibeträge nach § 39 b Abs. 2 Satz 3 und 4 EStG, PAP Seite 20 */
	void MRE4ABZ() {

		ZRE4= (ZRE4J.subtract (FVB).subtract   (ALTE).subtract (JLFREIB).add (JLHINZU)).setScale (2, BigDecimal.ROUND_DOWN);
		if(ZRE4.compareTo (BigDecimal.ZERO) == -1) {
			ZRE4= BigDecimal.ZERO;
		}
		ZRE4VP= ZRE4J;
		ZVBEZ = ZVBEZJ.subtract(FVB).setScale(2, BigDecimal.ROUND_DOWN);
		if(ZVBEZ.compareTo(BigDecimal.ZERO) == -1) {
			ZVBEZ = BigDecimal.ZERO;
		}
	}

	/** Berechnung fuer laufende Lohnzahlungszeitraueme Seite 21 */
	void MBERECH() {

		MZTABFB();
		VFRB = ((ANP.add(FVB.add(FVBZ))).multiply(ZAHL100)).setScale(0, BigDecimal.ROUND_DOWN);
		MLSTJAHR();
		WVFRB = ((ZVE.subtract(GFB)).multiply(ZAHL100)).setScale(0, BigDecimal.ROUND_DOWN);
		if(WVFRB.compareTo(BigDecimal.ZERO) == -1) /** WVFRB < 0 */{
			WVFRB = BigDecimal.valueOf(0);
		}
		LSTJAHR = (ST.multiply(BigDecimal.valueOf(f))).setScale(0,BigDecimal.ROUND_DOWN);
		UPLSTLZZ();
		UPVKVLZZ();
		if(ZKF.compareTo(BigDecimal.ZERO) == 1) /** ZKF > 0 */{
			ZTABFB = ZTABFB.add(KFB);
			MRE4ABZ();
			MLSTJAHR();
			JBMG = (ST.multiply(BigDecimal.valueOf(f))).setScale(0,BigDecimal.ROUND_DOWN);
		} else {
			JBMG = LSTJAHR;
		}
		MSOLZ();
	}

	/** Ermittlung der festen Tabellenfreibeträge (ohne Vorsorgepauschale), PAP Seite 22 */
	void MZTABFB() {

		ANP= BigDecimal.ZERO;
		if(ZVBEZ.compareTo (BigDecimal.ZERO) >= 0 && ZVBEZ.compareTo(FVBZ) == -1) {
			FVBZ = BigDecimal.valueOf(ZVBEZ.longValue());
		}
		if(STKL < 6) {
			if(ZVBEZ.compareTo (BigDecimal.ZERO) == 1) {
				if((ZVBEZ.subtract (FVBZ)).compareTo (BigDecimal.valueOf (102)) == -1) {
					ANP= (ZVBEZ.subtract (FVBZ)).setScale (0, BigDecimal.ROUND_UP);
				} else {
					ANP= BigDecimal.valueOf (102);
				}
			}
		} else {
			FVBZ= BigDecimal.valueOf (0);
			FVBZSO= BigDecimal.valueOf (0);
		}
		if(STKL < 6) {
			if(ZRE4.compareTo(ZVBEZ) == 1) {
				if(ZRE4.subtract(ZVBEZ).compareTo(BigDecimal.valueOf(1230)) == -1) {
					ANP = ANP.add(ZRE4).subtract(ZVBEZ).setScale(0,BigDecimal.ROUND_UP);
				} else {
					ANP = ANP.add(BigDecimal.valueOf(1230));
				}
			}
		}
		KZTAB= 1;
		if(STKL == 1) {
			SAP= BigDecimal.valueOf (36);
			KFB= (ZKF.multiply (BigDecimal.valueOf (9540))).setScale (0, BigDecimal.ROUND_DOWN);/** geändert für 2025 */
		} else {
			if(STKL == 2) {
				EFA= BigDecimal.valueOf (4260);
				SAP= BigDecimal.valueOf (36);
				KFB= (ZKF.multiply (BigDecimal.valueOf (9540))).setScale (0, BigDecimal.ROUND_DOWN);/** geändert für 2025 */
			} else {
				if(STKL == 3) {
					KZTAB= 2;
					SAP= BigDecimal.valueOf (36);
					KFB= (ZKF.multiply (BigDecimal.valueOf (9540))).setScale (0, BigDecimal.ROUND_DOWN);/** geändert für 2025 */
				} else {
					if(STKL == 4) {
						SAP= BigDecimal.valueOf (36);
						KFB= (ZKF.multiply (BigDecimal.valueOf (4770))).setScale (0, BigDecimal.ROUND_DOWN);/** geändert für 2025 */
					} else {
						if(STKL == 5) {
							SAP= BigDecimal.valueOf (36);
							KFB= BigDecimal.ZERO;
						} else {
							KFB= BigDecimal.ZERO;
						}
					}
				}
			}
		}
		ZTABFB= (EFA.add (ANP).add (SAP).add (FVBZ)).setScale (2, BigDecimal.ROUND_DOWN);
	}

	/** Ermittlung Jahreslohnsteuer, PAP Seite 23 */
	void MLSTJAHR() {

		UPEVP();
		ZVE= ZRE4.subtract (ZTABFB).subtract(VSP);/** geändert für 2025 */
		UPMLST();
	}

	/** PAP Seite 24 */
	void UPVKVLZZ() {

		UPVKV();
		JW = VKV;
		UPANTEIL();
		VKVLZZ = ANTEIL1;
	}

	/** PAP Seite 24 */
	void UPVKV() {

		if(PKV > 0) {
			if(VSP2.compareTo(VSP3) == 1) {
				VKV = VSP2.multiply(ZAHL100);
			} else {
				VKV = VSP3.multiply(ZAHL100);
			}
		} else {
			VKV = BigDecimal.ZERO;
		}
	}

	/** PAP Seite 25 */
	void UPLSTLZZ() {

		JW = LSTJAHR.multiply(ZAHL100);
		UPANTEIL();
		LSTLZZ = ANTEIL1;
	}

	/** Ermittlung der Jahreslohnsteuer aus dem Einkommensteuertarif. PAP Seite 26 */
	void UPMLST() {

		if(ZVE.compareTo (ZAHL1) == -1) {
			ZVE= BigDecimal.ZERO;
			X= BigDecimal.ZERO;
		} else {
			X= (ZVE.divide (BigDecimal.valueOf(KZTAB))).setScale (0, BigDecimal.ROUND_DOWN);
		}
		if(STKL < 5) {
			UPTAB24();
		} else {
			MST5_6();
		}
	}

	/** Vorsorgepauschale (§ 39b Absatz 2 Satz 5 Nummer 3 und Absatz 4 EStG) PAP Seite 27 */
	void UPEVP() {

		if(KRV == 1) {
			VSP1= BigDecimal.ZERO;
		} else {
			if(ZRE4VP.compareTo(BBGRV) == 1) {
				ZRE4VP = BBGRV;
			}
			VSP1 = (ZRE4VP.multiply(RVSATZAN)).setScale(2,BigDecimal.ROUND_DOWN);
		}
		VSP2 = (ZRE4VP.multiply(BigDecimal.valueOf(0.12))).setScale(2,BigDecimal.ROUND_DOWN);
		if(STKL == 3) {
			VHB = BigDecimal.valueOf(3000);
		} else {
			VHB = BigDecimal.valueOf(1900);
		}
		if(VSP2.compareTo (VHB) == 1) {
			VSP2= VHB;
		}
		VSPN= (VSP1.add (VSP2)).setScale (0, BigDecimal.ROUND_UP);
		MVSP();
		if(VSPN.compareTo (VSP) == 1) {
			VSP= VSPN.setScale (2, BigDecimal.ROUND_DOWN);
		}
	}

	/** Vorsorgepauschale (§39b Abs. 2 Satz 5 Nr 3 EStG) Vergleichsberechnung fuer Guenstigerpruefung, PAP Seite 28 */
	void MVSP() {

		if(ZRE4VP.compareTo(BBGKVPV) == 1) {
			ZRE4VP = BBGKVPV;
		}
		if(PKV > 0) {
			if(STKL == 6) {
				VSP3 = BigDecimal.ZERO;
			} else {
				VSP3 = PKPV.multiply(ZAHL12).divide(ZAHL100);
				if(PKV == 2) {
					VSP3 = VSP3.subtract( ZRE4VP.multiply( KVSATZAG.add(PVSATZAG))).setScale(2,BigDecimal.ROUND_DOWN);
				}
			}
		} else {
			VSP3 = ZRE4VP.multiply(KVSATZAN.add(PVSATZAN)).setScale(2, BigDecimal.ROUND_DOWN);
		}
		VSP = VSP3.add(VSP1).setScale(0, BigDecimal.ROUND_UP);
	}

	/** Lohnsteuer fuer die Steuerklassen V und VI (§ 39b Abs. 2 Satz 7 EStG), PAP Seite 29 */
	void MST5_6() {

		ZZX= X;
		if(ZZX.compareTo(W2STKL5) == 1) {
			ZX= W2STKL5;
			UP5_6();
			if(ZZX.compareTo (W3STKL5) == 1) {
				ST= (ST.add ((W3STKL5.subtract (W2STKL5)).multiply (BigDecimal.valueOf (0.42)))).setScale (0, BigDecimal.ROUND_DOWN);
				ST= (ST.add ((ZZX.subtract (W3STKL5)).multiply (BigDecimal.valueOf (0.45)))).setScale (0, BigDecimal.ROUND_DOWN);
			} else {
				ST= (ST.add ((ZZX.subtract (W2STKL5)).multiply (BigDecimal.valueOf (0.42)))).setScale (0, BigDecimal.ROUND_DOWN);
			}
		} else {
			ZX= ZZX;
			UP5_6();
			if(ZZX.compareTo (W1STKL5) == 1) {
				VERGL= ST;
				ZX= W1STKL5;
				UP5_6();
				HOCH= (ST.add ((ZZX.subtract (W1STKL5)).multiply (BigDecimal.valueOf (0.42)))).setScale (0, BigDecimal.ROUND_DOWN);
				if(HOCH.compareTo (VERGL) == -1) {
					ST= HOCH;
				} else {
					ST= VERGL;
				}
			}
		}
	}

	/** Unterprogramm zur Lohnsteuer fuer die Steuerklassen V und VI (§ 39b Abs. 2 Satz 7 EStG), PAP Seite 30 */
	void UP5_6() {

		X= (ZX.multiply (BigDecimal.valueOf (1.25))).setScale (2, BigDecimal.ROUND_DOWN);
		UPTAB24();
		ST1= ST;
		X= (ZX.multiply (BigDecimal.valueOf (0.75))).setScale (2, BigDecimal.ROUND_DOWN);
		UPTAB24();
		ST2= ST;
		DIFF= (ST1.subtract (ST2)).multiply (ZAHL2);
		MIST= (ZX.multiply (BigDecimal.valueOf (0.14))).setScale (0, BigDecimal.ROUND_DOWN);
		if(MIST.compareTo (DIFF) == 1) {
			ST= MIST;
		} else {
			ST= DIFF;
		}
	}

	/** Solidaritaetszuschlag, PAP Seite 31 */
	void MSOLZ() {

		SOLZFREI = (SOLZFREI.multiply(BigDecimal.valueOf(KZTAB)));
		if(JBMG.compareTo (SOLZFREI) == 1) {
			SOLZJ= (JBMG.multiply (BigDecimal.valueOf (5.5))).divide(ZAHL100).setScale(2, BigDecimal.ROUND_DOWN);
			SOLZMIN= (JBMG.subtract (SOLZFREI)).multiply (BigDecimal.valueOf (11.9)).divide (ZAHL100).setScale (2, BigDecimal.ROUND_DOWN);
			if(SOLZMIN.compareTo (SOLZJ) == -1) {
				SOLZJ= SOLZMIN;
			}
			JW= SOLZJ.multiply (ZAHL100).setScale (0, BigDecimal.ROUND_DOWN);
			UPANTEIL();
			SOLZLZZ= ANTEIL1;
		} else {
			SOLZLZZ= BigDecimal.ZERO;
		}
		if(R > 0) {
			JW= JBMG.multiply (ZAHL100);
			UPANTEIL();
			BK= ANTEIL1;
		} else {
			BK= BigDecimal.ZERO;
		}
	}

	/** Anteil von Jahresbetraegen fuer einen LZZ (§ 39b Abs. 2 Satz 9 EStG), PAP Seite 32 */
	void UPANTEIL() {

		if(LZZ == 1) {
			ANTEIL1= JW;
		} else {
			if(LZZ == 2) {
				ANTEIL1= JW.divide (ZAHL12, 0, BigDecimal.ROUND_DOWN);
			} else {
				if(LZZ == 3) {
					ANTEIL1= (JW.multiply (ZAHL7)).divide (ZAHL360, 0, BigDecimal.ROUND_DOWN);
				} else {
					ANTEIL1= JW.divide (ZAHL360, 0, BigDecimal.ROUND_DOWN);
				}
			}
		}
	}

	/** Berechnung sonstiger Bezuege nach § 39b Abs. 3 Saetze 1 bis 8 EStG), PAP Seite 33 */
	void MSONST() {

		LZZ= 1;
		if(ZMVB == 0) {
			ZMVB= 12;
		}
		if(SONSTB.compareTo (BigDecimal.ZERO) == 0 && MBV.compareTo (BigDecimal.ZERO) == 0) {
			VKVSONST= BigDecimal.ZERO;
			LSTSO= BigDecimal.ZERO;
			STS= BigDecimal.ZERO;
			SOLZS= BigDecimal.ZERO;
			BKS= BigDecimal.ZERO;
		} else {
			MOSONST();
			UPVKV();
			VKVSONST = VKV;
			ZRE4J= ((JRE4.add (SONSTB)).divide (ZAHL100)).setScale (2, BigDecimal.ROUND_DOWN);
			ZVBEZJ= ((JVBEZ.add (VBS)).divide (ZAHL100)).setScale (2, BigDecimal.ROUND_DOWN);
			VBEZBSO= STERBE;
			MRE4SONST();
			MLSTJAHR();
			WVFRBM = (ZVE.subtract(GFB)).multiply(ZAHL100).setScale(2,BigDecimal.ROUND_DOWN);
			if(WVFRBM.compareTo(BigDecimal.ZERO) == -1) /** WVFRBM < 0 */{
				WVFRBM = BigDecimal.ZERO;
			}
			UPVKV();
			VKVSONST = VKV.subtract(VKVSONST);
			LSTSO= ST.multiply (ZAHL100);/** lt. PAP:  "Hinweis: negative Zahlen werden nach ihrem Betrag gerundet!" *//** Fallunterscheidung bzgl. negativer Zahlen nicht nötig, da die Java-Klasse BigDecimal.ROUND_DOWN *//** die Ziffer und nicht die Zahl abrundet, also aus -4.5 wird -4 und aus 4.5 wird 4 */
			STS = LSTSO.subtract(LSTOSO).multiply(BigDecimal.valueOf(f)).divide(ZAHL100, 0, BigDecimal.ROUND_DOWN).multiply(ZAHL100);
			STSMIN();
		}
	}

	/** PAP Seite 34 */
	void STSMIN() {

		if(STS.compareTo(BigDecimal.ZERO) == -1) /** STS < 0 */{
			if(MBV.compareTo(BigDecimal.ZERO) == 0) /** MBV = 0 */{/** absichtlich leer */
			} else {
				LSTLZZ = LSTLZZ.add(STS);
				if(LSTLZZ.compareTo(BigDecimal.ZERO) == -1) /** LSTLZZ < 0 */{
					LSTLZZ = BigDecimal.ZERO;
				}
				SOLZLZZ = SOLZLZZ.add(STS.multiply(BigDecimal.valueOf(5.5).divide(ZAHL100))).setScale(0, BigDecimal.ROUND_DOWN);
				if(SOLZLZZ.compareTo(BigDecimal.ZERO) == -1) /** SOLZLZZ < 0 */{
					SOLZLZZ = BigDecimal.ZERO;
				}
				BK = BK.add(STS);
				if(BK.compareTo(BigDecimal.ZERO) == -1) /** BK < 0 */{
					BK = BigDecimal.ZERO;
				}
			}
			STS = BigDecimal.ZERO;
			SOLZS = BigDecimal.ZERO;
		} else {
			MSOLZSTS();
		}
		if(R > 0) {
			BKS = STS;
		} else {
			BKS = BigDecimal.ZERO;
		}
	}

	/** Berechnung des SolZ auf sonstige Bezüge, PAP Seite 35 */
	void MSOLZSTS() {

		if(ZKF.compareTo(BigDecimal.ZERO) == 1) /** ZKF > 0 */{
			SOLZSZVE= ZVE.subtract(KFB);
		} else {
			SOLZSZVE= ZVE;
		}
		if(SOLZSZVE.compareTo(BigDecimal.ONE) == -1) /** SOLZSZVE < 1 */{
			SOLZSZVE= BigDecimal.ZERO;
			X= BigDecimal.ZERO;
		} else {
			X= SOLZSZVE.divide(BigDecimal.valueOf(KZTAB), 0, BigDecimal.ROUND_DOWN);
		}
		if(STKL < 5) /** STKL < 5 */{
			UPTAB24();
		} else {
			MST5_6();
		}
		SOLZSBMG= ST.multiply(BigDecimal.valueOf(f)).setScale(0,BigDecimal.ROUND_DOWN);
		if(SOLZSBMG.compareTo(SOLZFREI) == 1) /** SOLZSBMG > SOLZFREI */{
			SOLZS= STS.multiply(BigDecimal.valueOf(5.5)).divide(ZAHL100, 0, BigDecimal.ROUND_DOWN);
		} else {
			SOLZS= BigDecimal.ZERO;
		}
	}

	/** Sonderberechnung ohne sonstige Bezüge für Berechnung bei sonstigen Bezügen oder Vergütung für mehrjährige Tätigkeit, PAP Seite 36 */
	void MOSONST() {

		ZRE4J= (JRE4.divide (ZAHL100)).setScale (2, BigDecimal.ROUND_DOWN);
		ZVBEZJ= (JVBEZ.divide (ZAHL100)).setScale (2, BigDecimal.ROUND_DOWN);
		JLFREIB= JFREIB.divide (ZAHL100, 2, BigDecimal.ROUND_DOWN);
		JLHINZU= JHINZU.divide (ZAHL100, 2, BigDecimal.ROUND_DOWN);
		MRE4();
		MRE4ABZ();
		ZRE4VP = ZRE4VP.subtract(JRE4ENT.divide(ZAHL100));
		MZTABFB();
		VFRBS1 = ((ANP.add(FVB.add(FVBZ))).multiply(ZAHL100)).setScale(2,BigDecimal.ROUND_DOWN);
		MLSTJAHR();
		WVFRBO = ((ZVE.subtract(GFB)).multiply(ZAHL100)).setScale(2, BigDecimal.ROUND_DOWN);
		if(WVFRBO.compareTo(BigDecimal.ZERO) == -1 ) {
			WVFRBO = BigDecimal.ZERO;
		}
		LSTOSO= ST.multiply (ZAHL100);
	}

	/** Sonderberechnung mit sonstige Bezüge für Berechnung bei sonstigen Bezügen oder Vergütung für mehrjährige Tätigkeit, PAP Seite 37 */
	void MRE4SONST() {

		MRE4();
		FVB= FVBSO;
		MRE4ABZ();/** Änderung für 2022 */
		ZRE4VP = ZRE4VP.add(MBV.divide(ZAHL100)).subtract(JRE4ENT.divide(ZAHL100)).subtract(SONSTENT.divide(ZAHL100));
		FVBZ= FVBZSO;
		MZTABFB();
		VFRBS2 = ((((ANP.add(FVB).add(FVBZ))).multiply(ZAHL100))).subtract(VFRBS1);
	}

	/** Tarifliche Einkommensteuer §32a EStG, PAP Seite 38 */
	void UPTAB24() {

		if(X.compareTo(GFB.add(ZAHL1)) == -1) {
			ST= BigDecimal.ZERO;
		} else {
			if(X.compareTo (BigDecimal.valueOf (17006)) == -1) {
				Y = (X.subtract(GFB)).divide(ZAHL10000, 6,BigDecimal.ROUND_DOWN);
				RW= Y.multiply (BigDecimal.valueOf (954.8));
				RW= RW.add (BigDecimal.valueOf (1400));
				ST= (RW.multiply (Y)).setScale (0, BigDecimal.ROUND_DOWN);
			} else {
				if(X.compareTo (BigDecimal.valueOf (66761)) == -1) {
					Y= (X.subtract (BigDecimal.valueOf (17005))).divide (ZAHL10000, 6, BigDecimal.ROUND_DOWN);
					RW= Y.multiply (BigDecimal.valueOf (181.19));
					RW= RW.add (BigDecimal.valueOf (2397));
					RW= RW.multiply (Y);
					ST= (RW.add (BigDecimal.valueOf (991.21))).setScale (0, BigDecimal.ROUND_DOWN);
				} else {
					if(X.compareTo (BigDecimal.valueOf (277826)) == -1) {
						ST= ((X.multiply (BigDecimal.valueOf (0.42))).subtract (BigDecimal.valueOf (10636.31))).setScale (0, BigDecimal.ROUND_DOWN);
					} else {
						ST= ((X.multiply (BigDecimal.valueOf (0.45))).subtract (BigDecimal.valueOf (18971.06))).setScale (0, BigDecimal.ROUND_DOWN);
					}
				}
			}
		}
		ST= ST.multiply (BigDecimal.valueOf (KZTAB));
	}

  @override
  BigDecimal getBkv() {
    // TODO: implement getBkv
    throw UnimplementedError();
  }

  @override
  BigDecimal getSolzv() {
    // TODO: implement getSolzv
    throw UnimplementedError();
  }

  @override
  BigDecimal getStv() {
    // TODO: implement getStv
    throw UnimplementedError();
  }

  @override
  void setEntsch(BigDecimal arg0) {
    // TODO: implement setEntsch
  }

  @override
  void setVkapa(BigDecimal arg0) {
    // TODO: implement setVkapa
  }

  @override
  void setVmt(BigDecimal arg0) {
    // TODO: implement setVmt
  }

}