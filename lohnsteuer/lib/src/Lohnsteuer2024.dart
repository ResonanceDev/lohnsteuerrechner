import 'package:decimal/decimal.dart';
import 'package:lohnsteuer/src/LohnsteuerInterface.dart';
import 'package:lohnsteuer/lohnsteuerUtil.dart';
import 'package:rational/rational.dart';

class Lohnsteuer2024 implements LohnsteuerInterface {
  // EINGABEPARAMETER
  int af = 1;
  int AJAHR = 0;
  int ALTER1 = 0;
  Decimal ENTSCH = Decimal.parse("0");
  double f = 1.0;
  Decimal JFREIB = Decimal.parse("0");
  Decimal JHINZU = Decimal.parse("0");
  Decimal JRE4 = Decimal.parse("0");
  Decimal JVBEZ = Decimal.parse("0");
  int KRV = 0;
  Decimal KVZ = Decimal.parse("0");
  int LZZ = 0;
  Decimal LZZFREIB = Decimal.parse("0");
  Decimal LZZHINZU = Decimal.parse("0");
  Decimal MBV = Decimal.parse("0");
  Decimal PKPV = Decimal.parse("0");
  int PKV = 0;
  Decimal PVA = Decimal.parse("0");
  int PVS = 0;
  int PVZ = 0;
  int R = 0;
  Decimal RE4 = Decimal.parse("0");
  Decimal SONSTB = Decimal.parse("0");
  Decimal STERBE = Decimal.parse("0");
  int STKL = 0;
  Decimal VBEZ = Decimal.parse("0");
  Decimal VBEZM = Decimal.parse("0");
  Decimal VBEZS = Decimal.parse("0");
  Decimal VBS = Decimal.parse("0");
  int VJAHR = 0;
  Decimal VKAPA = Decimal.parse("0");
  Decimal VMT = Decimal.parse("0");
  Decimal ZKF = Decimal.parse("0");
  int ZMVB = 0;
  Decimal JRE4ENT = Decimal.parse("0");
  Decimal SONSTENT = Decimal.parse("0");

  // AUSGABEPARAMETER
  Decimal BK = Decimal.parse("0");
  Decimal BKS = Decimal.parse("0");
  Decimal BKV = Decimal.parse("0");
  Decimal LSTLZZ = Decimal.parse("0");
  Decimal SOLZLZZ = Decimal.parse("0");
  Decimal SOLZS = Decimal.parse("0");
  Decimal SOLZV = Decimal.parse("0");
  Decimal STS = Decimal.parse("0");
  Decimal STV = Decimal.parse("0");
  Decimal VKVLZZ = Decimal.parse("0");
  Decimal VKVSONST = Decimal.parse("0");

  // AUSGABEPARAMETER DBA
  Decimal VFRB = Decimal.parse("0");
  Decimal VFRBS1 = Decimal.parse("0");
  Decimal VFRBS2 = Decimal.parse("0");
  Decimal WVFRB = Decimal.parse("0");
  Decimal WVFRBO = Decimal.parse("0");
  Decimal WVFRBM = Decimal.parse("0");

  // INTERNE FELDER
  Decimal ALTE = Decimal.parse("0");
  Decimal ANP = Decimal.parse("0");
  Decimal ANTEIL1 = Decimal.parse("0");
  Decimal BMG = Decimal.parse("0");
  Decimal BBGKVPV = Decimal.parse("0");
  Decimal BBGRV = Decimal.parse("0");
  Decimal DIFF = Decimal.parse("0");
  Decimal EFA = Decimal.parse("0");
  Decimal FVB = Decimal.parse("0");
  Decimal FVBSO = Decimal.parse("0");
  Decimal FVBZ = Decimal.parse("0");
  Decimal FVBZSO = Decimal.parse("0");
  Decimal GFB = Decimal.parse("0");
  Decimal HBALTE = Decimal.parse("0");
  Decimal HFVB = Decimal.parse("0");
  Decimal HFVBZ = Decimal.parse("0");
  Decimal HFVBZSO = Decimal.parse("0");
  int J = 0;
  Decimal JBMG = Decimal.parse("0");
  Decimal JLFREIB = Decimal.parse("0");
  Decimal JLHINZU = Decimal.parse("0");
  Decimal JW = Decimal.parse("0");
  int K = 0;
  int KENNVMT = 0;
  Decimal KFB = Decimal.parse("0");
  Decimal KVSATZAG = Decimal.parse("0");
  Decimal KVSATZAN = Decimal.parse("0");
  int KZTAB = 0;
  Decimal LSTJAHR = Decimal.parse("0");
  Decimal LST1 = Decimal.parse("0");
  Decimal LST2 = Decimal.parse("0");
  Decimal LST3 = Decimal.parse("0");
  Decimal LSTOSO = Decimal.parse("0");
  Decimal LSTSO = Decimal.parse("0");
  Decimal MIST = Decimal.parse("0");
  Decimal PVSATZAG = Decimal.parse("0");
  Decimal PVSATZAN = Decimal.parse("0");
  Decimal RVSATZAN = Decimal.parse("0");
  Decimal RW = Decimal.parse("0");
  Decimal SAP = Decimal.parse("0");
  Decimal SOLZFREI = Decimal.parse("0");
  Decimal SOLZJ = Decimal.parse("0");
  Decimal SOLZMIN = Decimal.parse("0");
  Decimal SOLZSBMG = Decimal.parse("0");
  Decimal SOLZSZVE = Decimal.parse("0");
  Decimal SOLZVBMG = Decimal.parse("0");
  Decimal ST = Decimal.parse("0");
  Decimal ST1 = Decimal.parse("0");
  Decimal ST2 = Decimal.parse("0");
  Decimal STOVMT = Decimal.parse("0");
  Decimal TBSVORV = Decimal.parse("0");
  Decimal VBEZB = Decimal.parse("0");
  Decimal VBEZBSO = Decimal.parse("0");
  Decimal VHB = Decimal.parse("0");
  Decimal VSP = Decimal.parse("0");
  Decimal VSPN = Decimal.parse("0");
  Decimal VSP1 = Decimal.parse("0");
  Decimal VSP2 = Decimal.parse("0");
  Decimal VSP3 = Decimal.parse("0");
  Decimal W1STKL5 = Decimal.parse("0");
  Decimal W2STKL5 = Decimal.parse("0");
  Decimal W3STKL5 = Decimal.parse("0");
  Decimal VSPMAX1 = Decimal.parse("0");
  Decimal VSPMAX2 = Decimal.parse("0");
  Decimal VSPO = Decimal.parse("0");
  Decimal VSPREST = Decimal.parse("0");
  Decimal VSPVOR = Decimal.parse("0");
  Decimal X = Decimal.parse("0");
  Decimal Y = Decimal.parse("0");
  Decimal ZRE4 = Decimal.parse("0");
  Decimal ZRE4J = Decimal.parse("0");
  Decimal ZRE4VP = Decimal.parse("0");
  Decimal ZTABFB = Decimal.parse("0");
  Decimal ZVBEZ = Decimal.parse("0");
  Decimal ZVBEZJ = Decimal.parse("0");
  Decimal ZVE = Decimal.parse("0");
  Decimal ZX = Decimal.parse("0");
  Decimal ZZX = Decimal.parse("0");
  Decimal HOCH = Decimal.parse("0");
  Decimal VERGL = Decimal.parse("0");
  Decimal VKV = Decimal.parse("0");

  // KONSTANTEN
  static final List<Decimal> TAB1 = [
    Decimal.parse("0.0"),
    Decimal.parse("0.4"),
    Decimal.parse("0.384"),
    Decimal.parse("0.368"),
    Decimal.parse("0.352"),
    Decimal.parse("0.336"),
    Decimal.parse("0.32"),
    Decimal.parse("0.304"),
    Decimal.parse("0.288"),
    Decimal.parse("0.272"),
    Decimal.parse("0.256"),
    Decimal.parse("0.24"),
    Decimal.parse("0.224"),
    Decimal.parse("0.208"),
    Decimal.parse("0.192"),
    Decimal.parse("0.176"),
    Decimal.parse("0.16"),
    Decimal.parse("0.152"),
    Decimal.parse("0.144"),
    Decimal.parse("0.136"),
    Decimal.parse("0.128"),
    Decimal.parse("0.12"),
    Decimal.parse("0.112"),
    Decimal.parse("0.104"),
    Decimal.parse("0.096"),
    Decimal.parse("0.088"),
    Decimal.parse("0.08"),
    Decimal.parse("0.072"),
    Decimal.parse("0.064"),
    Decimal.parse("0.056"),
    Decimal.parse("0.048"),
    Decimal.parse("0.04"),
    Decimal.parse("0.032"),
    Decimal.parse("0.024"),
    Decimal.parse("0.016"),
    Decimal.parse("0.008"),
    Decimal.parse("0.0")
  ];

  static final List<Decimal> TAB2 = [
    Decimal.parse("0"), Decimal.parse("3000"), Decimal.parse("2880"), Decimal.parse("2760"), Decimal.parse("2640"), Decimal.parse("2520"), Decimal.parse("2400"), Decimal.parse("2280"), Decimal.parse("2160"), Decimal.parse("2040"), Decimal.parse("1920"), Decimal.parse("1800"), Decimal.parse("1680"),
    Decimal.parse("1560"), Decimal.parse("1440"), Decimal.parse("1320"), Decimal.parse("1200"), Decimal.parse("1140"), Decimal.parse("1080"), Decimal.parse("1020"), Decimal.parse("960"), Decimal.parse("900"), Decimal.parse("840"), Decimal.parse("780"), Decimal.parse("720"), Decimal.parse("660"), Decimal.parse("600"),
    Decimal.parse("540"), Decimal.parse("480"), Decimal.parse("420"), Decimal.parse("360"), Decimal.parse("300"), Decimal.parse("240"), Decimal.parse("180"), Decimal.parse("120"), Decimal.parse("60"), Decimal.parse("0")
  ];

  static final List<Decimal> TAB3 = [
    Decimal.parse("0"), Decimal.parse("900"), Decimal.parse("864"), Decimal.parse("828"), Decimal.parse("792"), Decimal.parse("756"), Decimal.parse("720"), Decimal.parse("684"), Decimal.parse("648"), Decimal.parse("612"), Decimal.parse("576"), Decimal.parse("540"), Decimal.parse("504"), Decimal.parse("468"), Decimal.parse("432"),
    Decimal.parse("396"), Decimal.parse("360"), Decimal.parse("342"), Decimal.parse("324"), Decimal.parse("306"), Decimal.parse("288"), Decimal.parse("270"), Decimal.parse("252"), Decimal.parse("234"), Decimal.parse("216"), Decimal.parse("198"), Decimal.parse("180"), Decimal.parse("162"), Decimal.parse("144"), Decimal.parse("126"),
    Decimal.parse("108"), Decimal.parse("90"), Decimal.parse("72"), Decimal.parse("54"), Decimal.parse("36"), Decimal.parse("18"), Decimal.parse("0")
  ];

  /// Tabelle fuer die Vomhundertsaetze des Altersentlastungsbetrags

  static final List<Decimal> TAB4 =
  [
    Decimal.parse("0.0"),
    Decimal.parse("0.4"),
    Decimal.parse("0.384"),
    Decimal.parse("0.368"),
    Decimal.parse("0.352"),
    Decimal.parse("0.336"),
    Decimal.parse("0.32"),
    Decimal.parse("0.304"),
    Decimal.parse("0.288"),
    Decimal.parse("0.272"),
    Decimal.parse("0.256"),
    Decimal.parse("0.24"),
    Decimal.parse("0.224"),
    Decimal.parse("0.208"),
    Decimal.parse("0.192"),
    Decimal.parse("0.176"),
    Decimal.parse("0.16"),
    Decimal.parse("0.152"),
    Decimal.parse("0.144"),
    Decimal.parse("0.136"),
    Decimal.parse("0.128"),
    Decimal.parse("0.12"),
    Decimal.parse("0.112"),
    Decimal.parse("0.104"),
    Decimal.parse("0.096"),
    Decimal.parse("0.088"),
    Decimal.parse("0.08"),
    Decimal.parse("0.072"),
    Decimal.parse("0.064"),
    Decimal.parse("0.056"),
    Decimal.parse("0.048"),
    Decimal.parse("0.04"),
    Decimal.parse("0.032"),
    Decimal.parse("0.024"),
    Decimal.parse("0.016"),
    Decimal.parse("0.008"),
    Decimal.parse("0.0")
  ];

  static final List<Decimal> TAB5 = [
    (Decimal.zero),
    Decimal.parse("1900"),
    Decimal.parse("1824"),
    Decimal.parse("1748"),
    Decimal.parse("1672"),
    Decimal.parse("1596"),
    Decimal.parse("1520"),
    Decimal.parse("1444"),
    Decimal.parse("1368"),
    Decimal.parse("1292"),
    Decimal.parse("1216"),
    Decimal.parse("1140"),
    Decimal.parse("1064"),
    Decimal.parse("988"),
    Decimal.parse("912"),
    Decimal.parse("836"),
    Decimal.parse("760"),
    Decimal.parse("722"),
    Decimal.parse("684"),
    Decimal.parse("646"),
    Decimal.parse("608"),
    Decimal.parse("570"),
    Decimal.parse("532"),
    Decimal.parse("494"),
    Decimal.parse("456"),
    Decimal.parse("418"),
    Decimal.parse("380"),
    Decimal.parse("342"),
    Decimal.parse("304"),
    Decimal.parse("266"),
    Decimal.parse("228"),
    Decimal.parse("190"),
    Decimal.parse("152"),
    Decimal.parse("114"),
    Decimal.parse("76"),
    Decimal.parse("38"),
    (Decimal.zero)
  ];

  static final Decimal ZAHL1 = Decimal.one;
  static final Decimal ZAHL2 = Decimal.parse("2");
  static final Decimal ZAHL5 = Decimal.parse("5");
  static final Decimal ZAHL7 = Decimal.parse("7");
  static final Decimal ZAHL12 = Decimal.parse("12");
  static final Decimal ZAHL100 = Decimal.parse("100");
  static final Decimal ZAHL360 = Decimal.parse("360");
  static final Decimal ZAHL500 = Decimal.parse("500");
  static final Decimal ZAHL700 = Decimal.parse("700");
  static final Decimal ZAHL1000 = Decimal.parse("1000");
  static final Decimal ZAHL10000 = Decimal.parse("10000");

  @override
  void setRe4(Decimal arg0) {
    RE4 = arg0;
  }

  @override
  void setPkpv(Decimal arg0) {
    PKPV = arg0;
  }

  @override
  void setAf(int arg0) {
    af = arg0;
  }

  @override
  void setSterbe(Decimal arg0) {
    STERBE = arg0;
  }

  @override
  void setStkl(int arg0) {
    STKL = arg0;
  }

  @override
  void setF(double arg0) {
    f = arg0;
  }

  @override
  void setAjahr(int arg0) {
    AJAHR = arg0;
  }

  @override
  void setJre4ent(Decimal arg0) {
    JRE4ENT = arg0;
  }

  @override
  void setPvs(int arg0) {
    PVS = arg0;
  }

  @override
  void setLzz(int arg0) {
    LZZ = arg0;
  }

  @override
  void setKrv(int arg0) {
    KRV = arg0;
  }

  @override
  void setKvz(Decimal arg0) {
    KVZ = arg0;
  }

  @override
  void setJhinzu(Decimal arg0) {
    JHINZU = arg0;
  }

  @override
  void setR(int arg0) {
    R = arg0;
  }

  @override
  void setPvz(int arg0) {
    PVZ = arg0;
  }

  @override
  void setZmvb(int arg0) {
    ZMVB = arg0;
  }

  @override
  void setLzzhinzu(Decimal arg0) {
    LZZHINZU = arg0;
  }

  @override
  void setSonstb(Decimal arg0) {
    SONSTB = arg0;
  }

  @override
  void setMbv(Decimal arg0) {
    MBV = arg0;
  }

  @override
  void setJvbez(Decimal arg0) {
    JVBEZ = arg0;
  }

  @override
  void setVbezm(Decimal arg0) {
    VBEZM = arg0;
  }

  @override
  void setVbs(Decimal arg0) {
    VBS = arg0;
  }

  @override
  void setAlter1(int arg0) {
    ALTER1 = arg0;
  }

  @override
  void setVbez(Decimal arg0) {
    VBEZ = arg0;
  }

  @override
  void setSonstent(Decimal arg0) {
    SONSTENT = arg0;
  }

  @override
  void setEntsch(Decimal arg0) {
    ENTSCH = arg0;
  }

  @override
  void setJfreib(Decimal arg0) {
    JFREIB = arg0;
  }

  @override
  void setVkapa(Decimal arg0) {
    VKAPA = arg0;
  }

  @override
  void setJre4(Decimal arg0) {
    JRE4 = arg0;
  }

  @override
  void setZkf(Decimal arg0) {
    ZKF = arg0;
  }

  @override
  void setLzzfreib(Decimal arg0) {
    LZZFREIB = arg0;
  }

  @override
  void setPkv(int arg0) {
    PKV = arg0;
  }

  @override
  void setPva(Decimal arg0) {
    PVA = arg0;
  }

  @override
  void setVjahr(int arg0) {
    VJAHR = arg0;
  }

  @override
  void setVbezs(Decimal arg0) {
    VBEZS = arg0;
  }

  @override
  void setVmt(Decimal arg0) {
    VMT = arg0;
  }

  @override
  Decimal getLstlzz() {
    return Decimal.parse(LSTLZZ.toString());
  }

  @override
  Decimal getVfrb() {
    return Decimal.parse(VFRB.toString());
  }

  @override
  Decimal getBk() {
    return Decimal.parse(BK.toString());
  }

  @override
  Decimal getSolzv() {
    return Decimal.parse(SOLZV.toString());
  }

  @override
  Decimal getBks() {
    return Decimal.parse(BKS.toString());
  }

  @override
  Decimal getBkv() {
    return Decimal.parse(BKV.toString());
  }

  @override
  Decimal getSolzs() {
    return Decimal.parse(SOLZS.toString());
  }

  @override
  Decimal getVfrbs2() {
    return Decimal.parse(VFRBS2.toString());
  }

  @override
  Decimal getVfrbs1() {
    return Decimal.parse(VFRBS1.toString());
  }

  @override
  Decimal getVkvlzz() {
    return Decimal.parse(VKVLZZ.toString());
  }

  @override
  Decimal getWvfrbm() {
    return Decimal.parse(WVFRBM.toString());
  }

  @override
  Decimal getSts() {
    return Decimal.parse(STS.toString());
  }

  @override
  Decimal getStv() {
    return Decimal.parse(STV.toString());
  }

  @override
  Decimal getVkvsonst() {
    return Decimal.parse(VKVSONST.toString());
  }

  @override
  Decimal getWvfrb() {
    return Decimal.parse(WVFRB.toString());
  }

  @override
  Decimal getSolzlzz() {
    return Decimal.parse(SOLZLZZ.toString());
  }

  @override
  Decimal getWvfrbo() {
    return Decimal.parse(WVFRBO.toString());
  }

  @override
  void main() {
    MPARA();
    MRE4JL();
    VBEZBSO = (Decimal.zero);
    KENNVMT = 0;
    MRE4();
    MRE4ABZ();
    MBERECH();
    MSONST();
    MVMT();
  }

  void MPARA() {
    if (KRV< 2) {
      if (KRV == 0) {
        BBGRV = Decimal.parse("90600");
      } else {
        BBGRV = Decimal.parse("89400");
      }
      RVSATZAN = Decimal.parse("0.093");
    } else {
      // Nichts zu tun
    }
    BBGKVPV = Decimal.parse("62100");
    KVSATZAN  = ((KVZ*ZAHL100/ (ZAHL2)).toDecimal()+ Decimal.parse("0.07"));
    KVSATZAG = (Decimal.parse("0.085") + Decimal.parse("0.07"));
    if (PVS == 1) {
      PVSATZAN = Decimal.parse("0.022");
      PVSATZAG = Decimal.parse("0.012");
    } else {
      PVSATZAN = Decimal.parse("0.017");
      PVSATZAG = Decimal.parse("0.017");
    }
    if (PVZ == 1) {
      PVSATZAN += Decimal.parse("0.006");
    } else {
      PVSATZAN -= PVA * Decimal.parse("0.0025");
    }
    W1STKL5 = Decimal.parse("13279");
    W2STKL5 = Decimal.parse("33380");
    W3STKL5 = Decimal.parse("222260");
    GFB = Decimal.parse("11604");
    SOLZFREI = Decimal.parse("18130");
  }

  void MRE4JL() {
    if (LZZ == 1) {
      ZRE4J = (RE4.divide(ZAHL100,2, Round.DOWN));
      ZVBEZJ = (VBEZ.divide(ZAHL100, 2, Round.DOWN));
      JLFREIB = (LZZFREIB.divide(ZAHL100,2, Round.DOWN));
      JLHINZU = (LZZHINZU.divide(ZAHL100, 2, Round.DOWN));

    } else if (LZZ == 2) {
      ZRE4J = ((RE4 * (ZAHL12).divide(ZAHL100, 2, Round.DOWN)));
      ZVBEZJ = ((VBEZ * (ZAHL12)).divide(ZAHL100, 2, Round.DOWN));
      JLFREIB = ((LZZFREIB * (ZAHL12)).divide(ZAHL100, 2, Round.DOWN));
      JLHINZU = ((LZZHINZU * (ZAHL12)).divide(ZAHL100, 2, Round.DOWN));
    } else if (LZZ == 3) {
      ZRE4J = ((RE4 * (ZAHL360)).divide(ZAHL700, 2, Round.DOWN));
      ZVBEZJ = ((VBEZ * (ZAHL360)).divide(ZAHL700, 2, Round.DOWN));
      JLFREIB = ((LZZFREIB * (ZAHL360)).divide(ZAHL700, 2, Round.DOWN));
      JLHINZU = ((LZZHINZU * (ZAHL360)).divide(ZAHL700, 2, Round.DOWN));
    } else {
      ZRE4J = ((RE4 * (ZAHL360)).divide(ZAHL100, 2, Round.DOWN));
      ZVBEZJ = ((VBEZ * (ZAHL360)).divide(ZAHL100, 2, Round.DOWN));
      JLFREIB = ((LZZFREIB * (ZAHL360)).divide(ZAHL100, 2, Round.DOWN));
      JLHINZU = ((LZZHINZU * (ZAHL360)).divide(ZAHL100, 2, Round.DOWN));
    }
    if (af == 0) {
      f = 1;
    }
  }

  void MRE4() {
    if (ZVBEZJ == (Decimal.zero)) {
      FVBZ = (Decimal.zero);
      FVB = (Decimal.zero);
      FVBZSO = (Decimal.zero);
      FVBSO = (Decimal.zero);
    } else {
      if (VJAHR < 2006) {
        J = 1;
      } else if (VJAHR < 2040) {
        J = VJAHR - 2004;
      } else {
        J = 36;
      }
      if (LZZ == 1) {
        VBEZB = (VBEZM * (Decimal.parse(ZMVB.toString())) + VBEZS);
        HFVB = ((TAB2[J] / ZAHL12) * Rational.fromInt(ZMVB)).toDecimal();
        FVBZ = ((TAB3[J] / ZAHL12) * Rational.fromInt(ZMVB)).toDecimal().setScale(0, Round.UP);

      } else {
        VBEZB = ((VBEZM * (ZAHL12)) + VBEZS).setScale(2, Round.UP);
        HFVB = TAB2[J];
        FVBZ = TAB3[J];
      }
      FVB = ((VBEZB * TAB1[J]) / (ZAHL100)).toDecimal().setScale(2, Round.UP);
      if (FVB > HFVB==1) {
        FVB = HFVB;
      }
      if (FVB > ZVBEZJ==1) {
        FVB = ZVBEZJ;
      }
      FVBSO =
      (FVB + ((VBEZBSO * TAB1[J]).divide(ZAHL100,2,Round.UP)));
      if (FVBSO > TAB2[J]==1) {
        FVBSO = TAB2[J];
      }
      HFVBZSO =
      (((VBEZB + VBEZBSO) / (ZAHL100)) - FVBSO.toRational()).toDecimal();
      FVBZSO = (FVBZ + (VBEZBSO / (ZAHL100)).toDecimal());
      if (FVBZSO > HFVBZSO) {
        FVBZSO = HFVBZSO.round_Up();
      }
      if(FVBZSO > HFVBZSO) {
        FVBZSO = TAB3[J];
      }
      HFVBZ = (((VBEZB / (ZAHL100)) - FVB.toRational()).toDecimal()).round_Down();
      if(FVBZ > HFVBZ) {
        FVBZ = HFVBZ.setScale(0, Round.UP);
      }
    }
    MRE4ALTE();
  }

  void MRE4ALTE() {
    if (ALTER1 == 0) {
      ALTE = (Decimal.zero);
    } else {
      if (AJAHR < 2006) {
        K = 1;
      } else if (AJAHR < 2040) {
        K = AJAHR - 2004;
      } else {
        K = 36;
      }
      BMG = ZRE4J - ZVBEZJ;
      ALTE = (BMG.multiply(TAB4[K],0,Round.UP));
      HBALTE = TAB5[K];
      if (ALTE > HBALTE) {
        ALTE = HBALTE;
      }
    }
  }

  void MRE4ABZ() {
    ZRE4 = ((ZRE4J - FVB - ALTE - JLFREIB + JLHINZU)).setScale(2, Round.DOWN);
    if (ZRE4 < Decimal.zero==-1) {
      ZRE4 = (Decimal.zero);
    }
    ZRE4VP = ZRE4J;
    if (KENNVMT == 2) {
      ZRE4VP = (ZRE4VP - (ENTSCH / (ZAHL100)).toDecimal()).setScale(2, Round.DOWN);
    }
    ZVBEZ = (ZVBEZJ - FVB).setScale(2, Round.DOWN);
    if (ZVBEZ < Decimal.zero ==-1) {
      ZVBEZ = (Decimal.zero);
    }
  }

  void MBERECH() {
    MZTABFB();
    VFRB = ((ANP + FVB + FVBZ) * (ZAHL100)).setScale(0,Round.DOWN);
    MLSTJAHR();
    WVFRB = ((ZVE - GFB) * (ZAHL100)).setScale(0, Round.DOWN);
    if (WVFRB < Decimal.zero==-1) {
      WVFRB = (Decimal.zero);
    }
    LSTJAHR = (ST * (Decimal.parse(f.toString()))).setScale(0,Round.DOWN);
    UPLSTLZZ();
    UPVKVLZZ();
    if (ZKF > (Decimal.zero)==1) {
      ZTABFB = ZTABFB + KFB;
      MRE4ABZ();
      MLSTJAHR();
      JBMG = (ST * (Decimal.parse(f.toString()))).setScale(0, Round.DOWN);
    } else {
      JBMG = LSTJAHR;
    }
    MSOLZ();
  }

  void MZTABFB() {
    ANP = (Decimal.zero);
    if (ZVBEZ > (Decimal.zero) && ZVBEZ < (FVBZ)) {
      FVBZ = Decimal.parse(ZVBEZ.toString());
    }
    if (STKL < 6) {
      if (ZVBEZ > (Decimal.zero)) {
        if ((ZVBEZ - FVBZ) < (Decimal.parse("102"))) {
          ANP = (ZVBEZ - FVBZ).setScale(0, Round.UP);
        } else {
          ANP = Decimal.parse("102");
        }
      }
    } else {
      FVBZ = (Decimal.zero);
      FVBZSO = (Decimal.zero);
    }
    if (STKL < 6) {
      if(ZRE4 > (ZVBEZ)) {
        if ((ZRE4 - ZVBEZ)<(Decimal.parse("1230"))) {
          ANP = ANP + (ZRE4 - ZVBEZ).setScale(0, Round.UP);
        } else {
          ANP = ANP + (Decimal.parse("1230"));
        }
      }
    }
    KZTAB = 1;
    if (STKL == 1) {
      SAP = Decimal.parse("36");
      KFB = (ZKF * (Decimal.parse("9312"))).setScale(0,Round.DOWN);
    } else if (STKL == 2) {
      EFA = Decimal.parse("4260");
      SAP = Decimal.parse("36");
      KFB = (ZKF * (Decimal.parse("9312"))).setScale(0,Round.DOWN);
    } else if (STKL == 3) {
      KZTAB = 2;
      SAP = Decimal.parse("36");
      KFB = (ZKF * (Decimal.parse("9312"))).setScale(0, Round.DOWN);
    } else if (STKL == 4) {
      SAP = Decimal.parse("36");
      KFB = (ZKF * (Decimal.parse("4656"))).setScale(0, Round.DOWN);
    } else if (STKL == 5) {
      SAP = Decimal.parse("36");
      KFB = (Decimal.zero);
    } else {
      KFB = (Decimal.zero);
    }
    ZTABFB = (EFA + ANP + SAP + FVBZ).setScale(2, Round.DOWN);
  }

  void MLSTJAHR() {
    UPEVP();
    if (KENNVMT != 1) {
      ZVE = (ZRE4 - ZTABFB - VSP).setScale(2, Round.DOWN);
      UPMLST();
    } else {
      ZVE = (ZRE4 - ZTABFB - VSP - (VMT / (ZAHL100)).toDecimal() -
          (VKAPA / (ZAHL100)).toDecimal()).setScale(2,Round.DOWN);
      if (ZVE < (Decimal.zero)) {
        ZVE = ((ZVE + (VMT / (ZAHL100)).toDecimal() +
            (VKAPA / (ZAHL100)).toDecimal()) / (ZAHL5)).toDecimal().setScale(2, Round.DOWN);
        UPMLST();
        ST = (ST.multiply(ZAHL5, 0, Round.DOWN));
      } else {
        UPMLST();
        STOVMT = ST;
        ZVE = (ZVE + ((VMT + VKAPA) / (ZAHL500)).toDecimal()).setScale(2, Round.DOWN);
        UPMLST();
        ST = (((ST - STOVMT) * (ZAHL5)) + STOVMT).setScale(0, Round.DOWN);
      }
    }
  }

  void UPVKVLZZ() {
    UPVKV();
    JW = VKV;
    UPANTEIL();
    VKVLZZ = ANTEIL1;
  }

  void UPVKV() {
    if (PKV > 0) {
      if (VSP2 > (VSP3)) {
        VKV = VSP2 * (ZAHL100);
      } else {
        VKV = VSP3 * (ZAHL100);
      }
    } else {
      VKV = (Decimal.zero);
    }
  }

  void UPLSTLZZ() {
    JW = LSTJAHR * (ZAHL100);
    UPANTEIL();
    LSTLZZ = ANTEIL1;
  }

  void UPMLST() {
    if (ZVE < (ZAHL1)) {
      ZVE = (Decimal.zero);
      X = (Decimal.zero);
    } else {
      X = (ZVE / (Decimal.parse(KZTAB.toString()))).toDecimal().setScale(0, Round.DOWN);
    }
    if (STKL < 5) {
      UPTAB24();
    } else {
      MST5_6();
    }
  }

  void UPEVP() {
    if (KRV > 1) {
      VSP1 = (Decimal.zero);
    } else {
      if(ZRE4VP > (BBGRV)) {
        ZRE4VP = BBGRV;
      }
      VSP1 = (ZRE4VP * RVSATZAN).setScale(2, Round.DOWN);
    }
    VSP2 = (ZRE4VP * (Decimal.parse("0.12"))).setScale(2, Round.DOWN);
    if (STKL == 3) {
      VHB = Decimal.parse("3000");
    } else {
      VHB = Decimal.parse("1900");
    }
    if (VSP2 > (VHB)) {
      VSP2 = VHB;
    }
    VSPN = (VSP1 + VSP2).setScale(0, Round.DOWN);
    MVSP();
    if (VSPN > (VSP)) {
      VSP = VSPN.setScale(2, Round.DOWN);
    }
  }

  void MVSP() {
    if (ZRE4VP > (BBGKVPV)) {
      ZRE4VP = BBGKVPV;
    }
    if (PKV > 0) {
      if (STKL == 6) {
        VSP3 = (Decimal.zero);
      } else {
        VSP3 = (PKPV * (ZAHL12) / (ZAHL100)).toDecimal();
        if (PKV == 2) {
          VSP3 = (VSP3 - (ZRE4VP * (KVSATZAG + PVSATZAG))).setScale(2, Round.DOWN);
        }
      }
    } else {
      VSP3 = (ZRE4VP * (KVSATZAN + PVSATZAN)).setScale(2, Round.DOWN);
    }
    VSP = (VSP3 + VSP1).setScale(0, Round.UP);
  }

  void MST5_6() {
    ZZX = X;
    if(ZZX > (W2STKL5)) {
      ZX = W2STKL5;
      UP5_6();
      if(ZZX > (W3STKL5)) {
        ST = ST + ((W3STKL5 - W2STKL5) * ((Decimal.parse("0.42")))).setScale(0, Round.DOWN);
        ST = ST + ((ZZX - W3STKL5) * ((Decimal.parse("0.45"))))
            .setScale(0, Round.DOWN);
      } else {
        ST = ST + ((ZZX - W2STKL5) * ((Decimal.parse("0.42"))))
            .setScale(0, Round.DOWN);
      }
    } else {
      ZX = ZZX;
      UP5_6();
      if(ZZX > (W1STKL5)) {
        VERGL = ST;
        ZX = W1STKL5;
        UP5_6();
        HOCH = ST + ((ZZX - W1STKL5) * ((Decimal.parse("0.42")))).setScale(0, Round.DOWN);
        if (HOCH < VERGL) {
          ST = HOCH;
        } else {
          ST = VERGL;
        }
      }
    }
  }

  void UP5_6() {
    X = (ZX * (Decimal.parse("1.25"))).setScale(2, Round.DOWN); // Änderung für 2024
    UPTAB24();
    ST1 = ST;
    X = (ZX * (Decimal.parse("0.75"))).setScale(2, Round.DOWN); // Änderung für 2024
    UPTAB24();
    ST2 = ST;
    DIFF = (ST1 - ST2) * (ZAHL2);
    MIST =
    (ZX * (Decimal.parse("0.14")).setScale(0, Round.DOWN));
    if (MIST > (DIFF)) {
    ST = MIST;
    } else {
    ST = DIFF;
    }
  }

  void MSOLZ() {
    SOLZFREI = (SOLZFREI * Decimal.parse(KZTAB.toString()));
    if (JBMG > (SOLZFREI)) {
      SOLZJ = (JBMG * (Decimal.parse("5.5"))/(ZAHL100)).toDecimal().setScale(2,Round.DOWN);
      SOLZMIN = ((JBMG - SOLZFREI) * (Decimal.parse("11.9"))/(ZAHL100)).toDecimal().setScale(2,Round.DOWN); // Änderung für 2021
      if (SOLZMIN < (SOLZJ)){
        SOLZJ = SOLZMIN;
      }
      JW = (SOLZJ * (ZAHL100)).setScale(0, Round.DOWN);
      UPANTEIL();
      SOLZLZZ = ANTEIL1;
    } else {
      SOLZLZZ = (Decimal.zero);
    }
    if (R > 0) {
      JW = JBMG * (ZAHL100);
      UPANTEIL();
      BK = ANTEIL1;
    } else {
      BK = (Decimal.zero);
    }
  }

  void UPANTEIL() {
    if (LZZ == 1) {
      ANTEIL1 = JW;
    } else if (LZZ == 2) {
      ANTEIL1 = JW.divide(ZAHL12, 0, Round.DOWN);
    } else if (LZZ == 3) {
      ANTEIL1 = ((JW * (ZAHL7))/(ZAHL360)).toDecimal().setScale(0, Round.DOWN);
    } else {
      ANTEIL1 = (JW / (ZAHL360)).toDecimal().setScale(0, Round.DOWN);
    }
  }

  void MSONST() {
    LZZ = 1;
    if (ZMVB == 0) {
      ZMVB = 12;
    }
    if (SONSTB == (Decimal.zero)&& MBV == (Decimal.zero)) { // neu für 2022
      VKVSONST = (Decimal.zero);
      LSTSO = (Decimal.zero);
      STS = (Decimal.zero);
      SOLZS = (Decimal.zero);
      BK = (Decimal.zero);
    } else {
      MOSONST();
      UPVKV();
      VKVSONST = VKV;
      ZRE4J = ((JRE4 + SONSTB) / (ZAHL100)).toDecimal().setScale(2,Round.DOWN);
      ZVBEZJ = ((JVBEZ + VBS) / (ZAHL100)).toDecimal().setScale(2,Round.DOWN);
      VBEZBSO = STERBE;
      MRE4SONST();
      MLSTJAHR();
      WVFRBM = ((ZVE - GFB) * (ZAHL100).setScale(2,Round.DOWN));
      if (WVFRBM < (Decimal.zero)) { // WVFRBM < 0
        WVFRBM = (Decimal.zero);
      }
      UPVKV();
      VKVSONST = VKV - VKVSONST;
      LSTSO = ST * (ZAHL100); // lt. PAP:  "Hinweis: negative Zahlen werden nach ihrem Betrag gerundet!"
      STS =
          ((LSTSO - LSTOSO) * (Decimal.parse(f.toString()))/ (ZAHL100)).toDecimal().setScale(0,Round.DOWN) * (ZAHL100); // Neu für 2022
      STSMIN();
    }
  }

  void STSMIN() {
    if (STS < (Decimal.zero)) { // STS < 0
      if (MBV == (Decimal.zero)) { // MBV = 0
        // absichtlich leer
      } else {
        LSTLZZ += STS;
        if (LSTLZZ < (Decimal.zero)) { // LSTLZZ < 0
          LSTLZZ = (Decimal.zero);
        }
        SOLZLZZ += (STS * (Decimal.parse("5.5"))/ (ZAHL100)).toDecimal().setScale(0,Round.DOWN);
        if (SOLZLZZ < (Decimal.zero)) { // SOLZLZZ < 0
          SOLZLZZ = (Decimal.zero);
        }
        BK += STS;
        if (BK < (Decimal.zero)) { // BK < 0
          BK = (Decimal.zero);
        }
      }
      STS = (Decimal.zero);
      SOLZS = (Decimal.zero);
    } else {
      MSOLZSTS();
    }
    if (R > 0) {
      BKS = STS;
    } else {
      BKS = (Decimal.zero);
    }
  }

  void MSOLZSTS() {
    if (ZKF > (Decimal.zero)) { // ZKF > 0
      SOLZSZVE = ZVE - KFB;
    } else {
      SOLZSZVE = ZVE;
    }
    if (SOLZSZVE < (Decimal.one)) { // SOLZSZVE < 1
      SOLZSZVE = (Decimal.zero);
      X = (Decimal.zero);
    } else {
      X = (SOLZSZVE / Decimal.parse(KZTAB.toString())).toDecimal().setScale(0, Round.DOWN);
    }
    if (STKL < 5) { // STKL < 5
      UPTAB24();
    } else {
      MST5_6();
    }
    SOLZSBMG = (ST * (Decimal.parse(f.toString()))).setScale(0, Round.DOWN);
    if (SOLZSBMG > (SOLZFREI)) { // SOLZSBMG > SOLZFREI
      SOLZS = (STS * (Decimal.parse("5.5")).divide(ZAHL100,0, Round.DOWN));
    } else {
      SOLZS = (Decimal.zero);
    }
  }

  void MVMT() {
    if (VKAPA < (Decimal.zero)) {
      VKAPA = (Decimal.zero);
    }
    if ((VMT + VKAPA) > (Decimal.zero)) {
      if (LSTSO == (Decimal.zero)) {
        MOSONST();
        LST1 = LSTOSO;
      } else {
        LST1 = LSTSO;
      }
      VBEZBSO = STERBE + VKAPA;
      ZRE4J = ((JRE4 + SONSTB + VMT + VKAPA)/(ZAHL100)).toDecimal().setScale(2, Round.DOWN);
      ZVBEZJ = ((JVBEZ + VBS + VKAPA)/(ZAHL100)).toDecimal().setScale(2,Round.DOWN);
      KENNVMT = 2;
      MRE4SONST();
      MLSTJAHR();
      LST3 = ST * (ZAHL100);
      MRE4ABZ();
      ZRE4VP = ZRE4VP - (JRE4ENT/ (ZAHL100)).toDecimal() - (SONSTENT/ (ZAHL100)).toDecimal();
      KENNVMT = 1;
      MLSTJAHR();
      LST2 = ST * (ZAHL100);
      STV = LST2 - LST1;
      LST3 = LST3 - LST1;
      if (LST3 < (STV)) {
        STV = LST3;
      }
      if (STV < (Decimal.zero)) {
        STV = (Decimal.zero);
      } else {
        STV = STV * (Decimal.parse(f.toString())).divide(ZAHL100, 0, Round.DOWN) *(ZAHL100);
      }
      SOLZVBMG = STV.divide(ZAHL100, 0, Round.DOWN) + JBMG;
      if (SOLZVBMG > (SOLZFREI)) { // SOLZVBMG > SOLZFREI
        SOLZV = (STV * (Decimal.parse("5.5")).divide(ZAHL100, 0, Round.DOWN));
      } else {
        SOLZV = (Decimal.zero);
      }
      if (R > 0) {
        BKV = STV;
      } else {
        BKV = (Decimal.zero);
      }
    } else {
      STV = (Decimal.zero);
      SOLZV = (Decimal.zero);
      BKV = (Decimal.zero);
    }
  }

  void MOSONST() {
    ZRE4J = JRE4.divide(ZAHL100,2, Round.DOWN);
    ZVBEZJ = JVBEZ.divide(ZAHL100,2, Round.DOWN);
    JLFREIB = JFREIB.divide(ZAHL100,2, Round.DOWN);
    JLHINZU = JHINZU.divide(ZAHL100,2, Round.DOWN);
    MRE4();
    MRE4ABZ();
    ZRE4VP = ZRE4VP - (JRE4ENT/(ZAHL100)).toDecimal();
    MZTABFB();
    VFRBS1 = ((ANP + FVB + FVBZ) * (ZAHL100)).setScale(2, Round.DOWN);
    MLSTJAHR();
    WVFRBO = ((ZVE - GFB) * (ZAHL100)).setScale(2, Round.DOWN);
    if (WVFRBO < (Decimal.zero)) {
      WVFRBO = (Decimal.zero);
    }
    LSTOSO = ST * (ZAHL100);
  }

  void MRE4SONST() {
    MRE4();
    FVB = FVBSO;
    MRE4ABZ(); // Änderung für 2022
    ZRE4VP = ZRE4VP + (MBV/(ZAHL100)).toDecimal() - (JRE4ENT / (ZAHL100)).toDecimal() - (SONSTENT / (ZAHL100)).toDecimal();
    FVBZ = FVBZSO;
    MZTABFB();
    VFRBS2 = (((ANP + FVB + FVBZ) * (ZAHL100)) - VFRBS1);
  }

  void UPTAB24() {
    if (X < (GFB + (ZAHL1))) {
      ST = (Decimal.zero);
    } else if (X < (Decimal.parse("17006"))) { // Geändert für 2024
      Y = (X - GFB).divide(ZAHL10000, 6, Round.DOWN);
      RW = Y * (Decimal.parse("922.98")); // Geändert für 2024
      RW = RW +Decimal.parse("1400");
      ST = ((RW * Y).setScale(0, Round.DOWN));
    } else if (X < Decimal.parse("66761")) { // Geändert für 2024
      Y = (X - (Decimal.parse("17005"))).divide(ZAHL10000, 6, Round.DOWN); // Geändert für 2024
      RW = Y * (Decimal.parse("181.19")); // Geändert für 2024
      RW = RW+(Decimal.parse("2397"));
      RW = RW*Y;
      ST = (RW + (Decimal.parse("1025.38"))).setScale(0, Round.DOWN); // Geändert für 2024
    } else if (X < Decimal.parse("277826")==-1) { // Geändert für 2022
      ST = (X * (Decimal.parse("0.42")) - (Decimal.parse("10602.13")).setScale(0, Round.DOWN)); // Geändert für 2024
    } else {
      ST = (X * (Decimal.parse("0.45")) - (Decimal.parse("18936.88")).setScale(0, Round.DOWN)); // Geändert für 2024

      }
    ST = ST * Decimal.parse(KZTAB.toString());
  }
}


