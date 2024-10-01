import 'package:big_decimal/big_decimal.dart';
import 'package:lohnsteuer/src/LohnsteuerInterface.dart';

class Lohnsteuer2024 implements LohnsteuerInterface {
  // EINGABEPARAMETER
  int af = 1;
  int AJAHR = 0;
  int ALTER1 = 0;
  double ENTSCH = 0.0;
  double f = 1.0;
  double JFREIB = 0.0;
  double JHINZU = 0.0;
  double JRE4 = 0.0;
  double JVBEZ = 0.0;
  int KRV = 0;
  double KVZ = 0.0;
  int LZZ = 0;
  double LZZFREIB = 0.0;
  double LZZHINZU = 0.0;
  double MBV = 0.0;
  double PKPV = 0.0;
  int PKV = 0;
  double PVA = 0.0;
  int PVS = 0;
  int PVZ = 0;
  int R = 0;
  double RE4 = 0.0;
  double SONSTB = 0.0;
  double STERBE = 0.0;
  int STKL = 0;
  double VBEZ = 0.0;
  double VBEZM = 0.0;
  double VBEZS = 0.0;
  double VBS = 0.0;
  int VJAHR = 0;
  double VKAPA = 0.0;
  double VMT = 0.0;
  double ZKF = 0.0;
  int ZMVB = 0;
  double JRE4ENT = 0.0;
  double SONSTENT = 0.0;

  // AUSGABEPARAMETER
  double BK = 0.0;
  double BKS = 0.0;
  double BKV = 0.0;
  double LSTLZZ = 0.0;
  double SOLZLZZ = 0.0;
  double SOLZS = 0.0;
  double SOLZV = 0.0;
  double STS = 0.0;
  double STV = 0.0;
  double VKVLZZ = 0.0;
  double VKVSONST = 0.0;

  // AUSGABEPARAMETER DBA
  double VFRB = 0.0;
  double VFRBS1 = 0.0;
  double VFRBS2 = 0.0;
  double WVFRB = 0.0;
  double WVFRBO = 0.0;
  double WVFRBM = 0.0;

  // INTERNE FELDER
  double ALTE = 0.0;
  double ANP = 0.0;
  double ANTEIL1 = 0.0;
  double BMG = 0.0;
  double BBGKVPV = 0.0;
  double BBGRV = 0.0;
  double DIFF = 0.0;
  double EFA = 0.0;
  double FVB = 0.0;
  double FVBSO = 0.0;
  double FVBZ = 0.0;
  double FVBZSO = 0.0;
  double GFB = 0.0;
  double HBALTE = 0.0;
  double HFVB = 0.0;
  double HFVBZ = 0.0;
  double HFVBZSO = 0.0;
  int J = 0;
  double JBMG = 0.0;
  double JLFREIB = 0.0;
  double JLHINZU = 0.0;
  double JW = 0.0;
  int K = 0;
  int KENNVMT = 0;
  double KFB = 0.0;
  double KVSATZAG = 0.0;
  double KVSATZAN = 0.0;
  int KZTAB = 0;
  double LSTJAHR = 0.0;
  double LST1 = 0.0;
  double LST2 = 0.0;
  double LST3 = 0.0;
  double LSTOSO = 0.0;
  double LSTSO = 0.0;
  double MIST = 0.0;
  double PVSATZAG = 0.0;
  double PVSATZAN = 0.0;
  double RVSATZAN = 0.0;
  double RW = 0.0;
  double SAP = 0.0;
  double SOLZFREI = 0.0;
  double SOLZJ = 0.0;
  double SOLZMIN = 0.0;
  double SOLZSBMG = 0.0;
  double SOLZSZVE = 0.0;
  double SOLZVBMG = 0.0;
  double ST = 0.0;
  double ST1 = 0.0;
  double ST2 = 0.0;
  double STOVMT = 0.0;
  double TBSVORV = 0.0;
  double VBEZB = 0.0;
  double VBEZBSO = 0.0;
  double VHB = 0.0;
  double VSP = 0.0;
  double VSPN = 0.0;
  double VSP1 = 0.0;
  double VSP2 = 0.0;
  double VSP3 = 0.0;
  double W1STKL5 = 0.0;
  double W2STKL5 = 0.0;
  double W3STKL5 = 0.0;
  double VSPMAX1 = 0.0;
  double VSPMAX2 = 0.0;
  double VSPO = 0.0;
  double VSPREST = 0.0;
  double VSPVOR = 0.0;
  double X = 0.0;
  double Y = 0.0;
  double ZRE4 = 0.0;
  double ZRE4J = 0.0;
  double ZRE4VP = 0.0;
  double ZTABFB = 0.0;
  double ZVBEZ = 0.0;
  double ZVBEZJ = 0.0;
  double ZVE = 0.0;
  double ZX = 0.0;
  double ZZX = 0.0;
  double HOCH = 0.0;
  double VERGL = 0.0;
  double VKV = 0.0;

  // KONSTANTEN
  static final List<double> TAB1 = [
    0.0,
    0.4,
    0.384,
    0.368,
    0.352,
    0.336,
    0.32,
    0.304,
    0.288,
    0.272,
    0.256,
    0.24,
    0.224,
    0.208,
    0.192,
    0.176,
    0.16,
    0.152,
    0.144,
    0.136,
    0.128,
    0.12,
    0.112,
    0.104,
    0.096,
    0.088,
    0.08,
    0.072,
    0.064,
    0.056,
    0.048,
    0.04,
    0.032,
    0.024,
    0.016,
    0.008,
    0.0
  ];

  static final List<double> TAB2 = [
    0, 3000, 2880, 2760, 2640, 2520, 2400, 2280, 2160, 2040, 1920, 1800, 1680,
    1560, 1440, 1320, 1200, 1140, 1080, 1020, 960, 900, 840, 780, 720, 660, 600,
    540, 480, 420, 360, 300, 240, 180, 120, 60, 0
  ];

  static final List<double> TAB3 = [
    0, 900, 864, 828, 792, 756, 720, 684, 648, 612, 576, 540, 504, 468, 432,
    396, 360, 342, 324, 306, 288, 270, 252, 234, 216, 198, 180, 162, 144, 126,
    108, 90, 72, 54, 36, 18, 0
  ];

  /** Tabelle fuer die Vomhundertsaetze des Altersentlastungsbetrags */

  static final List<BigDecimal> TAB4 =
  [
    BigDecimal.parse("0.0"),
    BigDecimal.parse("0.4"),
    BigDecimal.parse("0.384"),
    BigDecimal.parse("0.368"),
    BigDecimal.parse("0.352"),
    BigDecimal.parse("0.336"),
    BigDecimal.parse("0.32"),
    BigDecimal.parse("0.304"),
    BigDecimal.parse("0.288"),
    BigDecimal.parse("0.272"),
    BigDecimal.parse("0.256"),
    BigDecimal.parse("0.24"),
    BigDecimal.parse("0.224"),
    BigDecimal.parse("0.208"),
    BigDecimal.parse("0.192"),
    BigDecimal.parse("0.176"),
    BigDecimal.parse("0.16"),
    BigDecimal.parse("0.152"),
    BigDecimal.parse("0.144"),
    BigDecimal.parse("0.136"),
    BigDecimal.parse("0.128"),
    BigDecimal.parse("0.12"),
    BigDecimal.parse("0.112"),
    BigDecimal.parse("0.104"),
    BigDecimal.parse("0.096"),
    BigDecimal.parse("0.088"),
    BigDecimal.parse("0.08"),
    BigDecimal.parse("0.072"),
    BigDecimal.parse("0.064"),
    BigDecimal.parse("0.056"),
    BigDecimal.parse("0.048"),
    BigDecimal.parse("0.04"),
    BigDecimal.parse("0.032"),
    BigDecimal.parse("0.024"),
    BigDecimal.parse("0.016"),
    BigDecimal.parse("0.008"),
    BigDecimal.parse("0.0")
  ];

  static final List<BigInt> TAB5 = [
    (BigInt.zero),
    BigInt.from(1900),
    BigInt.from(1824),
    BigInt.from(1748),
    BigInt.from(1672),
    BigInt.from(1596),
    BigInt.from(1520),
    BigInt.from(1444),
    BigInt.from(1368),
    BigInt.from(1292),
    BigInt.from(1216),
    BigInt.from(1140),
    BigInt.from(1064),
    BigInt.from(988),
    BigInt.from(912),
    BigInt.from(836),
    BigInt.from(760),
    BigInt.from(722),
    BigInt.from(684),
    BigInt.from(646),
    BigInt.from(608),
    BigInt.from(570),
    BigInt.from(532),
    BigInt.from(494),
    BigInt.from(456),
    BigInt.from(418),
    BigInt.from(380),
    BigInt.from(342),
    BigInt.from(304),
    BigInt.from(266),
    BigInt.from(228),
    BigInt.from(190),
    BigInt.from(152),
    BigInt.from(114),
    BigInt.from(76),
    BigInt.from(38),
    (BigInt.zero)
  ];

  static final BigInt ZAHL1 = BigInt.one;
  static final BigInt ZAHL2 = BigInt.from(2);
  static final BigInt ZAHL5 = BigInt.from(5);
  static final BigInt ZAHL7 = BigInt.from(7);
  static final BigInt ZAHL12 = BigInt.from(12);
  static final BigInt ZAHL100 = BigInt.from(100);
  static final BigInt ZAHL360 = BigInt.from(360);
  static final BigInt ZAHL500 = BigInt.from(500);
  static final BigInt ZAHL700 = BigInt.from(700);
  static final BigInt ZAHL1000 = BigInt.from(1000);
  static final BigInt ZAHL10000 = BigInt.from(10000);

  void setRe4(BigDecimal arg0) {
    this.RE4 = arg0 as double;
  }

  void setPkpv(BigDecimal arg0) {
    this.PKPV = arg0 as double;
  }

  void setAf(int arg0) {
    this.af = arg0;
  }

  void setSterbe(BigDecimal arg0) {
    this.STERBE = arg0 as double;
  }

  void setStkl(int arg0) {
    this.STKL = arg0;
  }

  void setF(double arg0) {
    this.f = arg0;
  }

  void setAjahr(int arg0) {
    this.AJAHR = arg0;
  }

  void setJre4ent(BigDecimal arg0) {
    this.JRE4ENT = arg0 as double;
  }

  void setPvs(int arg0) {
    this.PVS = arg0;
  }

  void setLzz(int arg0) {
    this.LZZ = arg0;
  }

  void setKrv(int arg0) {
    this.KRV = arg0;
  }

  void setKvz(BigDecimal arg0) {
    this.KVZ = arg0 as double;
  }

  void setJhinzu(BigDecimal arg0) {
    this.JHINZU = arg0 as double;
  }

  void setR(int arg0) {
    this.R = arg0;
  }

  void setPvz(int arg0) {
    this.PVZ = arg0;
  }

  void setZmvb(int arg0) {
    this.ZMVB = arg0;
  }

  void setLzzhinzu(BigDecimal arg0) {
    this.LZZHINZU = arg0 as double;
  }

  void setSonstb(BigDecimal arg0) {
    this.SONSTB = arg0 as double;
  }

  void setMbv(BigDecimal arg0) {
    this.MBV = arg0 as double;
  }

  void setJvbez(BigDecimal arg0) {
    this.JVBEZ = arg0 as double;
  }

  void setVbezm(BigDecimal arg0) {
    this.VBEZM = arg0 as double;
  }

  void setVbs(BigDecimal arg0) {
    this.VBS = arg0 as double;
  }

  void setAlter1(int arg0) {
    this.ALTER1 = arg0;
  }

  void setVbez(BigDecimal arg0) {
    this.VBEZ = arg0 as double;
  }

  void setSonstent(BigDecimal arg0) {
    this.SONSTENT = arg0 as double;
  }

  void setEntsch(BigDecimal arg0) {
    this.ENTSCH = arg0 as double;
  }

  void setJfreib(BigDecimal arg0) {
    this.JFREIB = arg0 as double;
  }

  void setVkapa(BigDecimal arg0) {
    this.VKAPA = arg0 as double;
  }

  void setJre4(BigDecimal arg0) {
    this.JRE4 = arg0 as double;
  }

  void setZkf(BigDecimal arg0) {
    this.ZKF = arg0 as double;
  }

  void setLzzfreib(BigDecimal arg0) {
    this.LZZFREIB = arg0 as double;
  }

  void setPkv(int arg0) {
    this.PKV = arg0;
  }

  void setPva(BigDecimal arg0) {
    this.PVA = arg0 as double;
  }

  void setVjahr(int arg0) {
    this.VJAHR = arg0;
  }

  void setVbezs(BigDecimal arg0) {
    this.VBEZS = arg0 as double;
  }

  void setVmt(BigDecimal arg0) {
    this.VMT = arg0 as double;
  }

  BigDecimal getLstlzz() {
    return BigDecimal.parse(this.LSTLZZ.toString());
  }

  BigDecimal getVfrb() {
    return BigDecimal.parse(this.VFRB.toString());
  }

  BigDecimal getBk() {
    return BigDecimal.parse(this.BK.toString());
  }

  BigDecimal getSolzv() {
    return BigDecimal.parse(this.SOLZV.toString());
  }

  BigDecimal getBks() {
    return BigDecimal.parse(this.BKS.toString());
  }

  BigDecimal getBkv() {
    return BigDecimal.parse(this.BKV.toString());
  }

  BigDecimal getSolzs() {
    return BigDecimal.parse(this.SOLZS.toString());
  }

  BigDecimal getVfrbs2() {
    return BigDecimal.parse(this.VFRBS2.toString());
  }

  BigDecimal getVfrbs1() {
    return BigDecimal.parse(this.VFRBS1.toString());
  }

  BigDecimal getVkvlzz() {
    return BigDecimal.parse(this.VKVLZZ.toString());
  }

  BigDecimal getWvfrbm() {
    return BigDecimal.parse(this.WVFRBM.toString());
  }

  BigDecimal getSts() {
    return BigDecimal.parse(this.STS.toString());
  }

  BigDecimal getStv() {
    return BigDecimal.parse(this.STV.toString());
  }

  BigDecimal getVkvsonst() {
    return BigDecimal.parse(this.VKVSONST.toString());
  }

  BigDecimal getWvfrb() {
    return BigDecimal.parse(this.WVFRB.toString());
  }

  BigDecimal getSolzlzz() {
    return BigDecimal.parse(this.SOLZLZZ.toString());
  }

  BigDecimal getWvfrbo() {
    return BigDecimal.parse(this.WVFRBO.toString());
  }

  void main() {
    MPARA();
    MRE4JL();
    VBEZBSO = (BigInt.zero as double) as double;
    KENNVMT = 0;
    MRE4();
    MRE4ABZ();
    MBERECH();
    MSONST();
    MVMT();
  }

  void MPARA() {
    if (KRV < 2) {
      if (KRV == 0) {
        BBGRV = BigInt.from(90600) as double;
      } else {
        BBGRV = BigInt.from(89400) as double;
      }
      RVSATZAN = BigInt.from(93) as double;
    } else {
      // Nichts zu tun
    }
    BBGKVPV = BigInt.from(62100) as double;
    KVSATZAN = (KVZ / (ZAHL2 as double) / (ZAHL100 as double)) +
        (BigInt.from(7) as double);
    KVSATZAG = (BigInt.from(85) + BigInt.from(7)) as double;
    if (PVS == 1) {
      PVSATZAN = BigInt.from(22) as double;
      PVSATZAG = BigInt.from(12) as double;
    } else {
      PVSATZAN = BigInt.from(17) as double;
      PVSATZAG = BigInt.from(17) as double;
    }
    if (PVZ == 1) {
      PVSATZAN += BigInt.from(6) as double;
    } else {
      PVSATZAN -= PVA * (BigInt.from(25) as double);
    }
    W1STKL5 = BigInt.from(13279) as double;
    W2STKL5 = BigInt.from(33380) as double;
    W3STKL5 = BigInt.from(222260) as double;
    GFB = BigInt.from(11604) as double;
    SOLZFREI = BigInt.from(18130) as double;
  }

  void MRE4JL() {
    if (LZZ == 1) {
      ZRE4J = RE4 / (ZAHL100 as double);
      ZVBEZJ = VBEZ / (ZAHL100 as double);
      JLFREIB = LZZFREIB / (ZAHL100 as double);
      JLHINZU = LZZHINZU / (ZAHL100 as double);
    } else if (LZZ == 2) {
      ZRE4J = (RE4 * (ZAHL12 as double)) / (ZAHL100 as double);
      ZVBEZJ = (VBEZ * (ZAHL12 as double)) / (ZAHL100 as double);
      JLFREIB = (LZZFREIB * (ZAHL12 as double)) / (ZAHL100 as double);
      JLHINZU = (LZZHINZU * (ZAHL12 as double)) / (ZAHL100 as double);
    } else if (LZZ == 3) {
      ZRE4J = (RE4 * (ZAHL360 as double)) / (ZAHL700 as double);
      ZVBEZJ = (VBEZ * (ZAHL360 as double)) / (ZAHL700 as double);
      JLFREIB = (LZZFREIB * (ZAHL360 as double)) / (ZAHL700 as double);
      JLHINZU = (LZZHINZU * (ZAHL360 as double)) / (ZAHL700 as double);
    } else {
      ZRE4J = (RE4 * (ZAHL360 as double)) / (ZAHL100 as double);
      ZVBEZJ = (VBEZ * (ZAHL360 as double)) / (ZAHL100 as double);
      JLFREIB = (LZZFREIB * (ZAHL360 as double)) / (ZAHL100 as double);
      JLHINZU = (LZZHINZU * (ZAHL360 as double)) / (ZAHL100 as double);
    }
    if (af == 0) {
      f = 1;
    }
  }

  void MRE4() {
    if (ZVBEZJ == (BigInt.zero as double)) {
      FVBZ = (BigInt.zero as double) as double;
      FVB = (BigInt.zero as double) as double;
      FVBZSO = (BigInt.zero as double) as double;
      FVBSO = (BigInt.zero as double) as double;
    } else {
      if (VJAHR < 2006) {
        J = 1;
      } else if (VJAHR < 2040) {
        J = VJAHR - 2004;
      } else {
        J = 36;
      }
      if (LZZ == 1) {
        VBEZB = (VBEZM * (BigInt.from(ZMVB) as double) + VBEZS);
        HFVB = TAB2[J] / (ZAHL12 as double) * (BigInt.from(ZMVB) as double);
        FVBZ = (TAB3[J] / (ZAHL12 as double) * (BigInt.from(ZMVB) as double))
            .toInt() as double;
      } else {
        VBEZB = ((VBEZM * (ZAHL12 as double)) + VBEZS).toInt() as double;
        HFVB = TAB2[J];
        FVBZ = TAB3[J];
      }
      FVB = ((VBEZB * TAB1[J]) / (ZAHL100 as double)).toInt() as double;
      if (FVB > HFVB) {
        FVB = HFVB;
      }
      if (FVB > ZVBEZJ) {
        FVB = ZVBEZJ;
      }
      FVBSO =
      (FVB + ((VBEZBSO * TAB1[J]) / (ZAHL100 as double))).toInt() as double;
      if (FVBSO > TAB2[J]) {
        FVBSO = TAB2[J];
      }
      HFVBZSO =
      (((VBEZB + VBEZBSO) / (ZAHL100 as double)) - FVBSO).toInt() as double;
      FVBZSO = (FVBZ + (VBEZBSO / (ZAHL100 as double))).toInt() as double;
      if (FVBZSO > HFVBZSO) {
        FVBZSO = HFVBZSO.toInt() as double;
      }
      if (FVBZSO > TAB3[J]) {
        FVBZSO = TAB3[J];
      }
      HFVBZ = ((VBEZB / (ZAHL100 as double)) - FVB).toInt() as double;
      if (FVBZ > HFVBZ) {
        FVBZ = HFVBZ.toInt() as double;
      }
    }
    MRE4ALTE();
  }

  void MRE4ALTE() {
    if (ALTER1 == 0) {
      ALTE = (BigInt.zero as double) as double;
    } else {
      if (AJAHR < 2006) {
        K = 1;
      } else if (AJAHR < 2040) {
        K = AJAHR - 2004;
      } else {
        K = 36;
      }
      BMG = ZRE4J - ZVBEZJ;
      ALTE = (BMG * (TAB4[K] as double)).toInt() as double;
      HBALTE = TAB5[K] as double;
      if (ALTE > HBALTE) {
        ALTE = HBALTE;
      }
    }
  }

  void MRE4ABZ() {
    ZRE4 = (ZRE4J - FVB - ALTE - JLFREIB + JLHINZU).toInt() as double;
    if (ZRE4 < ((BigInt.zero as double) as double)) {
      ZRE4 = (BigInt.zero as double) as double;
    }
    ZRE4VP = ZRE4J;
    if (KENNVMT == 2) {
      ZRE4VP = (ZRE4VP - (ENTSCH / (ZAHL100 as double))).toInt() as double;
    }
    ZVBEZ = (ZVBEZJ - FVB).toInt() as double;
    if (ZVBEZ < (BigInt.zero as double)) {
      ZVBEZ = (BigInt.zero as double) as double;
    }
  }

  void MBERECH() {
    MZTABFB();
    VFRB = ((ANP + FVB + FVBZ) * (ZAHL100 as double)).toInt() as double;
    MLSTJAHR();
    WVFRB = ((ZVE - GFB) * (ZAHL100 as double)).toInt() as double;
    if (WVFRB < (BigInt.zero as double)) {
      WVFRB = (BigInt.zero as double) as double;
    }
    LSTJAHR = (ST * (BigInt.from(f) as double)).toInt() as double;
    UPLSTLZZ();
    UPVKVLZZ();
    if (ZKF > (BigInt.zero as double)) {
      ZTABFB = ZTABFB + KFB;
      MRE4ABZ();
      MLSTJAHR();
      JBMG = (ST * (BigInt.from(f) as double)).toInt() as double;
    } else {
      JBMG = LSTJAHR;
    }
    MSOLZ();
  }

  void MZTABFB() {
    ANP = (BigInt.zero as double) as double;
    if (ZVBEZ >= (BigInt.zero as double) && ZVBEZ < FVBZ) {
      FVBZ = BigInt.from(ZVBEZ.toInt()) as double;
    }
    if (STKL < 6) {
      if (ZVBEZ > (BigInt.zero as double)) {
        if ((ZVBEZ - FVBZ) < (BigInt.from(102) as double)) {
          ANP = (ZVBEZ - FVBZ).toInt() as double;
        } else {
          ANP = BigInt.from(102) as double;
        }
      }
    } else {
      FVBZ = (BigInt.zero as double) as double;
      FVBZSO = (BigInt.zero as double) as double;
    }
    if (STKL < 6) {
      if (ZRE4 > ZVBEZ) {
        if ((ZRE4 - ZVBEZ) < (BigInt.from(1230) as double)) {
          ANP = ANP + (ZRE4 - ZVBEZ).toInt();
        } else {
          ANP = ANP + (BigInt.from(1230) as double);
        }
      }
    }
    KZTAB = 1;
    if (STKL == 1) {
      SAP = BigInt.from(36) as double;
      KFB = (ZKF * (BigInt.from(9312) as double)).toInt() as double;
    } else if (STKL == 2) {
      EFA = BigInt.from(4260) as double;
      SAP = BigInt.from(36) as double;
      KFB = (ZKF * (BigInt.from(9312) as double)).toInt() as double;
    } else if (STKL == 3) {
      KZTAB = 2;
      SAP = BigInt.from(36) as double;
      KFB = (ZKF * (BigInt.from(9312) as double)).toInt() as double;
    } else if (STKL == 4) {
      SAP = BigInt.from(36) as double;
      KFB = (ZKF * (BigInt.from(4656) as double)).toInt() as double;
    } else if (STKL == 5) {
      SAP = BigInt.from(36) as double;
      KFB = (BigInt.zero as double) as double;
    } else {
      KFB = (BigInt.zero as double) as double;
    }
    ZTABFB = (EFA + ANP + SAP + FVBZ).toInt() as double;
  }

  void MLSTJAHR() {
    UPEVP();
    if (KENNVMT != 1) {
      ZVE = (ZRE4 - ZTABFB - VSP).toInt() as double;
      UPMLST();
    } else {
      ZVE = (ZRE4 - ZTABFB - VSP - (VMT / (ZAHL100 as double)) -
          (VKAPA / (ZAHL100 as double))).toInt() as double;
      if (ZVE < (BigInt.zero as double)) {
        ZVE = (ZVE + (VMT / (ZAHL100 as double)) +
            (VKAPA / (ZAHL100 as double))) / (ZAHL5 as double);
        UPMLST();
        ST = (ST * (ZAHL5 as double)).toInt() as double;
      } else {
        UPMLST();
        STOVMT = ST;
        ZVE = (ZVE + ((VMT + VKAPA) / (ZAHL500 as double))).toInt() as double;
        UPMLST();
        ST = (((ST - STOVMT) * (ZAHL5 as double)) + STOVMT).toInt() as double;
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
      if (VSP2 > VSP3) {
        VKV = VSP2 * (ZAHL100 as double);
      } else {
        VKV = VSP3 * (ZAHL100 as double);
      }
    } else {
      VKV = (BigInt.zero as double) as double;
    }
  }

  void UPLSTLZZ() {
    JW = LSTJAHR * (ZAHL100 as double);
    UPANTEIL();
    LSTLZZ = ANTEIL1;
  }

  void UPMLST() {
    if (ZVE < (ZAHL1 as double)) {
      ZVE = (BigInt.zero as double);
      X = (BigInt.zero as double);
    } else {
      X = (ZVE / (BigInt.from(KZTAB) as double)).toInt() as double;
    }
    if (STKL < 5) {
      UPTAB24();
    } else {
      MST5_6();
    }
  }

  void UPEVP() {
    if (KRV > 1) {
      VSP1 = (BigInt.zero as double);
    } else {
      if (ZRE4VP > BBGRV) {
        ZRE4VP = BBGRV;
      }
      VSP1 = (ZRE4VP * RVSATZAN).toInt() as double;
    }
    VSP2 = (ZRE4VP * (BigInt.from(12) as double)).toInt() as double;
    if (STKL == 3) {
      VHB = BigInt.from(3000) as double;
    } else {
      VHB = BigInt.from(1900) as double;
    }
    if (VSP2 > VHB) {
      VSP2 = VHB;
    }
    VSPN = (VSP1 + VSP2).toInt() as double;
    MVSP();
    if (VSPN > VSP) {
      VSP = VSPN.toInt() as double;
    }
  }

  void MVSP() {
    if (ZRE4VP > BBGKVPV) {
      ZRE4VP = BBGKVPV;
    }
    if (PKV > 0) {
      if (STKL == 6) {
        VSP3 = (BigInt.zero as double) as double;
      } else {
        VSP3 = PKPV * (ZAHL12 as double) / (ZAHL100 as double);
        if (PKV == 2) {
          VSP3 = (VSP3 - (ZRE4VP * (KVSATZAG + PVSATZAG))).toInt() as double;
        }
      }
    } else {
      VSP3 = (ZRE4VP * (KVSATZAN + PVSATZAN)).toInt() as double;
    }
    VSP = (VSP3 + VSP1).toInt() as double;
  }

  void MST5_6() {
    ZZX = X;
    if (ZZX > W2STKL5) {
      ZX = W2STKL5;
      UP5_6();
      if (ZZX > W3STKL5) {
        ST = (ST + ((W3STKL5 - W2STKL5) * ((BigInt.from(42)) as double))
            .toInt() as double);
        ST = (ST + ((ZZX - W3STKL5) * ((BigInt.from(45)) as double))
            .toInt() as double);
      } else {
        ST = (ST + ((ZZX - W2STKL5) * ((BigInt.from(42)) as double))
            .toInt() as double);
      }
    } else {
      ZX = ZZX;
      UP5_6();
      if (ZZX > W1STKL5) {
        VERGL = ST;
        ZX = W1STKL5;
        UP5_6();
        HOCH = (ST + ((ZZX - W1STKL5) * ((BigInt.from(42)) as double))
            .toInt() as double);
        if (HOCH < VERGL) {
          ST = HOCH;
        } else {
          ST = VERGL;
        }
      }
    }
  }

  void UP5_6() {
    X = (ZX * (BigInt.from(125) as double) ~/ (BigInt.from(100) as double))
        .toSigned(2) as double; // Änderung für 2024
    UPTAB24();
    ST1 = ST;
    X =
    (ZX * (BigInt.from(75) as double) ~/ (BigInt.from(100) as double)).toSigned(
        2) as double; // Änderung für 2024
    UPTAB24();
    ST2 = ST;
    DIFF = (ST1 - ST2) * (ZAHL2 as double);
    MIST =
    (ZX * (BigInt.from(14) as double) ~/ (BigInt.from(100) as double)).toSigned(
        0) as double;
    ST = (MIST > DIFF) ? MIST : DIFF;
  }

  void MSOLZ() {
    SOLZFREI = (SOLZFREI * KZTAB);
    if (JBMG > SOLZFREI) {
      SOLZJ = (JBMG * (BigInt.from(55) as double) ~/
          (ZAHL100.toSigned(2) as double) as double);
      SOLZMIN = ((JBMG - SOLZFREI) * (BigInt.from(119) as double) ~/
          (ZAHL100.toSigned(2) as double) as double); // Änderung für 2021
      if (SOLZMIN < SOLZJ) {
        SOLZJ = SOLZMIN;
      }
      JW = (SOLZJ * (ZAHL100.toSigned(0) as double));
      UPANTEIL();
      SOLZLZZ = ANTEIL1;
    } else {
      SOLZLZZ = (BigInt.zero as double) as double;
    }
    if (R > 0) {
      JW = JBMG * (ZAHL100 as double);
      UPANTEIL();
      BK = ANTEIL1;
    } else {
      BK = (BigInt.zero as double) as double;
    }
  }

  void UPANTEIL() {
    if (LZZ == 1) {
      ANTEIL1 = JW;
    } else if (LZZ == 2) {
      ANTEIL1 = (JW ~/ (ZAHL12 as double)) as double;
    } else if (LZZ == 3) {
      ANTEIL1 = ((JW * (ZAHL7 as double)) ~/ (ZAHL360 as double)) as double;
    } else {
      ANTEIL1 = (JW ~/ (ZAHL360 as double)) as double;
    }
  }

  void MSONST() {
    LZZ = 1;
    if (ZMVB == 0) {
      ZMVB = 12;
    }
    if (SONSTB == (BigInt.zero as double) &&
        MBV == (BigInt.zero as double)) { // neu für 2022
      VKVSONST = (BigInt.zero as double) as double;
      LSTSO = (BigInt.zero as double) as double;
      STS = (BigInt.zero as double) as double;
      SOLZS = (BigInt.zero as double) as double;
      BK = (BigInt.zero as double) as double;
    } else {
      MOSONST();
      UPVKV();
      VKVSONST = VKV;
      ZRE4J = ((JRE4 + SONSTB) ~/ (ZAHL100 as double)).toSigned(2) as double;
      ZVBEZJ = ((JVBEZ + VBS) ~/ (ZAHL100 as double)).toSigned(2) as double;
      VBEZBSO = STERBE;
      MRE4SONST();
      MLSTJAHR();
      WVFRBM = ((ZVE - GFB) * (ZAHL100 as double) ~/
          (BigInt.from(1).toSigned(2) as double) as double);
      if (WVFRBM < (BigInt.zero as double)) { // WVFRBM < 0
        WVFRBM = (BigInt.zero as double) as double;
      }
      UPVKV();
      VKVSONST = VKV - VKVSONST;
      LSTSO = ST *
          (ZAHL100 as double); // lt. PAP:  "Hinweis: negative Zahlen werden nach ihrem Betrag gerundet!"
      STS =
          (LSTSO - LSTOSO) * (BigInt.from(f) as double) ~/ (ZAHL100 as double) *
              (ZAHL100 as double); // Neu für 2022
      STSMIN();
    }
  }

  void STSMIN() {
    if (STS < (BigInt.zero as double)) { // STS < 0
      if (MBV == (BigInt.zero as double)) { // MBV = 0
        // absichtlich leer
      } else {
        LSTLZZ += STS;
        if (LSTLZZ < (BigInt.zero as double)) { // LSTLZZ < 0
          LSTLZZ = (BigInt.zero as double) as double;
        }
        SOLZLZZ +=
            (STS * (BigInt.from(55) as double) ~/ (ZAHL100 as double)).toSigned(
                0);
        if (SOLZLZZ < (BigInt.zero as double)) { // SOLZLZZ < 0
          SOLZLZZ = (BigInt.zero as double) as double;
        }
        BK += STS;
        if (BK < (BigInt.zero as double)) { // BK < 0
          BK = (BigInt.zero as double) as double;
        }
      }
      STS = (BigInt.zero as double) as double;
      SOLZS = (BigInt.zero as double) as double;
    } else {
      MSOLZSTS();
    }
    if (R > 0) {
      BKS = STS;
    } else {
      BKS = (BigInt.zero as double) as double;
    }
  }

  void MSOLZSTS() {
    if (ZKF > (BigInt.zero as double)) { // ZKF > 0
      SOLZSZVE = ZVE - KFB;
    } else {
      SOLZSZVE = ZVE;
    }
    if (SOLZSZVE < (BigInt.one as double)) { // SOLZSZVE < 1
      SOLZSZVE = (BigInt.zero as double) as double;
      X = (BigInt.zero as double) as double;
    } else {
      X = (SOLZSZVE ~/ KZTAB) as double;
    }
    if (STKL < 5) { // STKL < 5
      UPTAB24();
    } else {
      MST5_6();
    }
    SOLZSBMG = ST * (BigInt.from(f).toSigned(0) as double);
    if (SOLZSBMG > SOLZFREI) { // SOLZSBMG > SOLZFREI
      SOLZS =
      (STS * (BigInt.from(55) as double) ~/ (ZAHL100 as double)) as double;
    } else {
      SOLZS = (BigInt.zero as double) as double;
    }
  }

  void MVMT() {
    if (VKAPA < (BigInt.zero as double)) {
      VKAPA = (BigInt.zero as double) as double;
    }
    if ((VMT + VKAPA) > (BigInt.zero as double)) {
      if (LSTSO == (BigInt.zero as double)) {
        MOSONST();
        LST1 = LSTOSO;
      } else {
        LST1 = LSTSO;
      }
      VBEZBSO = STERBE + VKAPA;
      ZRE4J = ((JRE4 + SONSTB + VMT + VKAPA) ~/ (ZAHL100 as double)).toSigned(
          2) as double;
      ZVBEZJ =
      ((JVBEZ + VBS + VKAPA) ~/ (ZAHL100 as double)).toSigned(2) as double;
      KENNVMT = 2;
      MRE4SONST();
      MLSTJAHR();
      LST3 = ST * (ZAHL100 as double);
      MRE4ABZ();
      ZRE4VP = ZRE4VP - (JRE4ENT ~/ (ZAHL100 as double)) -
          (SONSTENT ~/ (ZAHL100 as double));
      KENNVMT = 1;
      MLSTJAHR();
      LST2 = ST * (ZAHL100 as double);
      STV = LST2 - LST1;
      LST3 = LST3 - LST1;
      if (LST3 < STV) {
        STV = LST3;
      }
      if (STV < (BigInt.zero as double)) {
        STV = (BigInt.zero as double) as double;
      } else {
        STV = STV * (BigInt.from(f) as double) ~/ (ZAHL100 as double) *
            (ZAHL100 as double);
      }
      SOLZVBMG = STV ~/ (ZAHL100 as double) + JBMG;
      if (SOLZVBMG > SOLZFREI) { // SOLZVBMG > SOLZFREI
        SOLZV =
        (STV * (BigInt.from(55) as double) ~/ (ZAHL100 as double)) as double;
      } else {
        SOLZV = (BigInt.zero as double) as double;
      }
      if (R > 0) {
        BKV = STV;
      } else {
        BKV = (BigInt.zero as double) as double;
      }
    } else {
      STV = (BigInt.zero as double) as double;
      SOLZV = (BigInt.zero as double) as double;
      BKV = (BigInt.zero as double) as double;
    }
  }

  void MOSONST() {
    ZRE4J = (JRE4 ~/ (ZAHL100 as double)).toSigned(2) as double;
    ZVBEZJ = (JVBEZ ~/ (ZAHL100 as double)).toSigned(2) as double;
    JLFREIB = (JFREIB ~/ (ZAHL100 as double)) as double;
    JLHINZU = (JHINZU ~/ (ZAHL100 as double)) as double;
    MRE4();
    MRE4ABZ();
    ZRE4VP = ZRE4VP - (JRE4ENT ~/ (ZAHL100 as double));
    MZTABFB();
    VFRBS1 = ((ANP + FVB + FVBZ) * (ZAHL100.toSigned(2) as double));
    MLSTJAHR();
    WVFRBO = ((ZVE - GFB) * (ZAHL100.toSigned(2) as double));
    if (WVFRBO < (BigInt.zero as double)) {
      WVFRBO = (BigInt.zero as double) as double;
    }
    LSTOSO = ST * (ZAHL100 as double);
  }

  void MRE4SONST() {
    MRE4();
    FVB = FVBSO;
    MRE4ABZ(); // Änderung für 2022
    ZRE4VP = ZRE4VP + (MBV ~/ (ZAHL100 as double)) -
        (JRE4ENT ~/ (ZAHL100 as double)) - (SONSTENT ~/ (ZAHL100 as double));
    FVBZ = FVBZSO;
    MZTABFB();
    VFRBS2 = (((ANP + FVB + FVBZ) * (ZAHL100 as double)) - VFRBS1);
  }

  void UPTAB24() {
    if (X < (GFB + (ZAHL1 as double))) {
      ST = (BigInt.zero as double) as double;
    } else if (X < (BigInt.from(17006) as double)) { // Geändert für 2024
      var Y = (X - GFB) ~/ (ZAHL10000 as double);
      var RW = Y * (BigInt.from(92298) as double) ~/
          (BigInt.from(100) as double); // Geändert für 2024
      RW += BigInt.from(1400) as int;
      ST = ((RW * Y).toSigned(0) as double);
    } else if (X < (BigInt.from(66761) as double)) { // Geändert für 2024
      var Y = (X - (BigInt.from(17005) as double)) ~/
          (ZAHL10000 as double); // Geändert für 2024
      var RW = Y * (BigInt.from(18119) as double) ~/
          (BigInt.from(100) as double); // Geändert für 2024
      RW += (BigInt.from(2397) as double) as int;
      RW *= Y;
      ST = ((RW + (BigInt.from(102538) as double)) ~/
          (BigInt.from(100) as double) as double); // Geändert für 2024
    } else if (X < (BigInt.from(277826) as double)) { // Geändert für 2022
      ST = (X * ((BigInt.from(42) as double) ~/ (BigInt.from(100) as double))) -
          ((BigInt.from(1060213) as double) ~/
              (BigInt.from(100) as double)); // Geändert für 2024
    } else {
      ST = (X * ((BigInt.from(45) as double) ~/ (BigInt.from(100) as double)) -
          ((BigInt.from(1893688) as double) ~/
              (BigInt.from(100) as double))); // Geändert für 2024
    }
    ST = ST * KZTAB;
  }
}


