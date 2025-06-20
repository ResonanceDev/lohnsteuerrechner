import 'package:lohnsteuerrechenr/src/BigDecimal.dart';
import 'package:lohnsteuerrechenr/src/LohnsteuerInterface.dart';

/// 
/// @author Marcel Lehmann (https://github.com/MarcelLehmann/Lohnsteuer) 
/// @date Fri Mar 15 08:35:04 CET 2024
/// 

 class Lohnsteuer2007 implements LohnsteuerInterface {

	/** Stand: 2015-11-10 */
	/// ZIVIT Düsseldorf

	/* EINGABEPARAMETER*/

	 int AJAHR = 0;
	 int ALTER1 = 0;
	 BigDecimal HINZUR = BigDecimal(0);
	 BigDecimal JFREIB = BigDecimal(0);
	 BigDecimal JHINZU = BigDecimal(0);
	 BigDecimal JRE4 = BigDecimal(0);
	 BigDecimal JVBEZ = BigDecimal(0);
	 int KRV = 0;
	 int LZZ = 0;
	 int R = 0;
	 BigDecimal RE4 = BigDecimal(0);
	 BigDecimal SONSTB = BigDecimal(0);
	 BigDecimal STERBE = BigDecimal(0);
	 int STKL = 0;
	 BigDecimal VBEZ = BigDecimal(0);
	 BigDecimal VBEZM = BigDecimal(0);
	 BigDecimal VBEZS = BigDecimal(0);
	 BigDecimal VBS = BigDecimal(0);
	 int VJAHR = 0;
	 BigDecimal VKAPA = BigDecimal(0);
	 BigDecimal VMT = BigDecimal(0);
	 BigDecimal WFUNDF = BigDecimal(0);
	 BigDecimal ZKF = BigDecimal(0);
	 int ZMVB = 0;

	/* AUSGABEPARAMETER*/

	 BigDecimal BK = BigDecimal(0);
	 BigDecimal BKS = BigDecimal(0);
	 BigDecimal BKV = BigDecimal(0);
	 BigDecimal LSTLZZ = BigDecimal(0);
	 BigDecimal SOLZLZZ = BigDecimal(0);
	 BigDecimal SOLZS = BigDecimal(0);
	 BigDecimal SOLZV = BigDecimal(0);
	 BigDecimal STS = BigDecimal(0);
	 BigDecimal STV = BigDecimal(0);

	/* INTERNE FELDER*/

	/// Altersentlastungsbetrag nach Alterseinkuenftegesetz in Cents
	 BigDecimal ALTE = BigDecimal(0);

	/// Arbeitnehmer-Pauschbetrag in EURO
	 BigDecimal ANP = BigDecimal(0);

	/** Auf den Lohnzahlungszeitraum entfallender Anteil von Jahreswerten<br>
             auf ganze Cents abgerundet */
	 BigDecimal ANTEIL1 = BigDecimal(0);

	/** Auf den Lohnzahlungszeitraum entfallender Anteil von Jahreswerten<br>
             auf ganze Cents aufgerundet */
	 BigDecimal ANTEIL2 = BigDecimal(0);

	/// Bemessungsgrundlage fuer Altersentlastungsbetrag in Cents
	 BigDecimal BMG = BigDecimal(0);

	/// Differenz zwischen ST1 und ST2 in EURO
	 BigDecimal DIFF = BigDecimal(0);

	/// Entlastungsbetrag fuer Alleinerziehende in EURO
	 BigDecimal EFA = BigDecimal(0);

	/// Versorgungsfreibetrag in Cents
	 BigDecimal FVB = BigDecimal(0);

	/// Zuschlag zum Versorgungsfreibetrag in EURO
	 BigDecimal FVBZ = BigDecimal(0);

	/// Massgeblich maximaler Versorgungsfreibetrag in Cents
	 BigDecimal HFVB = BigDecimal(0);

	/// Nummer der Tabellenwerte fuer Versorgungsparameter
	 int J = 0;

	/** Jahressteuer nach § 51a EStG, aus der Solidaritaetszuschlag und<br>
             Bemessungsgrundlage fuer die Kirchenlohnsteuer ermittelt werden in EURO */
	 BigDecimal JBMG = BigDecimal(0);

	/** Jahreswert, dessen Anteil fuer einen Lohnzahlungszeitraum in<br>
             UPANTEIL errechnet werden soll in Cents */
	 BigDecimal JW = BigDecimal(0);

	/// Nummer der Tabellenwerte fuer Parameter bei Altersentlastungsbetrag
	 int K = 0;

	/** Kennzeichen bei Verguetung fuer mehrjaehrige Taetigkeit<br>
             0 = beim Vorwegabzug ist ZRE4VP zu beruecksichtigen<br>
             1 = beim Vorwegabzug ist ZRE4VP1 zu beruecksichtigen */
	 int KENNZ = 0;

	/// Summe der Freibetraege fuer Kinder in EURO
	 BigDecimal KFB = BigDecimal(0);

	/** Kennzahl fuer die Einkommensteuer-Tabellenart:<br>
             1 = Grundtabelle<br>
             2 = Splittingtabelle */
	 int KZTAB = 0;

	/// Jahreslohnsteuer in EURO
	 BigDecimal LSTJAHR = BigDecimal(0);

	/// Zwischenfelder der Jahreslohnsteuer in Cents
	 BigDecimal LST1 = BigDecimal(0);
	 BigDecimal LST2 = BigDecimal(0);
	 BigDecimal LST3 = BigDecimal(0);

	/// Mindeststeuer fuer die Steuerklassen V und VI in EURO
	 BigDecimal MIST = BigDecimal(0);

	/** Arbeitslohn des Lohnzahlungszeitraums nach Abzug der Freibetraege<br>
             fuer Versorgungsbezuege, des Altersentlastungsbetrags und des<br>
             in der Lohnsteuerkarte eingetragenen Freibetrags und Hinzurechnung<br>
             eines Hinzurechnungsbetrags in Cents. Entspricht dem Arbeitslohn,<br>
             fuer den die Lohnsteuer im personellen Verfahren aus der<br>
             zum Lohnzahlungszeitraum gehoerenden Tabelle abgelesen wuerde */
	 BigDecimal RE4LZZ = BigDecimal(0);

	/** Arbeitslohn des Lohnzahlungszeitraums nach Abzug der Freibetraege<br>
             fuer Versorgungsbezuege und des Altersentlastungsbetrags in<br>
             Cents zur Berechnung der Vorsorgepauschale */
	 BigDecimal RE4LZZV = BigDecimal(0);

	/// Rechenwert in Gleitkommadarstellung
	 BigDecimal RW = BigDecimal(0);

	/// Sonderausgaben-Pauschbetrag in EURO
	 BigDecimal SAP = BigDecimal(0);

	/// Freigrenze fuer den Solidaritaetszuschlag in EURO
	 BigDecimal SOLZFREI = BigDecimal(0);

	/// Solidaritaetszuschlag auf die Jahreslohnsteuer in EURO, C (2 Dezimalstellen)
	 BigDecimal SOLZJ = BigDecimal(0);

	/** Zwischenwert fuer den Solidaritaetszuschlag auf die Jahreslohnsteuer<br>
             in EURO, C (2 Dezimalstellen) */
	 BigDecimal SOLZMIN = BigDecimal(0);

	/// Tarifliche Einkommensteuer in EURO
	 BigDecimal ST = BigDecimal(0);

	/// Tarifliche Einkommensteuer auf das 1,25-fache ZX in EURO
	 BigDecimal ST1 = BigDecimal(0);

	/// Tarifliche Einkommensteuer auf das 0,75-fache ZX in EURO
	 BigDecimal ST2 = BigDecimal(0);

	/// Bemessungsgrundlage fuer den Versorgungsfreibetrag in Cents
	 BigDecimal VBEZB = BigDecimal(0);

	/// Hoechstbetrag der Vorsorgepauschale nach Alterseinkuenftegesetz in EURO, C
	 BigDecimal VHB = BigDecimal(0);

	/// Vorsorgepauschale in EURO, C (2 Dezimalstellen)
	 BigDecimal VSP = BigDecimal(0);

	/// Vorsorgepauschale nach Alterseinkuenftegesetz in EURO, C
	 BigDecimal VSPN = BigDecimal(0);

	/** Zwischenwert 1 bei der Berechnung der Vorsorgepauschale nach<br>
             dem Alterseinkuenftegesetz in EURO, C (2 Dezimalstellen) */
	 BigDecimal VSP1 = BigDecimal(0);

	/** Zwischenwert 2 bei der Berechnung der Vorsorgepauschale nach<br>
             dem Alterseinkuenftegesetz in EURO, C (2 Dezimalstellen) */
	 BigDecimal VSP2 = BigDecimal(0);

	/// Hoechstbetrag der Vorsorgepauschale nach § 10c Abs. 3 EStG in EURO
	 BigDecimal VSPKURZ = BigDecimal(0);

	/// Hoechstbetrag der Vorsorgepauschale nach § 10c Abs. 2 Nr. 2 EStG in EURO
	 BigDecimal VSPMAX1 = BigDecimal(0);

	/// Hoechstbetrag der Vorsorgepauschale nach § 10c Abs. 2 Nr. 3 EStG in EURO
	 BigDecimal VSPMAX2 = BigDecimal(0);

	/** Vorsorgepauschale nach § 10c Abs. 2 Satz 2 EStG vor der Hoechstbetragsberechnung<br>
             in EURO, C (2 Dezimalstellen) */
	 BigDecimal VSPO = BigDecimal(0);

	/** Fuer den Abzug nach § 10c Abs. 2 Nrn. 2 und 3 EStG verbleibender<br>
             Rest von VSPO in EURO, C (2 Dezimalstellen) */
	 BigDecimal VSPREST = BigDecimal(0);

	/** Hoechstbetrag der Vorsorgepauschale nach § 10c Abs. 2 Nr. 1 EStG<br>
             in EURO, C (2 Dezimalstellen) */
	 BigDecimal VSPVOR = BigDecimal(0);

	/** Zu versteuerndes Einkommen gem. § 32a Abs. 1 und 2 EStG<br>
             (2 Dezimalstellen) */
	 BigDecimal X = BigDecimal(0);

	/// gem. § 32a Abs. 1 EStG (6 Dezimalstellen)
	 BigDecimal Y = BigDecimal(0);

	/// Auf einen Jahreslohn hochgerechnetes RE4LZZ in EURO, C (2 Dezimalstellen)
	 BigDecimal ZRE4 = BigDecimal(0);

	/** Auf einen Jahreslohn hochgerechnetes RE4LZZV zur Berechnung<br>
             der Vorsorgepauschale in EURO, C (2 Dezimalstellen) */
	 BigDecimal ZRE4VP = BigDecimal(0);

	/** Sicherungsfeld von ZRE4VP in EURO,C bei der Berechnung des Vorwegabzugs<br>
             fuer die Verguetung fuer mehrjaehrige Taetigkeit */
	 BigDecimal ZRE4VP1 = BigDecimal(0);

	/// Feste Tabellenfreibetraege (ohne Vorsorgepauschale) in EURO
	 BigDecimal ZTABFB = BigDecimal(0);

	/** Auf einen Jahreslohn hochgerechnetes (VBEZ abzueglich FVB) in<br>
             EURO, C (2 Dezimalstellen) */
	 BigDecimal ZVBEZ = BigDecimal(0);

	/// Zu versteuerndes Einkommen in EURO
	 BigDecimal ZVE = BigDecimal(0);

	/** Zwischenfelder zu X fuer die Berechnung der Steuer nach § 39b<br>
             Abs. 2 Satz 8 EStG in EURO. */
	 BigDecimal ZX = BigDecimal(0);
	 BigDecimal ZZX = BigDecimal(0);
	 BigDecimal HOCH = BigDecimal(0);
	 BigDecimal VERGL = BigDecimal(0);

	/* KONSTANTEN */

	/// Tabelle fuer die Vomhundertsaetze des Versorgungsfreibetrags
	 static final List<BigDecimal> TAB1 = [BigDecimal.valueOf (0.0), BigDecimal.valueOf (0.4), BigDecimal.valueOf (0.384), BigDecimal.valueOf (0.368), BigDecimal.valueOf (0.352), BigDecimal.valueOf (0.336), BigDecimal.valueOf (0.32), BigDecimal.valueOf (0.304), BigDecimal.valueOf (0.288), BigDecimal.valueOf (0.272), BigDecimal.valueOf (0.256), BigDecimal.valueOf (0.24), BigDecimal.valueOf (0.224), BigDecimal.valueOf (0.208), BigDecimal.valueOf (0.192), BigDecimal.valueOf (0.176), BigDecimal.valueOf (0.16), BigDecimal.valueOf (0.152), BigDecimal.valueOf (0.144), BigDecimal.valueOf (0.136), BigDecimal.valueOf (0.128), BigDecimal.valueOf (0.12), BigDecimal.valueOf (0.112), BigDecimal.valueOf (0.104), BigDecimal.valueOf (0.096), BigDecimal.valueOf (0.088), BigDecimal.valueOf (0.08), BigDecimal.valueOf (0.072), BigDecimal.valueOf (0.064), BigDecimal.valueOf (0.056), BigDecimal.valueOf (0.048), BigDecimal.valueOf (0.04), BigDecimal.valueOf (0.032), BigDecimal.valueOf (0.024), BigDecimal.valueOf (0.016), BigDecimal.valueOf (0.008), BigDecimal.valueOf (0.0)];

	/// Tabelle fuer die Hoechstbetrage des Versorgungsfreibetrags
	 static final List<BigDecimal> TAB2 = [BigDecimal.valueOf (0), BigDecimal.valueOf (3000), BigDecimal.valueOf (2880), BigDecimal.valueOf (2760), BigDecimal.valueOf (2640), BigDecimal.valueOf (2520), BigDecimal.valueOf (2400), BigDecimal.valueOf (2280), BigDecimal.valueOf (2160), BigDecimal.valueOf (2040), BigDecimal.valueOf (1920), BigDecimal.valueOf (1800), BigDecimal.valueOf (1680), BigDecimal.valueOf (1560), BigDecimal.valueOf (1440), BigDecimal.valueOf (1320), BigDecimal.valueOf (1200), BigDecimal.valueOf (1140), BigDecimal.valueOf (1080), BigDecimal.valueOf (1020), BigDecimal.valueOf (960), BigDecimal.valueOf (900), BigDecimal.valueOf (840), BigDecimal.valueOf (780), BigDecimal.valueOf (720), BigDecimal.valueOf (660), BigDecimal.valueOf (600), BigDecimal.valueOf (540), BigDecimal.valueOf (480), BigDecimal.valueOf (420), BigDecimal.valueOf (360), BigDecimal.valueOf (300), BigDecimal.valueOf (240), BigDecimal.valueOf (180), BigDecimal.valueOf (120), BigDecimal.valueOf (60), BigDecimal.valueOf (0)];

	/// Tabelle fuer die Zuschlaege zum Versorgungsfreibetrag
	 static final List<BigDecimal> TAB3 = [BigDecimal.valueOf (0), BigDecimal.valueOf (900), BigDecimal.valueOf (864), BigDecimal.valueOf (828), BigDecimal.valueOf (792), BigDecimal.valueOf (756), BigDecimal.valueOf (720), BigDecimal.valueOf (684), BigDecimal.valueOf (648), BigDecimal.valueOf (612), BigDecimal.valueOf (576), BigDecimal.valueOf (540), BigDecimal.valueOf (504), BigDecimal.valueOf (468), BigDecimal.valueOf (432), BigDecimal.valueOf (396), BigDecimal.valueOf (360), BigDecimal.valueOf (342), BigDecimal.valueOf (324), BigDecimal.valueOf (306), BigDecimal.valueOf (288), BigDecimal.valueOf (270), BigDecimal.valueOf (252), BigDecimal.valueOf (234), BigDecimal.valueOf (216), BigDecimal.valueOf (198), BigDecimal.valueOf (180), BigDecimal.valueOf (162), BigDecimal.valueOf (144), BigDecimal.valueOf (126), BigDecimal.valueOf (108), BigDecimal.valueOf (90), BigDecimal.valueOf (72), BigDecimal.valueOf (54), BigDecimal.valueOf (36), BigDecimal.valueOf (18), BigDecimal.valueOf (0)];

	/// Tabelle fuer die Vomhundertsaetze des Altersentlastungsbetrags
	 static final List<BigDecimal> TAB4 = [BigDecimal.valueOf (0.0), BigDecimal.valueOf (0.4), BigDecimal.valueOf (0.384), BigDecimal.valueOf (0.368), BigDecimal.valueOf (0.352), BigDecimal.valueOf (0.336), BigDecimal.valueOf (0.32), BigDecimal.valueOf (0.304), BigDecimal.valueOf (0.288), BigDecimal.valueOf (0.272), BigDecimal.valueOf (0.256), BigDecimal.valueOf (0.24), BigDecimal.valueOf (0.224), BigDecimal.valueOf (0.208), BigDecimal.valueOf (0.192), BigDecimal.valueOf (0.176), BigDecimal.valueOf (0.16), BigDecimal.valueOf (0.152), BigDecimal.valueOf (0.144), BigDecimal.valueOf (0.136), BigDecimal.valueOf (0.128), BigDecimal.valueOf (0.12), BigDecimal.valueOf (0.112), BigDecimal.valueOf (0.104), BigDecimal.valueOf (0.096), BigDecimal.valueOf (0.088), BigDecimal.valueOf (0.08), BigDecimal.valueOf (0.072), BigDecimal.valueOf (0.064), BigDecimal.valueOf (0.056), BigDecimal.valueOf (0.048), BigDecimal.valueOf (0.04), BigDecimal.valueOf (0.032), BigDecimal.valueOf (0.024), BigDecimal.valueOf (0.016), BigDecimal.valueOf (0.008), BigDecimal.valueOf (0.0)];

	/// Tabelle fuer die Hoechstbetraege des Altersentlastungsbetrags
	 static final List<BigDecimal> TAB5 = [BigDecimal.valueOf (0), BigDecimal.valueOf (1900), BigDecimal.valueOf (1824), BigDecimal.valueOf (1748), BigDecimal.valueOf (1672), BigDecimal.valueOf (1596), BigDecimal.valueOf (1520), BigDecimal.valueOf (1444), BigDecimal.valueOf (1368), BigDecimal.valueOf (1292), BigDecimal.valueOf (1216), BigDecimal.valueOf (1140), BigDecimal.valueOf (1064), BigDecimal.valueOf (988), BigDecimal.valueOf (912), BigDecimal.valueOf (836), BigDecimal.valueOf (760), BigDecimal.valueOf (722), BigDecimal.valueOf (684), BigDecimal.valueOf (646), BigDecimal.valueOf (608), BigDecimal.valueOf (570), BigDecimal.valueOf (532), BigDecimal.valueOf (494), BigDecimal.valueOf (456), BigDecimal.valueOf (418), BigDecimal.valueOf (380), BigDecimal.valueOf (342), BigDecimal.valueOf (304), BigDecimal.valueOf (266), BigDecimal.valueOf (228), BigDecimal.valueOf (190), BigDecimal.valueOf (152), BigDecimal.valueOf (114), BigDecimal.valueOf (76), BigDecimal.valueOf (38), BigDecimal.valueOf (0)];

	/// Zahlenkonstanten fuer im Plan oft genutzte BigDecimal Werte
	 static final BigDecimal ZAHL1 = BigDecimal.ONE;
	 static final BigDecimal ZAHL2 = BigDecimal(2);
	 static final BigDecimal ZAHL3 = BigDecimal(3);
	 static final BigDecimal ZAHL4 = BigDecimal(4);
	 static final BigDecimal ZAHL5 = BigDecimal(5);
	 static final BigDecimal ZAHL6 = BigDecimal(6);
	 static final BigDecimal ZAHL7 = BigDecimal(7);
	 static final BigDecimal ZAHL8 = BigDecimal(8);
	 static final BigDecimal ZAHL9 = BigDecimal(9);
	 static final BigDecimal ZAHL10 = BigDecimal.TEN;
	 static final BigDecimal ZAHL11 = BigDecimal(11);
	 static final BigDecimal ZAHL12 = BigDecimal(12);
	 static final BigDecimal ZAHL100 = BigDecimal(100);
	 static final BigDecimal ZAHL360 = BigDecimal(360);

	/* SETTER */

	@override
	 void setRe4(BigDecimal arg0) { RE4 = arg0; }

	@override
	 void setJvbez(BigDecimal arg0) { JVBEZ = arg0; }

	 void setWfundf(BigDecimal arg0) { WFUNDF = arg0; }

	@override
	 void setSterbe(BigDecimal arg0) { STERBE = arg0; }

	@override
	 void setStkl(int arg0) { STKL = arg0; }

	@override
	 void setVbezm(BigDecimal arg0) { VBEZM = arg0; }

	@override
	 void setVbs(BigDecimal arg0) { VBS = arg0; }

	@override
	 void setAjahr(int arg0) { AJAHR = arg0; }

	@override
	 void setAlter1(int arg0) { ALTER1 = arg0; }

	@override
	 void setVbez(BigDecimal arg0) { VBEZ = arg0; }

	@override
	 void setLzz(int arg0) { LZZ = arg0; }

	@override
	 void setKrv(int arg0) { KRV = arg0; }

	@override
	 void setJhinzu(BigDecimal arg0) { JHINZU = arg0; }

	@override
	 void setJfreib(BigDecimal arg0) { JFREIB = arg0; }

	 void setHinzur(BigDecimal arg0) { HINZUR = arg0; }

	@override
	 void setR(int arg0) { R = arg0; }

	@override
	 void setVkapa(BigDecimal arg0) { VKAPA = arg0; }

	@override
	 void setJre4(BigDecimal arg0) { JRE4 = arg0; }

	@override
	 void setZkf(BigDecimal arg0) { ZKF = arg0; }

	@override
	 void setZmvb(int arg0) { ZMVB = arg0; }

	@override
	 void setVjahr(int arg0) { VJAHR = arg0; }

	@override
	 void setVbezs(BigDecimal arg0) { VBEZS = arg0; }

	@override
	 void setVmt(BigDecimal arg0) { VMT = arg0; }

	@override
	 void setSonstb(BigDecimal arg0) { SONSTB = arg0; }

	@override
	 void setPkpv(BigDecimal arg0) { /* required for newer calculator */ }

	@override
	 void setAf(int arg0) { /* required for newer calculator */ }

	@override
	 void setF(double arg0) { /* required for newer calculator */ }

	@override
	 void setJre4ent(BigDecimal arg0) { /* required for newer calculator */ }

	@override
	 void setPvs(int arg0) { /* required for newer calculator */ }

	@override
	 void setKvz(BigDecimal arg0) { /* required for newer calculator */ }

	@override
	 void setPvz(int arg0) { /* required for newer calculator */ }

	@override
	 void setLzzhinzu(BigDecimal arg0) { /* required for newer calculator */ }

	@override
	 void setMbv(BigDecimal arg0) { /* required for newer calculator */ }

	@override
	 void setSonstent(BigDecimal arg0) { /* required for newer calculator */ }

	@override
	 void setEntsch(BigDecimal arg0) { /* required for newer calculator */ }

	@override
	 void setLzzfreib(BigDecimal arg0) { /* required for newer calculator */ }

	@override
	 void setPkv(int arg0) { /* required for newer calculator */ }

	@override
	 void setPva(BigDecimal arg0) { /* required for newer calculator */ }

	/* GETTER */

	@override
	 BigDecimal getSts() { return STS; }

	@override
	 BigDecimal getLstlzz() { return LSTLZZ; }

	@override
	 BigDecimal getStv() { return STV; }

	@override
	 BigDecimal getSolzlzz() { return SOLZLZZ; }

	@override
	 BigDecimal getBk() { return BK; }

	@override
	 BigDecimal getSolzv() { return SOLZV; }

	@override
	 BigDecimal getBks() { return BKS; }

	@override
	 BigDecimal getBkv() { return BKV; }

	@override
	 BigDecimal getSolzs() { return SOLZS; }

	@override
	 BigDecimal getVfrb() { /* required for newer calculator */ return BigDecimal(0);}

	@override
	 BigDecimal getVfrbs2() { /* required for newer calculator */ return BigDecimal(0);}

	@override
	 BigDecimal getVfrbs1() { /* required for newer calculator */ return BigDecimal(0);}

	@override
	 BigDecimal getVkvlzz() { /* required for newer calculator */ return BigDecimal(0);}

	@override
	 BigDecimal getWvfrbm() { /* required for newer calculator */ return BigDecimal(0);}

	@override
	 BigDecimal getVkvsonst() { /* required for newer calculator */ return BigDecimal(0);}

	@override
	 BigDecimal getWvfrb() { /* required for newer calculator */ return BigDecimal(0);}

	@override
	 BigDecimal getWvfrbo() { /* required for newer calculator */ return BigDecimal(0);}

	/// PROGRAMMABLAUFPLAN 2007, PAP Seite 9
	@override
	 void main() {

		MRE4LZZ();
		KENNZ= 0;
		RE4LZZ= RE4.subtract (FVB).subtract (ALTE).subtract (WFUNDF).add (HINZUR);
		RE4LZZV= RE4.subtract (FVB).subtract (ALTE);
		MRE4();
		MZTABFB();
		MLSTJAHR();
		LSTJAHR= ST;
		JW= LSTJAHR.multiply (ZAHL100);
		UPANTEIL();
		LSTLZZ= ANTEIL1;
		if(ZKF.compareTo (BigDecimal.ZERO) == 1) {
			ZTABFB= ZTABFB.add (KFB);
			MLSTJAHR();
			JBMG= ST;
		} else {
			JBMG= LSTJAHR;
		}
		MSOLZ();
		MSONST();
		MVMT();
	}

	/// Freibetraege fuer Versorgungsbezuege, Altersentlastungsbetrag (§39b Abs. 2 Satz 2 EStG), PAP Seite 10
	 void MRE4LZZ() {

		if(VBEZ.compareTo (BigDecimal.ZERO) == 0) {
			FVBZ= BigDecimal.ZERO;
			FVB= BigDecimal.ZERO;
		} else {
			if(VJAHR < 2006) {
				J= 1;
			} else {
				if(VJAHR < 2040) {
					J= VJAHR - 2004;
				} else {
					J= 36;
				}
			}
			if(LZZ == 1) {
				if(((STERBE.add (VKAPA)).compareTo (BigDecimal.ZERO)) == 1) {
					VBEZB= (VBEZM.multiply (BigDecimal.valueOf (ZMVB))).add (VBEZS);
					HFVB= TAB2[J].multiply (ZAHL100);
					FVBZ= TAB3[J];
				} else {
					VBEZB= (VBEZM.multiply (BigDecimal.valueOf (ZMVB))).add (VBEZS);/** Achtung! Rechengenauigkeit Division? */
					HFVB= TAB2[J].divide (ZAHL12).multiply (BigDecimal.valueOf (ZMVB)).multiply (ZAHL100);
					FVBZ= TAB3[J].divide (ZAHL12).multiply (BigDecimal.valueOf (ZMVB)).setScale (0, BigDecimal.ROUND_UP);
				}
			} else {
				VBEZB= ((VBEZM.multiply (ZAHL12)).add (VBEZS)).setScale (2, BigDecimal.ROUND_DOWN);
				HFVB= TAB2[J].multiply (ZAHL100);
				FVBZ= TAB3[J];
			}
			FVB= (VBEZB.multiply (TAB1[J])).setScale (2, BigDecimal.ROUND_UP);
			if(FVB.compareTo (HFVB) == 1) {
				FVB = HFVB;
			}
			JW= FVB;
			UPANTEIL();
			FVB= ANTEIL2;
		}
		if(ALTER1 == 0) {
			ALTE= BigDecimal.ZERO;
		} else {
			if(AJAHR < 2006) {
				K= 1;
			} else {
				if(AJAHR < 2040) {
					K= AJAHR - 2004;
				} else {
					K= 36;
				}
			}
			BMG= RE4.subtract (VBEZ);
			ALTE= (BMG.multiply (TAB4[K])).setScale (2, BigDecimal.ROUND_UP);
			JW= TAB5[K].multiply (ZAHL100);
			UPANTEIL();
			if(ALTE.compareTo (ANTEIL2) == 1) {
				ALTE= ANTEIL2;
			}
		}
	}

	/// Massgeblicher Arbeitslohn fuer die Jahreslohnsteuer, PAP Seite 12
	 void MRE4() {

		if(LZZ == 1) {
			ZRE4= RE4LZZ.divide (ZAHL100, 2, BigDecimal.ROUND_DOWN);
			ZRE4VP= RE4LZZV.divide (ZAHL100, 2, BigDecimal.ROUND_DOWN);
			ZVBEZ= (VBEZ.subtract (FVB)).divide (ZAHL100, 2, BigDecimal.ROUND_DOWN);
		} else {
			if(LZZ == 2) {
				ZRE4= ((RE4LZZ.add (BigDecimal.valueOf (0.67))).multiply (BigDecimal.valueOf (0.12))).setScale (2, BigDecimal.ROUND_DOWN);
				ZRE4VP= ((RE4LZZV.add (BigDecimal.valueOf (0.67))).multiply (BigDecimal.valueOf (0.12))).setScale(2, BigDecimal.ROUND_DOWN);
				ZVBEZ= ((VBEZ.subtract (FVB).add (BigDecimal.valueOf (0.67))).multiply (BigDecimal.valueOf (0.12))).setScale (2, BigDecimal.ROUND_DOWN);
			} else {
				if(LZZ == 3) {
					ZRE4= ((RE4LZZ.add (BigDecimal.valueOf (0.89))).multiply (BigDecimal.valueOf (3.6))).divide (BigDecimal.valueOf (7.0), 2, BigDecimal.ROUND_DOWN);
					ZRE4VP= ((RE4LZZV.add (BigDecimal.valueOf (0.89))).multiply (BigDecimal.valueOf (3.6))).divide (BigDecimal.valueOf (7.0), 2, BigDecimal.ROUND_DOWN);
					ZVBEZ= ((VBEZ.subtract (FVB).add (BigDecimal.valueOf (0.89))).multiply (BigDecimal.valueOf (3.6))).divide (BigDecimal.valueOf (7.0), 2, BigDecimal.ROUND_DOWN);
				} else {
					ZRE4= ((RE4LZZ.add (BigDecimal.valueOf (0.56))).multiply (BigDecimal.valueOf (3.6))).setScale (2, BigDecimal.ROUND_DOWN);
					ZRE4VP= ((RE4LZZV.add (BigDecimal.valueOf (0.56))).multiply (BigDecimal.valueOf (3.6))).setScale (2, BigDecimal.ROUND_DOWN);
					ZVBEZ= ((VBEZ.subtract (FVB).add (BigDecimal.valueOf (0.56))).multiply (BigDecimal.valueOf (3.6))).setScale (2, BigDecimal.ROUND_DOWN);
				}
			}
		}
		if(RE4LZZ.compareTo (BigDecimal.ZERO) == -1) {
			ZRE4= BigDecimal.ZERO;
		}
		if(RE4LZZV.compareTo (BigDecimal.ZERO) == -1) {
			ZRE4VP= BigDecimal.ZERO;
		}
		if(VBEZ.compareTo (BigDecimal.ZERO) == 0) {
			if(FVB.compareTo (BigDecimal.ZERO) == 0) {
				ZVBEZ= BigDecimal.ZERO;
			}
		} else {
			if((VBEZ.subtract (FVB)).compareTo (BigDecimal.ZERO) == -1) {
				ZVBEZ= BigDecimal.ZERO;
			}
		}
	}

	/// Ermittlung der festen Tabellenfreibetraege (ohne Vorsorgepauschale), PAP Seite 13
	 void MZTABFB() {

		ANP= BigDecimal.ZERO;
		if(ZVBEZ.compareTo (BigDecimal.ZERO) >= 0) {
			if(ZVBEZ.compareTo (FVBZ) == -1) {
				FVBZ= ZVBEZ.setScale (0, BigDecimal.ROUND_DOWN);
			}
		}
		if(STKL < 6) {
			if(ZVBEZ.compareTo (BigDecimal.ZERO) == 1) {
				if((ZVBEZ.subtract (FVBZ)).compareTo (BigDecimal.valueOf (102)) == -1) {
					ANP= (ZVBEZ.subtract (FVBZ)).setScale (0, BigDecimal.ROUND_DOWN);
				} else {
					ANP= BigDecimal.valueOf (102);
				}
			}
		}
		if(STKL < 6) {
			if(ZRE4.compareTo (ZVBEZ) == 1) {
				if((ZRE4.subtract (ZVBEZ)).compareTo (BigDecimal.valueOf (920)) == -1) {
					ANP= (ANP.add (ZRE4).subtract (ZVBEZ)).setScale (0, BigDecimal.ROUND_DOWN);
				} else {
					ANP= ANP.add (BigDecimal.valueOf (920));
				}
			}
		}
		KZTAB= 1;
		if(STKL == 1) {
			SAP= BigDecimal.valueOf (36);
			KFB= (ZKF.multiply (BigDecimal.valueOf (5808))).setScale (0, BigDecimal.ROUND_DOWN);
		} else {
			if(STKL == 2) {
				EFA= BigDecimal.valueOf (1308);
				SAP= BigDecimal.valueOf (36);
				KFB= (ZKF.multiply (BigDecimal.valueOf (5808))).setScale (0, BigDecimal.ROUND_DOWN);
			} else {
				if(STKL == 3) {
					KZTAB= 2;
					SAP= BigDecimal.valueOf (72);
					KFB= (ZKF.multiply (BigDecimal.valueOf (5808))).setScale (0, BigDecimal.ROUND_DOWN);
				} else {
					if(STKL == 4) {
						SAP= BigDecimal.valueOf (36);
						KFB= (ZKF.multiply (BigDecimal.valueOf (2904))).setScale (0, BigDecimal.ROUND_DOWN);
					} else {
						KFB= BigDecimal.ZERO;
					}
				}
			}
		}
		ZTABFB= EFA.add (ANP).add (SAP).add (FVBZ);
	}

	/// Ermittlung Jahreslohnsteuer, PAP Seite 14
	 void MLSTJAHR() {

		if(STKL < 5) {
			UPEVP();
		} else {
			VSP= BigDecimal.ZERO;
		}
		ZVE= (ZRE4.subtract (ZTABFB).subtract (VSP)).setScale (0, BigDecimal.ROUND_DOWN);
		if(ZVE.compareTo (ZAHL1) == -1) {
			ZVE= BigDecimal.ZERO;
			X= BigDecimal.ZERO;
		} else {
			X= ZVE.divide (BigDecimal.valueOf (KZTAB), 0, BigDecimal.ROUND_DOWN);
		}
		if(STKL < 5) {
			UPTAB07();
		} else {
			MST5_6();
		}
	}

	/// Vorsorgepauschale (§39b Abs. 2 Satz 6 Nr 3 EStG), PAP Seite 15
	 void UPEVP() {
/** Achtung: Es wird davon ausgegangen, dass<br>
    a) die Rentenversicherungsbemessungsgrenze gegenueber 2006 unveraendert bleibt und<br>
    b) der Beitragssatz zur Rentenversicherung auf 9,95 v.H. angehoben wird */
		if(KRV == 1) {
			VSP1= BigDecimal.ZERO;
		} else {
			if(ZRE4VP.compareTo (BigDecimal.valueOf (63000)) == 1) {
				ZRE4VP= BigDecimal.valueOf (63000);
			}
			VSP1= (ZRE4VP.multiply (BigDecimal.valueOf (0.28))).setScale (2, BigDecimal.ROUND_DOWN);
			VSP1= (VSP1.multiply (BigDecimal.valueOf (0.0995))).setScale (2, BigDecimal.ROUND_DOWN);
		}
		VSP2= ZRE4VP.multiply (BigDecimal.valueOf (0.11));
		VHB= BigDecimal.valueOf(KZTAB).multiply(BigDecimal.valueOf (1500));
		if(VSP2.compareTo (VHB) == 1) {
			VSP2= VHB;
		}
		VSPN= (VSP1.add (VSP2)).setScale (0, BigDecimal.ROUND_UP);
		MVSP();
		if(VSPN.compareTo (VSP) == 1) {
			VSP= VSPN.setScale (2, BigDecimal.ROUND_DOWN);
		}
	}

	/// Vorsorgepauschale (§39b Abs. 2 Satz 6 Nr 3 EStG) Vergleichsberechnung fuer Guenstigerpruefung, PAP Seite 16
	 void MVSP() {

		if(KENNZ == 1) {
			VSPO= ZRE4VP1.multiply (BigDecimal.valueOf (0.2));
		} else {
			VSPO= ZRE4VP.multiply (BigDecimal.valueOf (0.2));
		}
		VSPVOR= BigDecimal.valueOf (KZTAB).multiply (BigDecimal.valueOf (3068));
		VSPMAX1= BigDecimal.valueOf (KZTAB).multiply (BigDecimal.valueOf (1334));
		VSPMAX2= BigDecimal.valueOf (KZTAB).multiply (BigDecimal.valueOf (667));
		VSPKURZ= BigDecimal.valueOf (KZTAB).multiply (BigDecimal.valueOf (1134));
		if(KRV == 1) {
			if(VSPO.compareTo (VSPKURZ) == 1) {
				VSP= VSPKURZ;
			} else {
				VSP= VSPO.setScale (0, BigDecimal.ROUND_DOWN);
			}
		} else {
			UMVSP();
		}
	}

	/// Vorsorgepauschale, PAP Seite 17
	 void UMVSP() {

		if(KENNZ == 1) {
			VSPVOR= VSPVOR.subtract (ZRE4VP1.multiply (BigDecimal.valueOf (0.16)));
		} else {
			VSPVOR= VSPVOR.subtract (ZRE4VP.multiply (BigDecimal.valueOf (0.16)));
		}
		if(VSPVOR.compareTo (BigDecimal.ZERO) == -1) {
			VSPVOR= BigDecimal.ZERO;
		}
		if(VSPO.compareTo (VSPVOR) == 1) {
			VSP= VSPVOR;
			VSPREST= VSPO.subtract (VSPVOR);
			if(VSPREST.compareTo (VSPMAX1) == 1) {
				VSP= VSP.add (VSPMAX1);
				VSPREST= (VSPREST.subtract (VSPMAX1)).divide (ZAHL2, 2, BigDecimal.ROUND_UP);
				if(VSPREST.compareTo (VSPMAX2) == 1) {
					VSP= (VSP.add (VSPMAX2)).setScale (0, BigDecimal.ROUND_DOWN);
				} else {
					VSP= (VSP.add (VSPREST)).setScale (0, BigDecimal.ROUND_DOWN);
				}
			} else {
				VSP= (VSP.add (VSPREST)).setScale (0, BigDecimal.ROUND_DOWN);
			}
		} else {
			VSP= VSPO.setScale (0, BigDecimal.ROUND_DOWN);
		}
	}

	/// Lohnsteuer fuer die Steuerklassen V und VI (§ 39b Abs. 2 Satz 8 EStG), PAP Seite 18
	 void MST5_6() {

		ZZX= X;
		if(ZZX.compareTo (BigDecimal.valueOf (25812)) == 1) {
			ZX= BigDecimal.valueOf (25812);
			UP5_6();
			if(ZZX.compareTo (BigDecimal.valueOf (200000)) == 1) {
				ST= (ST.add (BigDecimal.valueOf (73158.96))).setScale(0, BigDecimal.ROUND_DOWN);
				ST= (ST.add ((ZZX.subtract (BigDecimal.valueOf (200000))).multiply (BigDecimal.valueOf (0.45)))).setScale (0, BigDecimal.ROUND_DOWN);
			} else {
				ST= (ST.add ((ZZX.subtract (BigDecimal.valueOf (25812))).multiply (BigDecimal.valueOf (0.42)))).setScale (0, BigDecimal.ROUND_DOWN);
			}
		} else {
			ZX= ZZX;
			UP5_6();
			if(ZZX.compareTo (BigDecimal.valueOf (9144)) == 1) {
				VERGL= ST;
				ZX= BigDecimal.valueOf (9144);
				UP5_6();
				HOCH= (ST.add ((ZZX.subtract (BigDecimal.valueOf (9144))).multiply (BigDecimal.valueOf (0.42)))).setScale (0, BigDecimal.ROUND_DOWN);
				if(HOCH.compareTo (VERGL) == -1) {
					ST= HOCH;
				} else {
					ST= VERGL;
				}
			}
		}
	}

	/// Lohnsteuer fuer die Steuerklassen V und VI (§ 39b Abs. 2 Satz 8 EStG), PAP Seite 18
	 void UP5_6() {

		X= ZX.multiply (BigDecimal.valueOf (1.25));
		UPTAB07();
		ST1= ST;
		X= ZX.multiply (BigDecimal.valueOf (0.75));
		UPTAB07();
		ST2= ST;
		DIFF= (ST1.subtract (ST2)).multiply (ZAHL2);
		MIST= (ZX.multiply (BigDecimal.valueOf (0.15))).setScale (0, BigDecimal.ROUND_DOWN);
		if(MIST.compareTo (DIFF) == 1) {
			ST= MIST;
		} else {
			ST= DIFF;
		}
	}

	/// Solidaritaetszuschlag, PAP Seite 19
	 void MSOLZ() {

		SOLZFREI= BigDecimal.valueOf (972 * KZTAB);
		if(JBMG.compareTo (SOLZFREI) == 1) {
			SOLZJ= (JBMG.multiply (BigDecimal.valueOf (5.5))).divide(ZAHL100).setScale(2, BigDecimal.ROUND_DOWN);
			SOLZMIN= (JBMG.subtract (SOLZFREI)).multiply (BigDecimal.valueOf (20)).divide (ZAHL100);
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

	/// Anteil von Jahresbetraegen fuer einen LZZ (§ 39b Abs. 2 Satz 10 EStG), PAP Seite 20
	 void UPANTEIL() {

		if(LZZ == 1) {
			ANTEIL1= JW;
			ANTEIL2= JW;
		} else {
			if(LZZ == 2) {
				ANTEIL1= JW.divide (ZAHL12, 0, BigDecimal.ROUND_DOWN);
				ANTEIL2= JW.divide (ZAHL12, 0, BigDecimal.ROUND_UP);
			} else {
				if(LZZ == 3) {
					ANTEIL1= (JW.multiply (ZAHL7)).divide (ZAHL360, 0, BigDecimal.ROUND_DOWN);
					ANTEIL2= (JW.multiply (ZAHL7)).divide (ZAHL360, 0, BigDecimal.ROUND_UP);
				} else {
					ANTEIL1= JW.divide (ZAHL360, 0, BigDecimal.ROUND_DOWN);
					ANTEIL2= JW.divide (ZAHL360, 0, BigDecimal.ROUND_UP);
				}
			}
		}
	}

	/// Berechnung sonstiger Bezuege nach § 39b Abs. 3 Saetze 1 bis 7 EStG), PAP Seite 21
	 void MSONST() {

		if(SONSTB.compareTo (BigDecimal.ZERO) == 0) {
			STS= BigDecimal.ZERO;
			SOLZS= BigDecimal.ZERO;
			BKS= BigDecimal.ZERO;
		} else {
			LZZ= 1;
			VBEZ= JVBEZ;
			RE4= JRE4;
			MRE4LZZ();
			MRE4LZZ2();
			MLSTJAHR();
			LST1= ST.multiply (ZAHL100);
			VBEZ= JVBEZ.add (VBS);
			RE4= JRE4.add (SONSTB);
			VBEZS= VBEZS.add (STERBE);
			MRE4LZZ();
			MRE4LZZ2();
			MLSTJAHR();
			LST2= ST.multiply (ZAHL100);
			STS= LST2.subtract (LST1);
			if(SONSTB.compareTo (BigDecimal.ZERO) == 1) {
				if(STS.compareTo (BigDecimal.ZERO) == -1) {
					STS= BigDecimal.ZERO;
				}
			}
			SOLZS= STS.multiply (BigDecimal.valueOf (5.5)).divide (ZAHL100, 0, BigDecimal.ROUND_DOWN);
			if(R > 0) {
				BKS= STS;
			} else {
				BKS= BigDecimal.ZERO;
			}
		}
	}

	/** Berechnung sonstiger Bezuege nach § 39b Abs. 3 Saetze 1 bis 7 EStG)<br>
         PAP Seite 21 */
	 void MRE4LZZ2() {

		RE4LZZ = RE4.subtract(FVB).subtract(ALTE).subtract(JFREIB).add(JHINZU);
		RE4LZZV = RE4.subtract(FVB).subtract(ALTE);
		MRE4();
		MZTABFB();
	}

	/// Berechnung der Verguetung fuer mehrjaehrige Taetigkeit nach § 39b Abs. 3 Satz 9 EStG), PAP Seite 22
	 void MVMT() {

		if(VKAPA.compareTo (BigDecimal.ZERO) == -1) {
			VKAPA= BigDecimal.ZERO;
		}
		if((VMT.add (VKAPA)).compareTo (BigDecimal.ZERO) == 1) {
			LZZ= 1;
			VBEZ= JVBEZ.add (VBS);
			RE4= JRE4.add (SONSTB);
			MRE4LZZ();
			MRE4LZZ2();
			MLSTJAHR();
			LST1= ST.multiply (ZAHL100);
			VMT= VMT.add (VKAPA);
			VBEZS= VBEZS.add (VKAPA);
			VBEZ= VBEZ.add (VKAPA);
			RE4= JRE4.add (SONSTB).add (VMT);
			MRE4LZZ();
			MRE4LZZ2();
			KENNZ= 1;
			ZRE4VP1= ZRE4VP;
			MLSTJAHR();
			LST3= ST.multiply (ZAHL100);
			VBEZ= VBEZ.subtract (VKAPA);
			VBEZS= VBEZS.subtract (VKAPA);
			RE4= JRE4.add (SONSTB);
			MRE4LZZ();
			if((RE4.subtract (JFREIB).add (JHINZU)).compareTo (BigDecimal.ZERO) == -1) {
				RE4= RE4.subtract (JFREIB).add (JHINZU);
				JFREIB= BigDecimal.ZERO;
				JHINZU= BigDecimal.ZERO;
				RE4= (RE4.add (VMT)).divide (ZAHL5, 0, BigDecimal.ROUND_DOWN);
				MRE4LZZ2();
				MLSTJAHR();
				LST2= ST.multiply (ZAHL100);
				STV= LST2.multiply (ZAHL5);
			} else {
				RE4= RE4.add (VMT.divide (ZAHL5, 0, BigDecimal.ROUND_DOWN));
				MRE4LZZ2();
				MLSTJAHR();
				LST2= ST.multiply (ZAHL100);
				STV= (LST2.subtract (LST1)).multiply (ZAHL5);
			}
			LST3= LST3.subtract (LST1);
			if(LST3.compareTo (STV) == -1) {
				STV= LST3;
			}
			SOLZV= (STV.multiply (BigDecimal.valueOf (5.5))).divide (ZAHL100, 0, BigDecimal.ROUND_DOWN);
			if(R > 0) {
				BKV= STV;
			} else {
				BKV= BigDecimal.ZERO;
			}
		} else {
			STV= BigDecimal.ZERO;
			SOLZV= BigDecimal.ZERO;
			BKV= BigDecimal.ZERO;
		}
	}

	/// Tarifliche Einkommensteuer §32a EStG, PAP Seite 23
	 void UPTAB07() {

		if(X.compareTo (BigDecimal.valueOf (7665)) == -1) {
			ST= BigDecimal.ZERO;
		} else {
			if(X.compareTo (BigDecimal.valueOf (12740)) == -1) {
				Y= (X.subtract (BigDecimal.valueOf (7664))).divide (BigDecimal.valueOf (10000), 6, BigDecimal.ROUND_DOWN);
				RW= Y.multiply (BigDecimal.valueOf (883.74));
				RW= RW.add (BigDecimal.valueOf (1500));
				ST= (RW.multiply (Y)).setScale (0, BigDecimal.ROUND_DOWN);
			} else {
				if(X.compareTo (BigDecimal.valueOf (52152)) == -1) {
					Y= (X.subtract (BigDecimal.valueOf (12739))).divide (BigDecimal.valueOf (10000), 6, BigDecimal.ROUND_DOWN);
					RW= Y.multiply (BigDecimal.valueOf (228.74));
					RW= RW.add (BigDecimal.valueOf (2397));
					RW= RW.multiply (Y);
					ST= (RW.add (BigDecimal.valueOf (989))).setScale (0, BigDecimal.ROUND_DOWN);
				} else {
					if(X.compareTo (BigDecimal.valueOf (250001)) == -1) {
						ST= ((X.multiply (BigDecimal.valueOf (0.42))).subtract (BigDecimal.valueOf (7914))).setScale (0, BigDecimal.ROUND_DOWN);
					} else {
						ST= ((X.multiply (BigDecimal.valueOf (0.45))).subtract (BigDecimal.valueOf (15414))).setScale (0, BigDecimal.ROUND_DOWN);
					}
				}
			}
		}
		ST= ST.multiply (BigDecimal.valueOf (KZTAB));
	}

}