import 'package:lohnsteuerrechenr/src/BigDecimal.dart';
import 'package:lohnsteuerrechenr/src/LohnsteuerInterface.dart';

/// 
/// @author Marcel Lehmann (https://github.com/MarcelLehmann/Lohnsteuer) 
/// @date Fri Mar 15 08:35:04 CET 2024
/// 

 class Lohnsteuer2008 implements LohnsteuerInterface {

	/** Stand: 2015-11-16 */
	/// ZIVIT Düsseldorf

	/* EINGABEPARAMETER*/

	 int AJAHR = 0;
	 int ALTER1 = 0;
	 BigDecimal JFREIB = BigDecimal(0);
	 BigDecimal JHINZU = BigDecimal(0);
	 BigDecimal JRE4 = BigDecimal(0);
	 BigDecimal JVBEZ = BigDecimal(0);
	 int KRV = 0;
	 int LZZ = 0;
	 BigDecimal LZZFREIB = BigDecimal(0);
	 BigDecimal LZZHINZU = BigDecimal(0);
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

	/** Altersentlastungsbetrag nach AlterseinkÃ¼nftegesetz in â‚¬,<br>
             Cent (2 Dezimalstellen) */
	 BigDecimal ALTE = BigDecimal(0);

	/// Arbeitnehmer-Pauschbetrag in EURO
	 BigDecimal ANP = BigDecimal(0);

	/** Auf den Lohnzahlungszeitraum entfallender Anteil von Jahreswerten<br>
             auf ganze Cents abgerundet */
	 BigDecimal ANTEIL1 = BigDecimal(0);

	/** Auf den Lohnzahlungszeitraum entfallender Anteil von Jahreswerten<br>
             auf ganze Cents aufgerundet */
	 BigDecimal ANTEIL2 = BigDecimal(0);

	/** Bemessungsgrundlage fÃ¼r Altersentlastungsbetrag in â‚¬, Cent<br>
             (2 Dezimalstellen) */
	 BigDecimal BMG = BigDecimal(0);

	/// Differenz zwischen ST1 und ST2 in EURO
	 BigDecimal DIFF = BigDecimal(0);

	/// Entlastungsbetrag fuer Alleinerziehende in EURO
	 BigDecimal EFA = BigDecimal(0);

	/// Versorgungsfreibetrag in â‚¬, Cent (2 Dezimalstellen)
	 BigDecimal FVB = BigDecimal(0);

	/** Versorgungsfreibetrag in â‚¬, Cent (2 Dezimalstellen) fÃ¼r die Berechnung<br>
             der Lohnsteuer fÃ¼r den sonstigen Bezug */
	 BigDecimal FVBSO = BigDecimal(0);

	/// Zuschlag zum Versorgungsfreibetrag in EURO
	 BigDecimal FVBZ = BigDecimal(0);

	/** Zuschlag zum Versorgungsfreibetrag in EURO fuer die Berechnung<br>
             der Lohnsteuer beim sonstigen Bezug */
	 BigDecimal FVBZSO = BigDecimal(0);

	/** Sicherungsfeld fÃ¼r den Zuschlag zum Versorgungsfreibetrag in â‚¬ fÃ¼r<br>
             die Berechnung der Lohnsteuer fÃ¼r die VergÃ¼tung fÃ¼r mehrjÃ¤hrige<br>
             TÃ¤tigkeit */
	 BigDecimal FVBZOSO = BigDecimal(0);

	/// Maximaler Altersentlastungsbetrag in â‚¬
	 BigDecimal HBALTE = BigDecimal(0);

	/// MaÃŸgeblicher maximaler Versorgungsfreibetrag in â‚¬
	 BigDecimal HFVB = BigDecimal(0);

	/** MaÃŸgeblicher maximaler Zuschlag zum Versorgungsfreibetrag in â‚¬,Cent<br>
             (2 Dezimalstellen) */
	 BigDecimal HFVBZ = BigDecimal(0);

	/** MaÃŸgeblicher maximaler Zuschlag zum Versorgungsfreibetrag in â‚¬, Cent<br>
             (2 Dezimalstellen) fÃ¼r die Berechnung der Lohnsteuer fÃ¼r den<br>
             sonstigen Bezug */
	 BigDecimal HFVBZSO = BigDecimal(0);

	/// Nummer der Tabellenwerte fuer Versorgungsparameter
	 int J = 0;

	/** Jahressteuer nach Â§ 51a EStG, aus der Solidaritaetszuschlag und<br>
             Bemessungsgrundlage fuer die Kirchenlohnsteuer ermittelt werden in EURO */
	 BigDecimal JBMG = BigDecimal(0);

	/** Auf einen Jahreslohn hochgerechneter LZZFREIB in â‚¬, Cent<br>
             (2 Dezimalstellen) */
	 BigDecimal JLFREIB = BigDecimal(0);

	/** Auf einen Jahreslohn hochgerechnete LZZHINZU in â‚¬, Cent<br>
             (2 Dezimalstellen) */
	 BigDecimal JLHINZU = BigDecimal(0);

	/** Jahreswert, dessen Anteil fuer einen Lohnzahlungszeitraum in<br>
             UPANTEIL errechnet werden soll in Cents */
	 BigDecimal JW = BigDecimal(0);

	/// Nummer der Tabellenwerte fuer Parameter bei Altersentlastungsbetrag
	 int K = 0;

	/** Merker fÃ¼r Berechnung Lohnsteuer fÃ¼r mehrjÃ¤hrige TÃ¤tigkeit.<br>
             0 = normale Steuerberechnung<br>
             1 = Steuerberechnung fÃ¼r mehrjÃ¤hrige TÃ¤tigkeit<br>
             2 = Steuerberechnung fÃ¼r mehrjÃ¤hrige TÃ¤tigkeit Sonderfall nach Â§ 34 Abs. 1 Satz 3 EStG */
	 int KENNVMT = 0;

	/// Summe der Freibetraege fuer Kinder in EURO
	 BigDecimal KFB = BigDecimal(0);

	/** Kennzahl fuer die Einkommensteuer-Tabellenart:<br>
             1 = Grundtabelle<br>
             2 = Splittingtabelle */
	 int KZTAB = 0;

	/// Jahreslohnsteuer in EURO
	 BigDecimal LSTJAHR = BigDecimal(0);

	/// Zwischenfelder der Jahreslohnsteuer in Cent
	 BigDecimal LST1 = BigDecimal(0);
	 BigDecimal LST2 = BigDecimal(0);
	 BigDecimal LST3 = BigDecimal(0);
	 BigDecimal LSTOSO = BigDecimal(0);
	 BigDecimal LSTSO = BigDecimal(0);

	/// Mindeststeuer fuer die Steuerklassen V und VI in EURO
	 BigDecimal MIST = BigDecimal(0);

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

	/** Bemessungsgrundlage fÃ¼r den Versorgungsfreibetrag in Cent fÃ¼r<br>
             den sonstigen Bezug */
	 BigDecimal VBEZBSO = BigDecimal(0);

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

	/// Hoechstbetrag der Vorsorgepauschale nach Â§ 10c Abs. 3 EStG in EURO
	 BigDecimal VSPKURZ = BigDecimal(0);

	/// Hoechstbetrag der Vorsorgepauschale nach Â§ 10c Abs. 2 Nr. 2 EStG in EURO
	 BigDecimal VSPMAX1 = BigDecimal(0);

	/// Hoechstbetrag der Vorsorgepauschale nach Â§ 10c Abs. 2 Nr. 3 EStG in EURO
	 BigDecimal VSPMAX2 = BigDecimal(0);

	/** Vorsorgepauschale nach Â§ 10c Abs. 2 Satz 2 EStG vor der Hoechstbetragsberechnung<br>
             in EURO, C (2 Dezimalstellen) */
	 BigDecimal VSPO = BigDecimal(0);

	/** Fuer den Abzug nach Â§ 10c Abs. 2 Nrn. 2 und 3 EStG verbleibender<br>
             Rest von VSPO in EURO, C (2 Dezimalstellen) */
	 BigDecimal VSPREST = BigDecimal(0);

	/** Hoechstbetrag der Vorsorgepauschale nach Â§ 10c Abs. 2 Nr. 1 EStG<br>
             in EURO, C (2 Dezimalstellen) */
	 BigDecimal VSPVOR = BigDecimal(0);

	/** Zu versteuerndes Einkommen gem. Â§ 32a Abs. 1 und 2 EStG â‚¬, C<br>
             (2 Dezimalstellen) */
	 BigDecimal X = BigDecimal(0);

	/// gem. Â§ 32a Abs. 1 EStG (6 Dezimalstellen)
	 BigDecimal Y = BigDecimal(0);

	/** Auf einen Jahreslohn hochgerechnetes RE4 in â‚¬, C (2 Dezimalstellen)<br>
             nach Abzug der FreibetrÃ¤ge nach Â§ 39 b Abs. 2 Satz 3 und 4. */
	 BigDecimal ZRE4 = BigDecimal(0);

	/// Auf einen Jahreslohn hochgerechnetes RE4 in â‚¬, C (2 Dezimalstellen)
	 BigDecimal ZRE4J = BigDecimal(0);

	/** Sicherungsfeld von ZRE4 bei der Berechnung der Lohnsteuer fÃ¼r<br>
             die VergÃ¼tung fÃ¼r mehrjÃ¤hrige TÃ¤tigkeit in â‚¬, C (2 Dezimalstellen) */
	 BigDecimal ZRE4OSO = BigDecimal(0);

	/** 1/5 des mehrjÃ¤hriger Bezugs abzÃ¼glich der auf diesen Lohnbestandteil<br>
             entfallenden festen TabellenfreibetrÃ¤ge in â‚¬, C (2 Dezimalstellen) */
	 BigDecimal ZRE4VMT = BigDecimal(0);

	/** Auf einen Jahreslohn hochgerechnetes RE4 in â‚¬, C (2 Dezimalstellen)<br>
             nach Abzug des Versorgungsfreibetrags und des Alterentlastungsbetrags<br>
             zur Berechnung der Vorsorgepauschale in â‚¬, Cent (2 Dezimalstellen) */
	 BigDecimal ZRE4VP = BigDecimal(0);

	/** Feste TabellenfreibetrÃ¤ge (ohne Vorsorgepauschale) in â‚¬, Cent<br>
             (2 Dezimalstellen) */
	 BigDecimal ZTABFB = BigDecimal(0);

	/** Sicherungsfeld von ZTABFB bei der Berechnung fÃ¼r die VergÃ¼tung<br>
             fÃ¼r mehrjÃ¤hrige TÃ¤tigkeit in â‚¬, Cent (2 Dezimalstellen) */
	 BigDecimal ZTABFBOSO = BigDecimal(0);

	/** Auf einen Jahreslohn hochgerechnetes (VBEZ abzueglich FVB) in<br>
             EURO, C (2 Dezimalstellen) */
	 BigDecimal ZVBEZ = BigDecimal(0);

	/// Auf einen Jahreslohn hochgerechnetes VBEZ in â‚¬, C (2 Dezimalstellen)
	 BigDecimal ZVBEZJ = BigDecimal(0);

	/// Zu versteuerndes Einkommen in â‚¬, C (2 Dezimalstellen)
	 BigDecimal ZVE = BigDecimal(0);

	/** Zwischenfelder zu X fuer die Berechnung der Steuer nach Â§ 39b<br>
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
	 static final BigDecimal ZAHL700 = BigDecimal(700);

	/* SETTER */

	@override
	 void setRe4(BigDecimal arg0) { RE4 = arg0; }

	@override
	 void setJvbez(BigDecimal arg0) { JVBEZ = arg0; }

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

	@override
	 void setR(int arg0) { R = arg0; }

	@override
	 void setVkapa(BigDecimal arg0) { VKAPA = arg0; }

	@override
	 void setJre4(BigDecimal arg0) { JRE4 = arg0; }

	@override
	 void setZkf(BigDecimal arg0) { ZKF = arg0; }

	@override
	 void setLzzfreib(BigDecimal arg0) { LZZFREIB = arg0; }

	@override
	 void setZmvb(int arg0) { ZMVB = arg0; }

	@override
	 void setLzzhinzu(BigDecimal arg0) { LZZHINZU = arg0; }

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
	 void setMbv(BigDecimal arg0) { /* required for newer calculator */ }

	@override
	 void setSonstent(BigDecimal arg0) { /* required for newer calculator */ }

	@override
	 void setEntsch(BigDecimal arg0) { /* required for newer calculator */ }

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

	/// PROGRAMMABLAUFPLAN 2008, PAP Seite 10
	@override
	 void main() {

		MRE4JL();
		MRE4();
		MRE4ABZ();
		MZTABFB();
		KENNVMT= 0;
		MLSTJAHR();
		LSTJAHR= ST;
		JW= LSTJAHR.multiply (ZAHL100);
		UPANTEIL();
		LSTLZZ= ANTEIL1;
		if(ZKF.compareTo (BigDecimal.ZERO) == 1) {
			ZTABFB= (ZTABFB.add (KFB)).setScale (2, BigDecimal.ROUND_DOWN);
			MLSTJAHR();
			JBMG= ST;
		} else {
			JBMG= LSTJAHR;
		}
		MSOLZ();
		MSONST();
		MVMT();
	}

	/// Ermittlung des Jahresarbeitslohns und der FreibetrÃ¤ge Â§ 39 b Abs. 2 Satz 2 EStG, PAP Seite 11
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
	}

	/// FreibetrÃ¤ge fÃ¼r VersorgungsbezÃ¼ge, Altersentlastungsbetrag (Â§ 39b Abs. 2 Satz 3 EStG), PAP Seite 12
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
				if(VJAHR < 2040) {
					J= VJAHR - 2004;
				} else {
					J= 36;
				}
			}
			if(LZZ == 1) {
				VBEZB= (VBEZM.multiply (BigDecimal.valueOf (ZMVB))).add (VBEZS);/** Achtung! Rechengenauigkeit Division? */
				HFVB= TAB2[J].divide (ZAHL12).multiply (BigDecimal.valueOf (ZMVB));
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
			VBEZBSO= STERBE.add (VKAPA);
			FVBSO= (FVB.add((VBEZBSO.multiply (TAB1[J])).divide (ZAHL100))).setScale (2, BigDecimal.ROUND_UP);
			if(FVBSO.compareTo (TAB2[J]) == 1) {
				FVBSO = TAB2[J];
			}
			HFVBZSO= (((VBEZB.add(VBEZBSO)).divide (ZAHL100)).subtract (FVBSO)).setScale (2, BigDecimal.ROUND_DOWN);
			if((TAB3[3]).compareTo (HFVBZSO) == 1) {
				FVBZSO = HFVBZSO.setScale(0, BigDecimal.ROUND_UP);
			} else {
				FVBZSO= TAB3[J];
			}
			HFVBZ= ((VBEZB.divide (ZAHL100)).subtract (FVB)).setScale (2, BigDecimal.ROUND_DOWN);
			if(FVBZ.compareTo (HFVBZ) == 1) {
				FVBZ = HFVBZ.setScale (0, BigDecimal.ROUND_UP);
			}
		}
		MRE4ALTE();
	}

	/// Altersentlastungsbetrag (Â§ 39b Abs. 2 Satz 3 EStG), PAP Seite 13
	 void MRE4ALTE() {

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
			BMG= ZRE4J.subtract (ZVBEZJ);
			ALTE= (BMG.multiply (TAB4[K])).setScale (2, BigDecimal.ROUND_UP);
			HBALTE= TAB5[K];
			if(ALTE.compareTo (HBALTE) == 1) {
				ALTE= HBALTE;
			}
		}
	}

	/// Ermittlung des Jahresarbeitslohns nach Abzug der FreibetrÃ¤ge nach Â§ 39 b Abs. 2 Satz 3 und 4 EStG, PAP Seite 15
	 void MRE4ABZ() {

		ZRE4= (ZRE4J.subtract (FVB).subtract (ALTE).subtract (JLFREIB).add (JLHINZU)).setScale (2, BigDecimal.ROUND_DOWN);
		if(ZRE4.compareTo (BigDecimal.ZERO) == -1) {
			ZRE4= BigDecimal.ZERO;
		}
		ZRE4VP= (ZRE4J.subtract (FVB).subtract (ALTE)).setScale (2, BigDecimal.ROUND_DOWN);
		if(ZRE4VP.compareTo (BigDecimal.ZERO) == -1) {
			ZRE4VP= BigDecimal.ZERO;
		}
		ZVBEZ= (ZVBEZJ.subtract (FVB)).setScale (2, BigDecimal.ROUND_DOWN);
		if(ZVBEZ.compareTo (BigDecimal.ZERO) == -1) {
			ZVBEZ= BigDecimal.ZERO;
		}
	}

	/// Ermittlung der festen TabellenfreibetrÃ¤ge (ohne Vorsorgepauschale), PAP Seite 16
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
		} else {
			FVBZ= BigDecimal.valueOf (0);
			FVBZSO= BigDecimal.valueOf (0);
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
		ZTABFB= (EFA.add (ANP).add (SAP).add (FVBZ)).setScale (2, BigDecimal.ROUND_DOWN);
	}

	/// Ermittlung Jahreslohnsteuer, PAP Seite 17
	 void MLSTJAHR() {

		if(STKL < 5) {
			UPEVP();
		} else {
			VSP= BigDecimal.ZERO;
		}
		if(KENNVMT == 0) {
			ZVE= (ZRE4.subtract (ZTABFB).subtract (VSP)).setScale (2, BigDecimal.ROUND_DOWN);
		} else {
			if(KENNVMT == 1) {
				ZVE= ZRE4OSO.subtract (ZTABFBOSO).add (ZRE4VMT).subtract (VSP).setScale (2, BigDecimal.ROUND_DOWN);
			} else {
				ZVE= (((ZRE4.subtract (ZTABFB)).divide (ZAHL5)).subtract (VSP)).setScale (2, BigDecimal.ROUND_DOWN);
			}
		}
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

	/// Vorsorgepauschale (Â§ 39b Abs. 2 Satz 6 Nr 3 EStG) nach AlterseinkÃ¼nftegesetz, PAP Seite 18
	 void UPEVP() {
/** Achtung: Er wird davon ausgegangen, dass<br>
    a) die Rentenversicherungsbemessungsgrenze sich 2008 auf 63.600 erhÃ¶ht und<br>
    b) der Beitragsatz zur Rentenversicherung gegenÃ¼ber 2007 unverÃ¤ndert bleibt */
		if(KRV > 0) {
			VSP1= BigDecimal.ZERO;
		} else {
			if(ZRE4VP.compareTo (BigDecimal.valueOf (63600)) == 1) {
				ZRE4VP= BigDecimal.valueOf (63600);
			}
			VSP1= (ZRE4VP.multiply (BigDecimal.valueOf (0.32))).setScale (2, BigDecimal.ROUND_DOWN);
			VSP1= (VSP1.multiply (BigDecimal.valueOf (0.0995))).setScale (2, BigDecimal.ROUND_DOWN);
		}
		VSP2= (ZRE4VP.multiply (BigDecimal.valueOf (0.11))).setScale (2, BigDecimal.ROUND_DOWN);
		VHB= (BigDecimal.valueOf(KZTAB).multiply(BigDecimal.valueOf (1500))).setScale (2, BigDecimal.ROUND_DOWN);
		if(VSP2.compareTo (VHB) == 1) {
			VSP2= VHB;
		}
		VSPN= (VSP1.add (VSP2)).setScale (0, BigDecimal.ROUND_UP);
		MVSP();
		if(VSPN.compareTo (VSP) == 1) {
			VSP= VSPN.setScale (2, BigDecimal.ROUND_DOWN);
		}
	}

	/// Vorsorgepauschale (Â§39b Abs. 2 Satz 6 Nr 3 EStG) Vergleichsberechnung fuer Guenstigerpruefung, PAP Seite 19
	 void MVSP() {

		VSPO= (ZRE4VP.multiply (BigDecimal.valueOf (0.2))).setScale (2, BigDecimal.ROUND_DOWN);
		VSPVOR= (BigDecimal.valueOf (KZTAB).multiply (BigDecimal.valueOf (3068))).setScale (2, BigDecimal.ROUND_DOWN);
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

	/// Vorsorgepauschale, PAP Seite 20
	 void UMVSP() {

		VSPVOR= (VSPVOR.subtract (ZRE4VP.multiply (BigDecimal.valueOf (0.16)))).setScale (2, BigDecimal.ROUND_DOWN);
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

	/// Lohnsteuer fuer die Steuerklassen V und VI (Â§ 39b Abs. 2 Satz 8 EStG), PAP Seite 21
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

	/// Lohnsteuer fuer die Steuerklassen V und VI (Â§ 39b Abs. 2 Satz 8 EStG), PAP Seite 21
	 void UP5_6() {

		X= (ZX.multiply (BigDecimal.valueOf (1.25))).setScale (2, BigDecimal.ROUND_DOWN);
		UPTAB07();
		ST1= ST;
		X= (ZX.multiply (BigDecimal.valueOf (0.75))).setScale (2, BigDecimal.ROUND_DOWN);
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

	/// Solidaritaetszuschlag, PAP Seite 22
	 void MSOLZ() {

		SOLZFREI= BigDecimal.valueOf (972 * KZTAB);
		if(JBMG.compareTo (SOLZFREI) == 1) {
			SOLZJ= (JBMG.multiply (BigDecimal.valueOf (5.5))).divide(ZAHL100).setScale(2, BigDecimal.ROUND_DOWN);
			SOLZMIN= (JBMG.subtract (SOLZFREI)).multiply (BigDecimal.valueOf (20)).divide (ZAHL100).setScale (2, BigDecimal.ROUND_DOWN);
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

	/// Anteil von Jahresbetraegen fuer einen LZZ (Â§ 39b Abs. 2 Satz 10 EStG), PAP Seite 23
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

	/// Berechnung sonstiger Bezuege nach Â§ 39b Abs. 3 Saetze 1 bis 7 EStG), PAP Seite 24
	 void MSONST() {

		LZZ= 1;
		if(ZMVB == 0) {
			ZMVB= 12;
		}
		if(SONSTB.compareTo (BigDecimal.ZERO) == 0) {
			LSTSO= BigDecimal.ZERO;
			STS= BigDecimal.ZERO;
			SOLZS= BigDecimal.ZERO;
			BKS= BigDecimal.ZERO;
		} else {
			MOSONST();
			ZRE4J= ((JRE4.add (SONSTB)).divide (ZAHL100)).setScale (2, BigDecimal.ROUND_DOWN);
			ZVBEZJ= ((JVBEZ.add (VBS)).divide (ZAHL100)).setScale (2, BigDecimal.ROUND_DOWN);
			MRE4SONST();
			MLSTJAHR();
			LSTSO= ST.multiply (ZAHL100);
			STS= LSTSO.subtract (LSTOSO);
			if(STS.compareTo (BigDecimal.ZERO) == -1) {
				STS= BigDecimal.ZERO;
			}
			SOLZS= STS.multiply (BigDecimal.valueOf (5.5)).divide (ZAHL100, 0, BigDecimal.ROUND_DOWN);
			if(R > 0) {
				BKS= STS;
			} else {
				BKS= BigDecimal.ZERO;
			}
		}
	}

	/// Berechnung der Verguetung fuer mehrjaehrige Taetigkeit nach Â§ 39b Abs. 3 Satz 9 EStG), PAP Seite 25
	 void MVMT() {

		if(VKAPA.compareTo (BigDecimal.ZERO) == -1) {
			VKAPA= BigDecimal.ZERO;
		}
		if((VMT.add (VKAPA)).compareTo (BigDecimal.ZERO) == 1) {
			if(LSTSO.compareTo (BigDecimal.ZERO) == 0) {
				MOSONST();
				LST1= LSTOSO;
			} else {
				LST1= LSTSO;
			}
			ZRE4OSO= ZRE4;
			ZTABFBOSO= ZTABFB;
			FVBZOSO= FVBZ;
			ZRE4J= ((JRE4.add (SONSTB).add (VMT).add (VKAPA)).divide (ZAHL100)).setScale (2, BigDecimal.ROUND_DOWN);
			ZVBEZJ= ((JVBEZ.add (VBS).add (VKAPA)).divide (ZAHL100)).setScale (2, BigDecimal.ROUND_DOWN);
			MRE4SONST();
			MLSTJAHR();
			LST3= ST.multiply (ZAHL100);
			ZTABFB= (ZTABFB.subtract (FVBZ).add (FVBZOSO)).setScale (2, BigDecimal.ROUND_DOWN);
			KENNVMT= 1;
			if((JRE4.add (SONSTB).subtract (JFREIB).add (JHINZU)).compareTo (BigDecimal.ZERO) == -1) {
				KENNVMT= 2;
				MLSTJAHR();
				LST2= ST.multiply (ZAHL100);
				STV= LST2.multiply (ZAHL5);
			} else {
				ZRE4VMT= (((VMT.divide (ZAHL100)).add (VKAPA.divide (ZAHL100)).subtract (ZTABFB).add (ZTABFBOSO)).divide (ZAHL5)).setScale (2, BigDecimal.ROUND_DOWN);
				MLSTJAHR();
				LST2= ST.multiply (ZAHL100);
				STV= (LST2.subtract (LST1)).multiply (ZAHL5);
			}
			LST3= LST3.subtract (LST1);
			if(LST3.compareTo (STV) == -1) {
				STV= LST3;
			}
			if(STV.compareTo (BigDecimal.ZERO) == -1) {
				STV= BigDecimal.ZERO;
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

	/// Sonderberechnung ohne sonstige BezÃ¼ge fÃ¼r Berechnung bei sonstigen BezÃ¼gen oder VergÃ¼tung fÃ¼r mehrjÃ¤hrige TÃ¤tigkeit, PAP Seite 26
	 void MOSONST() {

		ZRE4J= (JRE4.divide (ZAHL100)).setScale (2, BigDecimal.ROUND_DOWN);
		ZVBEZJ= (JVBEZ.divide (ZAHL100)).setScale (2, BigDecimal.ROUND_DOWN);
		JLFREIB= JFREIB.divide (ZAHL100, 2, BigDecimal.ROUND_DOWN);
		JLHINZU= JHINZU.divide (ZAHL100, 2, BigDecimal.ROUND_DOWN);
		MRE4();
		MRE4ABZ();
		MZTABFB();
		MLSTJAHR();
		LSTOSO= ST.multiply (ZAHL100);
	}

	/// Sonderberechnung mit sonstige BezÃ¼ge fÃ¼r Berechnung bei sonstigen BezÃ¼gen oder VergÃ¼tung fÃ¼r mehrjÃ¤hrige TÃ¤tigkeit, PAP Seite 26
	 void MRE4SONST() {

		MRE4();
		FVB= FVBSO;
		MRE4ABZ();
		FVBZ= FVBZSO;
		MZTABFB();
	}

	/// Tarifliche Einkommensteuer Â§32a EStG, PAP Seite 27
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